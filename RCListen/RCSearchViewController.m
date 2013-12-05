//
//  RCSearchViewController.m
//  RCTemplate
//
//  Created by xuzepei on 12/5/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCSearchViewController.h"
#import "RCDesignerListController.h"

@interface RCSearchViewController ()

@end

@implementation RCSearchViewController

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
    self.searchTF = nil;
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [RCTool hideTabBar:YES];
    
    //添加自定义的返回按钮
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake([RCTool getScreenSize].width-70,5, 50, 35);
    [backButton setTitle:@"取消" forState:UIControlStateNormal];
    [backButton setBackgroundImage:[UIImage imageNamed:@"cancel_button"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(clickedBackButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem.titleView addSubview: backButton];
    
    [self initSearchBar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)clickedBackButton:(id)sender
{
    [RCTool hideTabBar:NO];
    
    [self dismissViewControllerAnimated:YES completion:^{
        
        
    }];
}

- (void)initSearchBar
{
    UIImageView* searchBarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(-10, 4.5, 255, 35)];
    searchBarImageView.image = [UIImage imageNamed:@"search_bar"];
    [self.navigationItem.titleView addSubview:searchBarImageView];
    
    if(nil == _searchTF)
    {
        _searchTF = [[UITextField alloc] initWithFrame:CGRectMake(20,7, 220, 30)];
        _searchTF.backgroundColor = [UIColor clearColor];
        _searchTF.font = [UIFont systemFontOfSize:16];
        _searchTF.delegate = self;
        _searchTF.returnKeyType = UIReturnKeySearch;
    }
    
    [_searchTF becomeFirstResponder];
    
    [self.navigationItem.titleView addSubview:_searchTF];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    RCDesignerListController* temp = [[RCDesignerListController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:temp animated:YES];
    [temp release];
    
    return YES;
}

@end
