//
//  RCDesignerListController.m
//  RCTemplate
//
//  Created by xuzepei on 11/25/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCDesignerListController.h"
#import "RCPublicCell.h"
#import "RCDesignerListSectionHeaderView.h"
#import "RCDesignerViewController.h"

#define SECTION_HEIGHT 42.0f

@interface RCDesignerListController ()

@end

@implementation RCDesignerListController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        [self setTitle:@"设计师团队"];
        
        _itemArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dealloc
{
    self.itemArray = nil;
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [RCTool hideTabBar:YES];
    
    //添加自定义的返回按钮
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(-6,2, 40, 40);
    [backButton setImage:[UIImage imageNamed:@"back_button"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(clickedBackButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem.titleView addSubview: backButton];
    
    [self initTableView];
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

#pragma mark - Table View

- (void)initTableView
{
    if(nil == _tableView)
    {
        //init table view
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0,[RCTool getScreenSize].width,[RCTool getScreenSize].height - NAVIGATION_BAR_HEIGHT - STATUS_BAR_HEIGHT)
                                                  style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self;
        _tableView.opaque = NO;
        _tableView.backgroundView = nil;
        _tableView.dataSource = self;
        //_tableView.separatorColor = [UIColor clearColor];
        //_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return SECTION_HEIGHT;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    RCDesignerListSectionHeaderView* temp = [[RCDesignerListSectionHeaderView alloc] initWithFrame:CGRectMake(0, 0, [RCTool getScreenSize].width, 30)];
    if(0 == section)
        [temp updateContent:@"首席设计师(2)"];
    else if(1 == section)
        [temp updateContent:@"主任设计师(2)"];
    else if(2 == section)
        [temp updateContent:@"百强设计师(2)"];
    else if(3 == section)
        [temp updateContent:@"精品设计师(2)"];
    
    return [temp autorelease];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    
    UITableViewCell *cell = nil;
        cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(cell == nil)
    {
        cell = [[[RCPublicCell alloc] initWithStyle: UITableViewCellStyleDefault
                                       reuseIdentifier: cellId contentViewClass:NSClassFromString(@"RCDesignerListCellContentView")] autorelease];
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
    
    
    RCDesignerViewController* temp = [[RCDesignerViewController alloc] initWithNibName:nil bundle:nil];
    
    [self.navigationController pushViewController:temp animated:YES];
    [temp release];
}


@end
