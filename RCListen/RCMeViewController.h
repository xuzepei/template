//
//  RCMeViewController.h
//  RCTemplate
//
//  Created by xuzepei on 11/25/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCPublicViewController.h"

@interface RCMeViewController : RCPublicViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,retain)UITableView* tableView;
@property(nonatomic,retain)NSMutableArray* itemArray;
@property(nonatomic,retain)UILabel* weixinhaoLabel;
@property(nonatomic,retain)UILabel* jifenLabel;

- (void)updateContent;

@end
