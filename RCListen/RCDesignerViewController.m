//
//  RCDesignerViewController.m
//  RCTemplate
//
//  Created by xuzepei on 12/3/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCDesignerViewController.h"
#import "RCDesignerView.h"
#import "RCTabBar3.h"
#import "RCPhoneView.h"
#import "RCAnLiDetailViewController.h"
#import "RCPublicCell.h"

#define IMAGE_HEIGHT 168.0f

@interface RCDesignerViewController ()

@end

@implementation RCDesignerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    self.tableView = nil;
    self.itemArray = nil;
    
    self.favoriteButton = nil;
    self.headerImage = nil;
    self.tabBar = nil;
    self.item = nil;
    self.scrollTextView = nil;
    self.phoneView = nil;
    
    [super dealloc];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear: animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    RCDesignerView* temp = (RCDesignerView*)self.view;
    [temp updateContent:self.item];
    
    //去掉系统的返回按钮
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(clickedBackButton:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:button] autorelease];
    self.navigationController.navigationBar.hidden = YES;
    
    //隐藏TabBar
    [RCTool hideTabBar:YES];
    
    //添加自定义的返回按钮
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(6,STATUS_BAR_HEIGHT + 2, 40, 40);
    [backButton setImage:[UIImage imageNamed:@"back_button"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(clickedBackButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: backButton];
    
    self.favoriteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.favoriteButton.frame = CGRectMake([RCTool getScreenSize].width - 46,STATUS_BAR_HEIGHT + 2, 40, 40);
    [self.favoriteButton setImage:[UIImage imageNamed:@"favorite_button"] forState:UIControlStateNormal];
    [self.favoriteButton addTarget:self action:@selector(clickedFavoriteButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: self.favoriteButton];
    
    [self initTabBar];
    
    [self initTableView];
    [self initScrollTextView];
    
    [self initPhoneView];
    
    [self updateContent:self.item];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)clickedBackButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    self.navigationController.navigationBar.hidden = NO;
    //[RCTool hideTabBar:NO];
}

- (void)clickedFavoriteButton:(id)sender
{
    
}

- (void)updateContent:(NSDictionary*)item
{
    self.item = item;
    
    if(nil == _itemArray)
        _itemArray = [[NSMutableArray alloc] init];
    
    [_itemArray removeAllObjects];
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"现代简欧风 真皮淡雅舒适感觉" forKey:@"desc"];
    [_itemArray addObject:dict];
    [dict release];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"现代简欧风 真皮淡雅舒适感觉" forKey:@"desc"];
    [_itemArray addObject:dict];
    [dict release];
    
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"现代简欧风 真皮淡雅舒适感觉" forKey:@"desc"];
    [_itemArray addObject:dict];
    [dict release];
    
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"现代简欧风 真皮淡雅舒适感觉" forKey:@"desc"];
    [_itemArray addObject:dict];
    [dict release];
    
    if(_tableView)
        [_tableView reloadData];
}

- (void)initTabBar
{
    if(nil == _tabBar)
    {
        _tabBar = [[RCTabBar3 alloc] initWithFrame:CGRectMake(0,STATUS_BAR_HEIGHT+IMAGE_HEIGHT,[RCTool getScreenSize].width, 45)];
        _tabBar.delegate = self;
    }
    
    [_tabBar updateContent];
    
    [self.view addSubview:_tabBar];
}

- (void)clickedTabBarItem:(int)index token:(id)token
{
    NSLog(@"clickedTabBarItem:%d",index);
    
    if(0 == index)
    {
        [_scrollTextView removeFromSuperview];
        [self.view addSubview:_tableView];
    }
    else if(1 == index)
    {
        [_tableView removeFromSuperview];
        [self.view addSubview:_scrollTextView];
    }
    
    if(self.phoneView)
        [self.view addSubview:_phoneView];
}

- (void)initScrollTextView
{
    if(nil == _scrollTextView)
    {
        _scrollTextView = [[RCScrollTextView alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT+IMAGE_HEIGHT + 45,[RCTool getScreenSize].width, [RCTool getScreenSize].height - (STATUS_BAR_HEIGHT+IMAGE_HEIGHT + 45))];
    }
    
    NSString* text = @"设计师履历";
    NSMutableDictionary* item = [[NSMutableDictionary alloc] init];
    [item setObject:text forKey:@"text"];
    
    [_scrollTextView updateContent:item];
    [item release];
    
    //[self.view addSubview:_scrollTextView];
}

- (void)initPhoneView
{
    if(nil == _phoneView)
    self.phoneView = [[[RCPhoneView alloc] initWithFrame:CGRectMake(0, [RCTool getScreenSize].height - PHONE_VIEW_HEIGHT, [RCTool getScreenSize].width, PHONE_VIEW_HEIGHT)] autorelease];
    
    _phoneView.delegate = self;
    [_phoneView updateContent:PHONE_VIEW_TEXT];
    [self.view addSubview:_phoneView];
}

- (void)clickedPhoneNumber:(id)sender
{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                    message:[NSString stringWithFormat:@"是否立即拨打电话 %@",PHONE_NUMBER] delegate:self cancelButtonTitle:@"否" otherButtonTitles:@"是", nil];
    alert.tag = 100;
    alert.delegate = self;
    [alert show];
    [alert release];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex != alertView.cancelButtonIndex && 100 == alertView.tag)
    {
        NSString* phoneNum = PHONE_NUMBER;
        if([phoneNum isKindOfClass:[NSString class]] && [phoneNum length])
        {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",phoneNum]]];
        }
    }
}

#pragma mark - Table View

- (void)initTableView
{
    if(nil == _tableView)
    {
        //init table view
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,STATUS_BAR_HEIGHT+IMAGE_HEIGHT + 45,[RCTool getScreenSize].width,[RCTool getScreenSize].height - (STATUS_BAR_HEIGHT+IMAGE_HEIGHT + 45))
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
	
	return [_itemArray objectAtIndex: indexPath.row];
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
    [self.navigationController pushViewController:temp animated:YES];
    [temp release];
    
}

@end
