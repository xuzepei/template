//
//  RCHomeViewController.m
//  RCTemplate
//
//  Created by xuzepei on 11/25/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCHomeViewController.h"
#import "RCDesignerListController.h"
#import "RCPhoneView.h"
#import "RCMeViewController.h"
#import "RCAnLiViewController.h"
#import "RCAboutViewController.h"
#import "RCSearchViewController.h"

@interface RCHomeViewController ()

@end

#define BANNER_VIEW_HEIGHT 186.0f
#define ANLI_BUTTON_TAG 100
#define TUANDUI_BUTTON_TAG 101
#define GUANYU_BUTTON_TAG 102

@implementation RCHomeViewController

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
    self.scrollView = nil;
    self.bannerScrollView = nil;
    self.userButton = nil;
    self.searchButton = nil;
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initScrollView];
    
    [self initBanner];
    
    [self initPhoneView];
    
    [self initButtons];
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

- (void)initScrollView
{
    if(nil == _scrollView)
    {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [RCTool getScreenSize].width, [RCTool getScreenSize].height - TAB_BAR_HEIGHT)];
        _scrollView.delegate = self;
        _scrollView.showsVerticalScrollIndicator = NO;
    }
    
    [_scrollView setContentSize:CGSizeMake([RCTool getScreenSize].width, [RCTool getScreenSize].height)];
    [self.view addSubview:_scrollView];
}

- (void)initBanner
{
    if(nil == _bannerScrollView)
    {
        _bannerScrollView = [[RCBannerScrollView alloc] initWithFrame:CGRectMake(0, 0, [RCTool getScreenSize].width, BANNER_VIEW_HEIGHT)];
        _bannerScrollView.delegate = self;
    }
    
    NSMutableArray* array = [[NSMutableArray alloc] init];
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"banner_0.png" forKey:@"image_name"];
    [array addObject:dict];
    [dict release];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"banner_1.png" forKey:@"image_name"];
    [array addObject:dict];
    [dict release];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"banner_2.png" forKey:@"image_name"];
    [array addObject:dict];
    [dict release];
    
    [_bannerScrollView updateContent:array];
    [array release];
    
    [self.scrollView addSubview:_bannerScrollView];
}

- (void)clickedBanner:(id)token
{
    NSLog(@"clickedBanner");
    

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

- (void)initButtons
{
    CGFloat offset_x = 8.0f;
    CGFloat offset_y = BANNER_VIEW_HEIGHT + 16.f;
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.tag = ANLI_BUTTON_TAG;
    button.frame = CGRectMake(offset_x, offset_y, 305, 55);
    [button setImage:[UIImage imageNamed:@"anli_button"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickedButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview: button];
    offset_y += 62.0;
    
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.tag = TUANDUI_BUTTON_TAG;
    button.frame = CGRectMake(offset_x, offset_y, 305, 55);
    [button setImage:[UIImage imageNamed:@"tuandui_button"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickedButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview: button];
    offset_y += 62.0;
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.tag = GUANYU_BUTTON_TAG;
    button.frame = CGRectMake(offset_x, offset_y, 305, 55);
    [button setImage:[UIImage imageNamed:@"guanyu_button"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickedButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview: button];
}

- (void)clickedButton:(id)sender
{
    UIButton* button = (UIButton*)sender;
    
    if(ANLI_BUTTON_TAG == button.tag)
    {
        RCAnLiViewController* temp = [[RCAnLiViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:temp animated:YES];
    }
    else if(TUANDUI_BUTTON_TAG == button.tag)
    {
        RCDesignerListController* temp = [[RCDesignerListController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:temp animated:YES];
        [temp release];
    }
    else if(GUANYU_BUTTON_TAG == button.tag)
    {
        RCAboutViewController* temp = [[RCAboutViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:temp animated:YES];
        [temp release];
    }
}

@end
