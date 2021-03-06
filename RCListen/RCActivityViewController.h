//
//  RCActivityViewController.h
//  RCTemplate
//
//  Created by xuzepei on 11/25/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCPublicViewController.h"

@interface RCActivityViewController : RCPublicViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>

@property(nonatomic,retain)UITableView* tableView;
@property(nonatomic,retain)NSMutableArray* itemArray;
@property(nonatomic,retain)UIButton* userButton;
@property(nonatomic,retain)UIButton* searchButton;

- (void)updateContent;

@end
