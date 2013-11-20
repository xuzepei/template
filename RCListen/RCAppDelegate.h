//
//  RCAppDelegate.h
//  RCFang
//
//  Created by xuzepei on 1/14/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCTabBarController.h"

@interface RCAppDelegate : UIResponder <UIApplicationDelegate,UIAlertViewDelegate>
{
    UIBackgroundTaskIdentifier _bgTask;
}

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic,retain)UIViewController* vc0;
@property (nonatomic,retain)UIViewController* vc1;
@property (nonatomic,retain)UIViewController* vc2;
@property (nonatomic,retain)UIViewController* vc3;
@property (nonatomic,retain)UIViewController* vc4;

@property (nonatomic,retain)UINavigationController* nc0;
@property (nonatomic,retain)UINavigationController* nc1;
@property (nonatomic,retain)UINavigationController* nc2;
@property (nonatomic,retain)UINavigationController* nc3;
@property (nonatomic,retain)UINavigationController* nc4;

@property (nonatomic,retain)RCTabBarController* tabBarController;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
