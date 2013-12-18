//
//  RCServiceViewController.h
//  RCTemplate
//
//  Created by xuzepei on 11/25/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCPublicViewController.h"

@interface RCServiceViewController : RCPublicViewController<UIScrollViewDelegate,UIAlertViewDelegate>

@property(nonatomic,retain)UIButton* userButton;
@property(nonatomic,retain)UIButton* searchButton;
@property(nonatomic,retain)UIScrollView* scrollView;
@property(nonatomic,retain)NSMutableArray* itemArray;
@property(nonatomic,retain)UIPageControl* pageControl;
@property(assign)int currentIndex;

@end
