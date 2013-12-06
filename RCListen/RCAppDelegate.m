//
//  RCAppDelegate.m
//  RCFang
//
//  Created by xuzepei on 1/14/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCAppDelegate.h"
#import "RCTool.h"
#import "RCHttpRequest.h"
#import "BPush.h"

#define UPDATE_TAG 122

@implementation RCAppDelegate
@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (void)dealloc
{
    [_window release];
    [_managedObjectContext release];
    [_managedObjectModel release];
    [_persistentStoreCoordinator release];
    
    self.vc0 = nil;
    self.vc1 = nil;
    self.vc2 = nil;
    self.vc3 = nil;
    self.vc4 = nil;
    
    self.nc0 = nil;
    self.nc1 = nil;
    self.nc2 = nil;
    self.nc3 = nil;
    self.nc4 = nil;
    
    self.tabBarController = nil;
    
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIApplication* app = [UIApplication sharedApplication];
	app.applicationIconBadgeNumber = 0;
	[app registerForRemoteNotificationTypes:
	 (UIRemoteNotificationType)(UIRemoteNotificationTypeAlert|UIRemoteNotificationTypeBadge|UIRemoteNotificationTypeSound)];
    
    
    //显示Status Bar for iOS6
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    
//for baidu push
//    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    
    [BPush setupChannel:launchOptions];
    [BPush setDelegate:self];
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    _vc0 = [[RCHomeViewController alloc] initWithNibName:nil bundle:nil];
	_nc0 = [[UINavigationController alloc]
                                 initWithRootViewController:_vc0];
    _nc0.navigationBar.tintColor = NAVIGATION_BAR_COLOR;
    
    _vc1 = [[RCAnLiViewController alloc] initWithNibNameForTabBar:nil bundle:nil];
    
	_nc1 = [[UINavigationController alloc]
            initWithRootViewController:_vc1];
    [_nc1.navigationController setNavigationBarHidden:YES animated:NO];
    
    _vc2 = [[RCActivityViewController alloc] initWithNibName:nil bundle:nil];
  
	_nc2 = [[UINavigationController alloc]
            initWithRootViewController:_vc2];
    _nc2.navigationBar.tintColor = NAVIGATION_BAR_COLOR;
    
    _vc3 = [[RCShopViewController alloc] initWithNibName:nil bundle:nil];
    
	_nc3 = [[UINavigationController alloc]
            initWithRootViewController:_vc3];
    [_nc3.navigationController setNavigationBarHidden:YES animated:NO];
    
    _vc4 = [[RCServiceViewController alloc] initWithNibName:nil bundle:nil];
    
	_nc4 = [[UINavigationController alloc]
            initWithRootViewController:_vc4];
    [_nc4.navigationController setNavigationBarHidden:YES animated:NO];
    
    
    _tabBarController = [[RCTabBarController alloc] initWithNibName:nil bundle:nil];
    
    NSArray* array = [[NSArray alloc] initWithObjects:
                      _nc0,
                      _nc1,
                      _nc2,
                      _nc3,
                      _nc4,nil];
    
	[_tabBarController addItems:array];
	[array release];
    self.window.rootViewController = _tabBarController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    UIApplication* app = [UIApplication sharedApplication];
	app.applicationIconBadgeNumber = 0;
	[app registerForRemoteNotificationTypes:
	 (UIRemoteNotificationType)(UIRemoteNotificationTypeAlert|UIRemoteNotificationTypeBadge|UIRemoteNotificationTypeSound)];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"RCTemplate" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"RCTemplate.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


#pragma mark - Push Notification

- (void)sendProviderDeviceToken:(NSData*)devToken
{
	if(nil == devToken)
		return;
    
    NSString* temp = [devToken description];
	NSString* token = [temp stringByTrimmingCharactersInSet:
					   [NSCharacterSet characterSetWithCharactersInString:@"<>"]];
	NSLog(@"token:%@",token);
    
	token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    [RCTool setDeviceToken:token];
    
    NSString* urlString = [NSString stringWithFormat:@"%@/ad.php?apiid=%@&pwd=%@&type=index&iostoken=%@",BASE_URL,APIID,PWD,token];
    
    RCHttpRequest* temp2 = [[[RCHttpRequest alloc] init] autorelease];
    [temp2 request:urlString delegate:self resultSelector:nil token:nil];
}

- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)devToken
{
    //for baidu push
    [BPush registerDeviceToken:devToken];
    [BPush bindChannel];
    
    //[self sendProviderDeviceToken: devToken];
}

- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)err
{
    NSLog(@"Error in registration. Error: %@", err);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
	NSLog(@"%@",[userInfo valueForKeyPath:@"aps.alert"]);
	
	UIApplication* app = [UIApplication sharedApplication];
	if(app.applicationIconBadgeNumber)
		app.applicationIconBadgeNumber = 0;
	else
	{
		NSString* message = [userInfo valueForKeyPath:@"aps.alert"];
		if([message length])
		{
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle: APP_NAME
															message: message delegate: self
												  cancelButtonTitle: @"确定"
												  otherButtonTitles: nil];
			[alert show];
			[alert release];
		}
	}
}


- (void) onMethod:(NSString*)method response:(NSDictionary*)data {
    NSLog(@"On method:%@", method);
    NSLog(@"data:%@", [data description]);
}


@end
