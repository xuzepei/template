//
//  RCAnLiDetailViewController.m
//  RCTemplate
//
//  Created by xuzepei on 12/5/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCAnLiDetailViewController.h"
#import "RCPhoneView.h"

@interface RCAnLiDetailViewController ()

@end

@implementation RCAnLiDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        [self setTitle:@"案例详情"];
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
    
    if(self.showTabBarWhenQuit)
        [RCTool hideTabBar:NO];
}

- (void)updateContent:(NSDictionary*)item
{
    self.item = item;
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
        _detailView = [[RCAnLiDetailView alloc] initWithFrame:CGRectMake(0, 0, [RCTool getScreenSize].width,568)];
    }
    
    [_detailView updateContent:self.item];
    
    [_scrollView setContentSize:CGSizeMake([RCTool getScreenSize].width,600)];
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

@end
