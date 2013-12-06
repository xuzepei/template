//
//  RCAnLiDetailViewController.h
//  RCTemplate
//
//  Created by xuzepei on 12/5/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCPublicViewController.h"
#import "RCAnLiDetailView.h"

@interface RCAnLiDetailViewController : RCPublicViewController

@property(nonatomic,retain)UIScrollView* scrollView;
@property(nonatomic,retain)RCAnLiDetailView* detailView;
@property(nonatomic,retain)NSDictionary* item;
@property(nonatomic,assign)BOOL showTabBarWhenQuit;

@end
