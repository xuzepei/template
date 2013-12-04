//
//  RCHomeViewController.h
//  RCTemplate
//
//  Created by xuzepei on 11/25/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCPublicViewController.h"
#import "RCBannerScrollView.h"

@interface RCHomeViewController : RCPublicViewController<UIScrollViewDelegate>

@property(nonatomic,retain)UIScrollView* scrollView;
@property(nonatomic,retain)RCBannerScrollView* bannerScrollView;
@property(nonatomic,retain)UIButton* userButton;
@property(nonatomic,retain)UIButton* searchButton;

@end
