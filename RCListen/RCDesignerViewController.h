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
#import "RCPhoneView.h"

@interface RCDesignerViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>

@property(nonatomic,retain)UITableView* tableView;
@property(nonatomic,retain)NSMutableArray* itemArray;

@property(nonatomic,retain)UIButton* favoriteButton;
@property(nonatomic,retain)UIImage* headerImage;
@property(nonatomic,retain)RCTabBar3* tabBar;
@property(nonatomic,retain)NSDictionary* item;
@property(nonatomic,retain)RCScrollTextView* scrollTextView;
@property(nonatomic,retain)RCPhoneView* phoneView;

- (void)updateContent:(NSDictionary*)item;

@end
