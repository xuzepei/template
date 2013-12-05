//
//  RCAboutViewController.h
//  RCTemplate
//
//  Created by xuzepei on 12/5/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCPublicViewController.h"
#import "RCAboutView.h"

@interface RCAboutViewController : RCPublicViewController

@property(nonatomic,retain)UIScrollView* scrollView;
@property(nonatomic,retain)RCAboutView* detailView;
@property(nonatomic,retain)NSDictionary* item;

@end
