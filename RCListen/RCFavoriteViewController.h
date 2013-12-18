//
//  RCFavoriteViewController.h
//  RCTemplate
//
//  Created by xuzepei on 12/18/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCPublicViewController.h"

@interface RCFavoriteViewController : RCPublicViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,retain)UITableView* tableView;
@property(nonatomic,retain)NSMutableArray* itemArray;
@property(nonatomic,retain)UIButton* userButton;
@property(nonatomic,retain)UIButton* searchButton;

- (id)initWithNibNameForTabBar:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
- (void)updateContent;

@end
