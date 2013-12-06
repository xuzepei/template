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
    self.favoriteButton = nil;
    self.headerImage = nil;
    self.tabBar = nil;
    self.item = nil;
    self.scrollTextView = nil;
    
    [super dealloc];
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
    
    [self initScrollTextView];
    
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
    self.navigationController.navigationBar.hidden = NO;
    //[RCTool hideTabBar:NO];
}

- (void)clickedFavoriteButton:(id)sender
{
    
}

- (void)updateContent:(NSDictionary*)item
{
    self.item = item;
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
}

- (void)initScrollTextView
{
    if(nil == _scrollTextView)
    {
        _scrollTextView = [[RCScrollTextView alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT+IMAGE_HEIGHT + 45,[RCTool getScreenSize].width, [RCTool getScreenSize].height - (STATUS_BAR_HEIGHT+IMAGE_HEIGHT + 45))];
    }
    
    NSString* text = @"fjsofjisodfjodsijfosdjfosfjsofjisodfjodsijfosdjfosfjsofjisodfjodsijfosdjfosfjsofjisodfjodsijfosdjfosfjsofjisodfjodsijfosdjfosfjsofjisodfjodsijfosdjfosfjsofjisodfjodsijfosdjfosfjsofjisodfjodsijfosdjfosfjsofjisodfjodsijfosdjfosfjsofjisodfjodsijfosdjfosfjsofjisodfjodsijfosdjfosfjsofjisodfjodsijfosdjfosfjsofjisodfjodsijfosdjfosfjsofjisodfjodsijfosdjfosfjsofjisodfjodsijfosdjfosfjsofjisodfjodsijfosdjfosfjsofjisodfjodsijfosdjfos";
    NSMutableDictionary* item = [[NSMutableDictionary alloc] init];
    [item setObject:text forKey:@"text"];
    
    [_scrollTextView updateContent:item];
    [item release];
    
    [self.view addSubview:_scrollTextView];
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
