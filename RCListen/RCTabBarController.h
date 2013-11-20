//
//  RCTabBarController.h
//  RCTemplate
//
//  Created by xuzepei on 11/20/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCTabBar.h"

@interface RCTabBarController : UIViewController<RCTabBarDelegate>

@property(nonatomic,retain)NSMutableArray* itemArray;
@property(nonatomic,retain)UIViewController* selectedViewController;
@property(nonatomic,assign)int selectedIndex;
@property(nonatomic,retain)RCTabBar* tabBar;

- (void)addItems:(NSArray*)array;
- (void)clickedTabBarItem:(int)index;

@end
