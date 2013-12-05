//
//  RCMeViewController.m
//  RCTemplate
//
//  Created by xuzepei on 11/25/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCMeViewController.h"
#import "RCCenterListHeaderView.h"

#define HEADER_HEIGHT 108.0f

@interface RCMeViewController ()

@end

@implementation RCMeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        [self setTitle:@"个人中心"];
    }
    return self;
}

- (void)dealloc
{
    self.tableView = nil;
    self.itemArray = nil;
    self.weixinhaoLabel = nil;
    self.jifenLabel = nil;
    
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
    
    [RCTool hideTabBar:YES];
    
    //添加自定义的返回按钮
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(-6,2, 40, 40);
    [backButton setImage:[UIImage imageNamed:@"back_button"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(clickedBackButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem.titleView addSubview: backButton];
    
    [self initHeaderView];
    
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

- (void)updateContent
{
    if(nil == _itemArray)
        _itemArray = [[NSMutableArray alloc] init];
    
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

- (void)initHeaderView
{
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT+NAVIGATION_BAR_HEIGHT, [RCTool getScreenSize].width, HEADER_HEIGHT)];
    imageView.image = [UIImage imageNamed:@"center_header"];
    [self.view addSubview:imageView];
    
    if(nil == _weixinhaoLabel)
    {
        _weixinhaoLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 118, 300, 20)];
        _weixinhaoLabel.backgroundColor = [UIColor clearColor];
        _weixinhaoLabel.font = [UIFont systemFontOfSize:18];
    }
    
    _weixinhaoLabel.text = [NSString stringWithFormat:@"微信号: %@",@"S021000156"];
    [self.view addSubview:_weixinhaoLabel];
    
    if(nil == _jifenLabel)
    {
        _jifenLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 144, 300, 20)];
        _jifenLabel.backgroundColor = [UIColor clearColor];
        _jifenLabel.font = [UIFont systemFontOfSize:16];
        _jifenLabel.textColor = [UIColor grayColor];
    }
    
    _jifenLabel.text = [NSString stringWithFormat:@"商城积分: %@分",@"200"];
    [self.view addSubview:_jifenLabel];
}

#pragma mark - Table View

- (void)initTableView
{
    if(nil == _tableView)
    {
        //init table view
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(6,NAVIGATION_BAR_HEIGHT+STATUS_BAR_HEIGHT + HEADER_HEIGHT,[RCTool getScreenSize].width - 12,[RCTool getScreenSize].height - (NAVIGATION_BAR_HEIGHT+STATUS_BAR_HEIGHT + HEADER_HEIGHT))
                                                  style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self;
        _tableView.opaque = NO;
        _tableView.backgroundView = nil;
        _tableView.dataSource = self;
        //_tableView.separatorColor = [UIColor clearColor];
        //_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
    }
	
	[self.view addSubview:_tableView];
}

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[cell setBackgroundColor:[UIColor clearColor]];
}

- (CGFloat)getCellHeight:(NSIndexPath*)indexPath
{
    return 44.0f;
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(0 == section)
        return 1;
    else if(1 == section)
        return 3;
    
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if(1 == section)
        return 100;
    
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if(1 == section)
    {
        UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"logout_button"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickedLogoutButton:) forControlEvents:UIControlEventTouchUpInside];
        return button;
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(0 == section)
        return 20;
    else
        return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    RCCenterListHeaderView* temp = [[RCCenterListHeaderView alloc] initWithFrame:CGRectMake(0, 0, [RCTool getScreenSize].width, 30)];
    if(1 == section)
        [temp updateContent:@"设置"];

    return [temp autorelease];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    
    UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(cell == nil)
    {
        cell =[[[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault
                                    reuseIdentifier: cellId] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    NSString* title = nil;
    if(0 == indexPath.section)
        title = @"我的收藏";
    else if(1 == indexPath.section)
    {
        if(0 == indexPath.row)
            title = @"清除缓存";
        else if(1 == indexPath.row)
            title = @"关于我们";
        else if(2 == indexPath.row)
            title = @"检查更新";
    }
    
    cell.textLabel.text = title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	[tableView deselectRowAtIndexPath: indexPath animated: YES];
}

- (void)clickedLogoutButton:(id)sender
{
    NSLog(@"clickedLogoutButton");
}


@end
