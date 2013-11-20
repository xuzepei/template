//
//  RCMoreViewController.m
//  RCFang
//
//  Created by xuzepei on 3/9/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCMoreViewController.h"
#import "RCTool.h"
#import "RCWebViewController.h"
#import "RCFeedbackViewController.h"

@interface RCMoreViewController ()

@end

@implementation RCMoreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem* item = [[UITabBarItem alloc] initWithTitle:@"更多"
														   image:[UIImage imageNamed:@"tab_4"]
															 tag:TT_4];
		self.tabBarItem = item;
		[item release];
		
        UILabel *titleLabel = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont systemFontOfSize:20.0];
        //titleLabel.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = NAVIGATION_BAR_TITLE_COLOR;
        self.navigationItem.titleView = titleLabel;
        titleLabel.text = @"更多";
        [titleLabel sizeToFit];
        
        _itemArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dealloc
{
    self.tableView = nil;
    self.itemArray = nil;
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
    
    [self initTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    self.tableView = nil;
}

#pragma mark - UITableView

- (void)initTableView
{
    if(nil == _tableView)
    {
        //init table view
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0,[RCTool getScreenSize].width,[RCTool getScreenSize].height - STATUS_BAR_HEIGHT - NAVIGATION_BAR_HEIGHT -TAB_BAR_HEIGHT)
                                                  style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self;
        _tableView.opaque = NO;
        _tableView.backgroundView = nil;
        _tableView.dataSource = self;
    }
	
	[self.view addSubview:_tableView];
    
    if(0 == [_itemArray count])
    {
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"房贷计算器" forKey:@"name"];
    [dict setObject:@"fangdai" forKey:@"image_path"];
    [_itemArray addObject:dict];
    [dict release];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"扫一扫" forKey:@"name"];
    [dict setObject:@"suifei" forKey:@"image_path"];
    [_itemArray addObject:dict];
    [dict release];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"清理缓存" forKey:@"name"];
    [dict setObject:@"qingli" forKey:@"image_path"];
    [_itemArray addObject:dict];
    [dict release];
        
        dict = [[NSMutableDictionary alloc] init];
        [dict setObject:@"关于我们" forKey:@"name"];
        [dict setObject:@"guanyu" forKey:@"image_path"];
        [_itemArray addObject:dict];
        [dict release];
        
        
        dict = [[NSMutableDictionary alloc] init];
        [dict setObject:@"使用帮助" forKey:@"name"];
        [dict setObject:@"bangzhu" forKey:@"image_path"];
        [_itemArray addObject:dict];
        [dict release];
        
        
        dict = [[NSMutableDictionary alloc] init];
        [dict setObject:@"意见反馈" forKey:@"name"];
        [dict setObject:@"fankui" forKey:@"image_path"];
        [_itemArray addObject:dict];
        [dict release];
        
        
    }
    
    
    
    [_tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (id)getCellDataAtIndexPath: (NSIndexPath*)indexPath
{
	if(indexPath.row >= [_itemArray count] || 0 == indexPath.row)
		return nil;
	
	return [_itemArray objectAtIndex: indexPath.row];
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_itemArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(0 == indexPath.row)
        return 0.0;
    
	return 44.0;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil)
	{
		cell = [[[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault
                                       reuseIdentifier: cellId] autorelease];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }


    NSDictionary* item = (NSDictionary*)[self getCellDataAtIndexPath: indexPath];
	if(item)
	{
        cell.textLabel.text = [item objectForKey:@"name"];
        //cell.imageView.image = [UIImage imageNamed:[item objectForKey:@"image_path"]];
	}
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	[tableView deselectRowAtIndexPath: indexPath animated: YES];
    
    if(0 == indexPath.row)
    {
//        RCFangDaiViewController* temp =[[RCFangDaiViewController alloc] initWithNibName:nil bundle:nil];
//        temp.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:temp animated:YES];
//        [temp release];
    }
    else if(1 == indexPath.row)
    {
//        RCShuiFeiViewController* temp = [[RCShuiFeiViewController alloc] initWithNibName:nil bundle:nil];
//        temp.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:temp animated:YES];
//        [temp release];
        
        [self clickedScanButton:nil];
    }
    else if(2 == indexPath.row)
    {
        NSString* imageDirectoryPath = [NSString stringWithFormat:@"%@/images",[RCTool getUserDocumentDirectoryPath]];
        [RCTool removeFile:imageDirectoryPath];
        
        [RCTool showAlert:@"提示" message:@"成功清理缓存!"];
    }
    else if(3 == indexPath.row)
    {
        NSString* urlString = [NSString stringWithFormat:@"%@/aboutus.php",BASE_URL];
        
        RCWebViewController* temp = [[RCWebViewController alloc] init:YES];
        temp.hidesBottomBarWhenPushed = YES;
        [temp updateContent:urlString title:@"关于我们"];
        [self.navigationController pushViewController:temp animated:YES];
        [temp release];
    }
    else if(4 == indexPath.row)
    {
        NSString* urlString = [NSString stringWithFormat:@"%@/help.php",BASE_URL];
        
        RCWebViewController* temp = [[RCWebViewController alloc] init:YES];
        temp.hidesBottomBarWhenPushed = YES;
        [temp updateContent:urlString title:@"使用帮助"];
        [self.navigationController pushViewController:temp animated:YES];
        [temp release];
    }
    else if(5 == indexPath.row)
    {
        NSString* username = [RCTool getUsername];
        if(0 == [username length])
        {
            [RCTool showAlert:@"提示" message:@"登录用户才能发送意见反馈！"];
            return;
        }
            
        RCFeedbackViewController* temp = [[RCFeedbackViewController alloc] initWithNibName:nil bundle:nil];
        temp.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:temp animated:YES];
        [temp release];
    }
}

#pragma mark - Scanner

- (void)clickedScanButton:(id)sender
{
    NSLog(@"clickedScanButton");
}

- (void) imagePickerController: (UIImagePickerController*) reader
 didFinishPickingMediaWithInfo: (NSDictionary*) info
{
}


@end
