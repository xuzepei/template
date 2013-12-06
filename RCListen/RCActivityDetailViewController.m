//
//  RCActivityDetailViewController.m
//  RCTemplate
//
//  Created by xuzepei on 12/6/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCActivityDetailViewController.h"
#import "RCPhoneView.h"

@interface RCActivityDetailViewController ()

@end

@implementation RCActivityDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        [self setTitle:@"促销活动"];
    }
    return self;
}

- (void)dealloc
{
    self.scrollView = nil;
    self.detailView = nil;
    self.item = nil;
    
    [super dealloc];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //    self.navigationController.navigationItem.leftBarButtonItem = nil;
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
    
    [self initDetailView];
    
    [self initPhoneView];
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

- (void)initDetailView
{
    if(nil == _scrollView)
    {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [RCTool getScreenSize].width, [RCTool getScreenSize].height)];
        _scrollView.showsVerticalScrollIndicator = NO;
    }
    
    [self.view addSubview:_scrollView];
    
    
    if(nil == _detailView)
    {
        _detailView = [[RCActivityDetailView alloc] initWithFrame:CGRectMake(0, 0, [RCTool getScreenSize].width,568)];
    }
    
    [_detailView updateContent:self.item];
    
    [_scrollView setContentSize:CGSizeMake([RCTool getScreenSize].width,568)];
    [_scrollView addSubview:_detailView];
}


- (void)initPhoneView
{
    RCPhoneView* phoneView = [[[RCPhoneView alloc] initWithFrame:CGRectMake(0, [RCTool getScreenSize].height - PHONE_VIEW_HEIGHT, [RCTool getScreenSize].width, PHONE_VIEW_HEIGHT)] autorelease];
    
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
