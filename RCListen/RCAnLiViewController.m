//
//  RCAnLiViewController.m
//  RCTemplate
//
//  Created by xuzepei on 12/5/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCAnLiViewController.h"
#import "RCPublicCell.h"
#import "RCAnLiDetailViewController.h"
#import "RCSearchViewController.h"
#import "RCMeViewController.h"
#import "RCLoginViewController.h"

@interface RCAnLiViewController ()

@end

@implementation RCAnLiViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        [self setTitle:@"设计案例"];
    }
    return self;
}

- (id)initWithNibNameForTabBar:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        [self setTitle:@"工长大本营"];
        CGRect rect = self.titleView.titleLabel.frame;
        rect.origin.x = 10.0f;
        self.titleView.titleLabel.frame = rect;
        self.titleView.titleLabel.textAlignment = NSTextAlignmentLeft;
        
        self.userButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.userButton.frame = CGRectMake(210,2, 40, 40);
        [self.userButton setImage:[UIImage imageNamed:@"user_button"] forState:UIControlStateNormal];
        [self.userButton addTarget:self action:@selector(clickedUserButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.navigationItem.titleView addSubview:self.userButton];
        
        self.searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.searchButton.frame = CGRectMake(260,2, 40, 40);
        [self.searchButton setImage:[UIImage imageNamed:@"search_button"] forState:UIControlStateNormal];
        [self.searchButton addTarget:self action:@selector(clickedSearchButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.navigationItem.titleView addSubview:self.searchButton];
        
        if(self.backButton)
            [self.backButton removeFromSuperview];
        
        if(_tableView)
        _tableView.frame = CGRectMake(0,40,[RCTool getScreenSize].width,[RCTool getScreenSize].height - (NAVIGATION_BAR_HEIGHT+STATUS_BAR_HEIGHT + 40 + TAB_BAR_HEIGHT));
        
        self.forTabBar = YES;
        
    }
    return self;
}

- (void)dealloc
{
    self.tableView = nil;
    self.itemArray = nil;
    self.tabBar = nil;
    self.userButton = nil;
    self.searchButton = nil;
    
    [super dealloc];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if(_tableView)
        [_tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [RCTool hideTabBar:YES];
    
    //添加自定义的返回按钮
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backButton.tag = 10000;
    self.backButton.frame = CGRectMake(-6,2, 40, 40);
    [self.backButton setImage:[UIImage imageNamed:@"back_button"] forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(clickedBackButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem.titleView addSubview: self.backButton];
    
    [self initTabBar];
    
    [self initTableView];
    
    [self updateContent];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)clickedBackButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
    [RCTool hideTabBar:NO];
}

- (void)clickedUserButton:(id)sender
{
    NSLog(@"clickedUserButton");
    
    if([RCTool isLogin])
    {
        RCMeViewController* temp = [[RCMeViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:temp animated:YES];
        [temp release];
    }
    else
    {
        RCLoginViewController* temp = [[RCLoginViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:temp animated:YES];
        [temp release];
    }
}

- (void)clickedSearchButton:(id)sender
{
    NSLog(@"clickedSearchButton");
    
    RCSearchViewController* searchViewController = [[RCSearchViewController alloc] initWithNibName:nil bundle:nil];
    
    UINavigationController* temp = [[[UINavigationController alloc] initWithRootViewController:searchViewController] autorelease];
    [searchViewController release];
    
    [self presentViewController:temp animated:YES completion:nil];
    
}

- (void)initTabBar
{
    if(nil == _tabBar)
    {
        _tabBar = [[RCTabBar4 alloc] initWithFrame:CGRectMake(0,0,[RCTool getScreenSize].width, 40)];
        _tabBar.delegate = self;
    }
    
    [_tabBar updateContent];
    
    [self.view addSubview:_tabBar];
}

- (void)clickedTabBarItem:(int)index token:(id)token
{
    NSLog(@"clickedTabBarItem:%d",index);
}

- (void)updateContent
{
    if(nil == _itemArray)
        _itemArray = [[NSMutableArray alloc] init];
    
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"0" forKey:@"id"];
    [dict setObject:@"0" forKey:@"f_type"];
    [dict setObject:@"现代简欧风 真皮淡雅舒适感觉" forKey:@"desc"];
    [_itemArray addObject:dict];
    [dict release];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"1" forKey:@"id"];
    [dict setObject:@"0" forKey:@"f_type"];
    [dict setObject:@"现代简欧风 真皮淡雅舒适感觉" forKey:@"desc"];
    [_itemArray addObject:dict];
    [dict release];
    
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"2" forKey:@"id"];
    [dict setObject:@"0" forKey:@"f_type"];
    [dict setObject:@"现代简欧风 真皮淡雅舒适感觉" forKey:@"desc"];
    [_itemArray addObject:dict];
    [dict release];
    
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"3" forKey:@"id"];
    [dict setObject:@"0" forKey:@"f_type"];
    [dict setObject:@"现代简欧风 真皮淡雅舒适感觉" forKey:@"desc"];
    [_itemArray addObject:dict];
    [dict release];
    
    if(_tableView)
        [_tableView reloadData];
}

#pragma mark - Table View

- (void)initTableView
{
    if(nil == _tableView)
    {
        //init table view
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,40,[RCTool getScreenSize].width,[RCTool getScreenSize].height - (NAVIGATION_BAR_HEIGHT+STATUS_BAR_HEIGHT + 40))
                                                  style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self;
        _tableView.opaque = NO;
        _tableView.backgroundView = nil;
        _tableView.dataSource = self;
        _tableView.separatorColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
	
	[self.view addSubview:_tableView];
}

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setBackgroundColor:[UIColor clearColor]];
}

- (CGFloat)getCellHeight:(NSIndexPath*)indexPath
{
    return 226.0f;
}

- (id)getCellDataAtIndexPath: (NSIndexPath*)indexPath
{
	if(indexPath.row >= [_itemArray count])
		return nil;
	
	return [_itemArray objectAtIndex: indexPath.section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self getCellHeight:indexPath];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_itemArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(0 == section)
        return 12;
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    
    UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(cell == nil)
    {
        cell = [[[RCPublicCell alloc] initWithStyle: UITableViewCellStyleDefault
                                    reuseIdentifier: cellId contentViewClass:NSClassFromString(@"RCAnLiCellContentView")] autorelease];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    NSDictionary* item = (NSDictionary*)[self getCellDataAtIndexPath: indexPath];
    RCPublicCell* temp = (RCPublicCell*)cell;
    if(temp)
    {
        [temp updateContent:item cellHeight:[self getCellHeight:indexPath] delegate:self token:nil];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	[tableView deselectRowAtIndexPath: indexPath animated: YES];
}

- (void)clickedCell:(id)token
{
    NSDictionary* item = (NSDictionary*)token;
    
    RCAnLiDetailViewController* temp = [[RCAnLiDetailViewController alloc] initWithNibName:nil bundle:nil];
    temp.showTabBarWhenQuit = self.forTabBar;
    [self.navigationController pushViewController:temp animated:YES];
    [temp release];
    
}

@end
