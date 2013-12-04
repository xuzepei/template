//
//  RCAppDelegate.h
//  RCFang
//
//  Created by xuzepei on 1/14/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCTabBarController.h"
#import "RCHomeViewController.h"
#import "RCActivityViewController.h"
#import "RCShopViewController.h"
#import "RCMeViewController.h"
#import "RCServiceViewController.h"

@interface RCAppDelegate : UIResponder <UIApplicationDelegate,UIAlertViewDelegate>
{
    UIBackgroundTaskIdentifier _bgTask;
}

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic,retain)RCHomeViewController* vc0;
@property (nonatomic,retain)RCActivityViewController* vc1;
@property (nonatomic,retain)RCShopViewController* vc2;
@property (nonatomic,retain)RCMeViewController* vc3;
@property (nonatomic,retain)RCServiceViewController* vc4;

@property (nonatomic,retain)UINavigationController* nc0;
@property (nonatomic,retain)UINavigationController* nc1;
@property (nonatomic,retain)UINavigationController* nc2;
@property (nonatomic,retain)UINavigationController* nc3;
@property (nonatomic,retain)UINavigationController* nc4;

@property (nonatomic,retain)RCTabBarController* tabBarController;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
