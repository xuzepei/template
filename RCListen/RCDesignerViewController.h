//
//  RCDesignerViewController.h
//  RCTemplate
//
//  Created by xuzepei on 12/3/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCTabBar3.h"
#import "RCScrollTextView.h"

@interface RCDesignerViewController : UIViewController

@property(nonatomic,retain)UIButton* favoriteButton;
@property(nonatomic,retain)UIImage* headerImage;
@property(nonatomic,retain)RCTabBar3* tabBar;
@property(nonatomic,retain)NSDictionary* item;
@property(nonatomic,retain)RCScrollTextView* scrollTextView;

- (void)updateContent:(NSDictionary*)item;

@end
