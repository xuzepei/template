//
//  RCActivityViewController.m
//  RCTemplate
//
//  Created by xuzepei on 11/25/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCActivityViewController.h"
#import "RCMeViewController.h"
#import "RCSearchViewController.h"
#import "RCPublicCell.h"
#import "RCActivityDetailViewController.h"
#import "RCPhoneView.h"

@interface RCActivityViewController ()

@end

@implementation RCActivityViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initTableView];
    
    [self updateContent];
    
    [self initPhoneView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)clickedUserButton:(id)sender
{
    NSLog(@"clickedUserButton");
    
    RCMeViewController* temp = [[RCMeViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:temp animated:YES];
    [temp release];
}

- (void)clickedSearchButton:(id)sender
{
    NSLog(@"clickedSearchButton");
    
    RCSearchViewController* searchViewController = [[RCSearchViewController alloc] initWithNibName:nil bundle:nil];
    
    UINavigationController* temp = [[[UINavigationController alloc] initWithRootViewController:searchViewController] autorelease];
    [searchViewController release];
    
    [self presentViewController:temp animated:YES completion:nil];
    
}

- (void)updateContent
{
    if(nil == _itemArray)
        _itemArray = [[NSMutableArray alloc] init];
    
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"工长大本营和30多家品牌联手，打造整装79800工厂价。所有一线主材都从生产源地直接发货，没有中间商，没有店面费,没有店面费没有店面费没有店面费没有店面费" forKey:@"desc"];
    [_itemArray addObject:dict];
    [dict release];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"工长大本营和30多家品牌联手，打造整装79800工厂价。所有一线主材都从生产源地直接发货，没有中间商，没有店面费" forKey:@"desc"];
    [_itemArray addObject:dict];
    [dict release];
    
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"工长大本营和30多家品牌联手，打造整装79800工厂价。所有一线主材都从生产源地直接发货，没有中间商，没有店面费" forKey:@"desc"];
    [_itemArray addObject:dict];
    [dict release];
    
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"工长大本营和30多家品牌联手，打造整装79800工厂价。所有一线主材都从生产源地直接发货，没有中间商，没有店面费" forKey:@"desc"];
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
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0,[RCTool getScreenSize].width,[RCTool getScreenSize].height - TAB_BAR_HEIGHT)
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
    return 252.0f;
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
                                    reuseIdentifier: cellId contentViewClass:NSClassFromString(@"RCActivityCellContentView")] autorelease];
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
    
    RCActivityDetailViewController* temp = [[RCActivityDetailViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:temp animated:YES];
    [temp release];
    
}

- (void)initPhoneView
{
    RCPhoneView* phoneView = [[[RCPhoneView alloc] initWithFrame:CGRectMake(0, [RCTool getScreenSize].height - TAB_BAR_HEIGHT - PHONE_VIEW_HEIGHT - NAVIGATION_BAR_HEIGHT - STATUS_BAR_HEIGHT, [RCTool getScreenSize].width, PHONE_VIEW_HEIGHT)] autorelease];
    
    phoneView.delegate = self;
    [phoneView updateContent:PHONE_VIEW_TEXT];
    [self.view addSubview:phoneView];
}

- (void)clickedPhoneNumber:(id)sender
{
    NSString* phoneNum = PHONE_NUMBER;
    if([phoneNum isKindOfClass:[NSString class]] && [phoneNum length])
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",phoneNum]]];
    }
}


@end
