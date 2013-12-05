//
//  RCTabBar4.h
//  RCTemplate
//
//  Created by xuzepei on 12/5/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RCTabBar4Delegate <NSObject>

@optional
- (void)clickedTabBarItem:(int)index token:(id)token;

@end

@interface RCTabBar4 : UIView

@property(nonatomic,retain)NSMutableArray* itemArray;
@property(assign)id delegate;
@property(nonatomic,retain)UIView* underlineView;
@property(assign)int selectedIndex;

- (void)updateContent;

@end
