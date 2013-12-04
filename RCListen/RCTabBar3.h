//
//  RCTabBar3.h
//  RCTemplate
//
//  Created by xuzepei on 12/3/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RCTabBar3Delegate <NSObject>

@optional
- (void)clickedTabBarItem:(int)index token:(id)token;

@end

@interface RCTabBar3 : UIView

@property(nonatomic,retain)NSMutableArray* itemArray;
@property(assign)id delegate;
@property(nonatomic,retain)UIView* underlineView;
@property(assign)int selectedIndex;

- (void)updateContent;

@end
