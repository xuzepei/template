//
//  RCActivityDetailViewController.h
//  RCTemplate
//
//  Created by xuzepei on 12/6/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCPublicViewController.h"
#import "RCActivityDetailView.h"

@interface RCActivityDetailViewController : RCPublicViewController

@property(nonatomic,retain)UIScrollView* scrollView;
@property(nonatomic,retain)RCActivityDetailView* detailView;
@property(nonatomic,retain)NSDictionary* item;

@end
