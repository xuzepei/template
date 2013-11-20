//
//  RCTabBarController.m
//  RCTemplate
//
//  Created by xuzepei on 11/20/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCTabBarController.h"

@interface RCTabBarController ()

@end

@implementation RCTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        _itemArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dealloc
{
    self.itemArray = nil;
    self.selectedViewController = nil;
    self.tabBar = nil;
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addItems:(NSArray*)array
{
    if(nil == _itemArray)
        return;
    
    [_itemArray removeAllObjects];
    [_itemArray addObjectsFromArray:array];
    
    self.tabBar = nil;
    _tabBar = [[RCTabBar alloc] initWithFrame:CGRectMake(0, [RCTool getScreenSize].height - TAB_BAR_HEIGHT, [RCTool getScreenSize].width, TAB_BAR_HEIGHT)];
    _tabBar.delegate = self;
    [self.view addSubview:_tabBar];
    [_tabBar updateContent];
    
    [self clickedTabBarItem:0 token:nil];
}

- (void)clickedTabBarItem:(int)index token:(id)token
{
    if(index < [_itemArray count])
    {
        self.selectedIndex = index;
        
        UIViewController* temp = [_itemArray objectAtIndex:self.selectedIndex];

        if(self.selectedViewController != temp)
        {
            [self.selectedViewController viewWillDisappear:NO];
            [temp viewWillAppear:NO];

            [self.selectedViewController.view removeFromSuperview];
            [self.view addSubview:temp.view];
            [self.view sendSubviewToBack:temp.view];
            
            self.selectedViewController = temp;
        }
        
    }
}

@end
