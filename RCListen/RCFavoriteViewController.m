//
//  RCFavoriteViewController.m
//  RCTemplate
//
//  Created by xuzepei on 12/18/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCFavoriteViewController.h"
#import "RCPublicCell.h"
#import "RCAnLiDetailViewController.h"
#import "RCSearchViewController.h"

@interface RCFavoriteViewController ()

@end

@implementation RCFavoriteViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        [self setTitle:@"我的收藏"];
    }
    return self;
}

- (void)dealloc
{
    self.tableView = nil;
    self.itemArray = nil;
    self.userButton = nil;
    self.searchButton = nil;
    
    [super dealloc];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    //添加自定义的返回按钮
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backButton.tag = 10000;
    self.backButton.frame = CGRectMake(-6,2, 40, 40);
    [self.backButton setImage:[UIImage imageNamed:@"back_button"] forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(clickedBackButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem.titleView addSubview: self.backButton];

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
    
}

- (void)updateContent
{
    if(nil == _itemArray)
        _itemArray = [[NSMutableArray alloc] init];
    
    [_itemArray removeAllObjects];
    NSArray* array = [RCTool getFavorites];
    if(array && [array count])
        [_itemArray addObjectsFromArray:array];
    
    if(_tableView)
        [_tableView reloadData];
}

#pragma mark - Table View

- (void)initTableView
{
    if(nil == _tableView)
    {
        //init table view
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0,[RCTool getScreenSize].width,[RCTool getScreenSize].height - (NAVIGATION_BAR_HEIGHT+STATUS_BAR_HEIGHT))
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
