//
//  RCShopViewController.m
//  RCTemplate
//
//  Created by xuzepei on 11/25/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCShopViewController.h"
#import "RCMeViewController.h"
#import "RCSearchViewController.h"
#import "RCPublicCell.h"
#import "RCGoodsViewController.h"

@interface RCShopViewController ()

@end

@implementation RCShopViewController

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
    
    UIImageView* headerView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, [RCTool getScreenSize].width, 49)];
    headerView.image = [UIImage imageNamed:@"shop_header"];
    [self.view addSubview:headerView];
    
    [self updateContent];
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
    [dict setObject:@"布纹底大马士革 欧式锦绣雕花 布纹底大马士革 欧式锦绣雕花 布纹底大马士革 欧式锦绣雕花 布纹底大马士革 欧式锦绣雕花" forKey:@"title"];
    [dict setObject:@"" forKey:@"image_url"];
    [dict setObject:@"199" forKey:@"price"];
    [dict setObject:@"3" forKey:@"count"];
    [dict setObject:@"水碾河路25号蜀都惠苑3栋临街商铺2楼整层" forKey:@"address"];
    [dict setObject:@"028-66505592" forKey:@"phone"];
    [_itemArray addObject:dict];
    [dict release];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"布纹底大马士革 欧式锦绣雕花" forKey:@"title"];
    [dict setObject:@"" forKey:@"image_url"];
    [dict setObject:@"199" forKey:@"price"];
    [dict setObject:@"3" forKey:@"count"];
    [dict setObject:@"水碾河路25号蜀都惠苑3栋临街商铺2楼整层" forKey:@"address"];
    [dict setObject:@"028-66505592" forKey:@"phone"];
    [_itemArray addObject:dict];
    [dict release];
    
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"布纹底大马士革 欧式锦绣雕花" forKey:@"title"];
    [dict setObject:@"" forKey:@"image_url"];
    [dict setObject:@"199" forKey:@"price"];
    [dict setObject:@"3" forKey:@"count"];
    [dict setObject:@"水碾河路25号蜀都惠苑3栋临街商铺2楼整层" forKey:@"address"];
    [dict setObject:@"028-66505592" forKey:@"phone"];
    [_itemArray addObject:dict];
    [dict release];
    
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"布纹底大马士革 欧式锦绣雕花" forKey:@"title"];
    [dict setObject:@"" forKey:@"image_url"];
    [dict setObject:@"199" forKey:@"price"];
    [dict setObject:@"3" forKey:@"count"];
    [dict setObject:@"水碾河路25号蜀都惠苑3栋临街商铺2楼整层" forKey:@"address"];
    [dict setObject:@"028-66505592" forKey:@"phone"];
    [_itemArray addObject:dict];
    [dict release];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"布纹底大马士革 欧式锦绣雕花" forKey:@"title"];
    [dict setObject:@"" forKey:@"image_url"];
    [dict setObject:@"199" forKey:@"price"];
    [dict setObject:@"3" forKey:@"count"];
    [dict setObject:@"水碾河路25号蜀都惠苑3栋临街商铺2楼整层" forKey:@"address"];
    [dict setObject:@"028-66505592" forKey:@"phone"];
    [_itemArray addObject:dict];
    [dict release];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"布纹底大马士革 欧式锦绣雕花" forKey:@"title"];
    [dict setObject:@"" forKey:@"image_url"];
    [dict setObject:@"199" forKey:@"price"];
    [dict setObject:@"3" forKey:@"count"];
    [dict setObject:@"水碾河路25号蜀都惠苑3栋临街商铺2楼整层" forKey:@"address"];
    [dict setObject:@"028-66505592" forKey:@"phone"];
    [_itemArray addObject:dict];
    [dict release];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"布纹底大马士革 欧式锦绣雕花" forKey:@"title"];
    [dict setObject:@"" forKey:@"image_url"];
    [dict setObject:@"199" forKey:@"price"];
    [dict setObject:@"3" forKey:@"count"];
    [dict setObject:@"水碾河路25号蜀都惠苑3栋临街商铺2楼整层" forKey:@"address"];
    [dict setObject:@"028-66505592" forKey:@"phone"];
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
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(8,53,[RCTool getScreenSize].width - 16,[RCTool getScreenSize].height - TAB_BAR_HEIGHT - 60 - NAVIGATION_BAR_HEIGHT - STATUS_BAR_HEIGHT)
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
    [cell setBackgroundColor:[UIColor redColor]];
}

- (CGFloat)getCellHeight:(NSIndexPath*)indexPath
{
    return 90.0f;
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_itemArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    
    UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(cell == nil)
    {
        cell = [[[RCPublicCell alloc] initWithStyle: UITableViewCellStyleDefault
                                    reuseIdentifier: cellId contentViewClass:NSClassFromString(@"RCGoodsCellContentView")] autorelease];
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
    
    NSDictionary* item = [self getCellDataAtIndexPath:indexPath];
    if(item)
    {
        RCGoodsViewController* temp = [[[RCGoodsViewController alloc] initWithNibName:nil bundle:nil] autorelease];;
        [temp updateContent:item];
        [self presentViewController:temp animated:YES completion:nil];
    }
}

@end
