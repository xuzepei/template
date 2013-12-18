//
//  RCServiceViewController.m
//  RCTemplate
//
//  Created by xuzepei on 11/25/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCServiceViewController.h"
#import "RCMeViewController.h"
#import "RCSearchViewController.h"
#import "RCPhoneView.h"
#import "RCLoginViewController.h"

@interface RCServiceViewController ()

@end

@implementation RCServiceViewController

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
    self.itemArray = nil;
    self.scrollView = nil;
    self.userButton = nil;
    self.searchButton = nil;
    self.pageControl = nil;
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initScrollView];
    
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
    
    if([RCTool isLogin])
    {
        RCMeViewController* temp = [[RCMeViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:temp animated:YES];
        [temp release];
    }
    else
    {
        RCLoginViewController* temp = [[RCLoginViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:temp animated:YES];
        [temp release];
    }
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
    if(nil == _itemArray)
        _itemArray = [[NSMutableArray alloc] init];
    
    if(nil == _scrollView)
    {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0,[RCTool getScreenSize].width, [RCTool getScreenSize].height - TAB_BAR_HEIGHT)];
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.scrollsToTop = NO;
        _scrollView.delegate = self;
    }
    
    [self.view addSubview: _scrollView];
}

- (void)updateContent
{
    [self.itemArray removeAllObjects];
    for(int i = 1; i < 5; i++)
    {
        [self.itemArray addObject:[NSString stringWithFormat:@"no%d",i]];
    }
    
    self.scrollView.contentSize = CGSizeMake([RCTool getScreenSize].width* [self.itemArray count],[RCTool getScreenSize].height - TAB_BAR_HEIGHT - NAVIGATION_BAR_HEIGHT - STATUS_BAR_HEIGHT);
    
    for(UIView* subview in [self.scrollView subviews])
    {
        [subview removeFromSuperview];
    }
    
    int i = 0;
    for(NSString* imageName in self.itemArray)
    {
        UIImageView* imageView = [[[UIImageView alloc] initWithFrame:CGRectMake([RCTool getScreenSize].width * i + 7.5,10,305,432)] autorelease];
        imageView.image = [UIImage imageNamed:imageName];
        [self.scrollView addSubview:imageView];
        
        i++;
    }
    
    
    if(nil == _pageControl)
    {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0,[RCTool getScreenSize].height - 16 - TAB_BAR_HEIGHT - 40,[RCTool getScreenSize].width,16)];
        _pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
        _pageControl.pageIndicatorTintColor = [UIColor grayColor];
    }
    
	_pageControl.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0];
	_pageControl.numberOfPages = [self.itemArray count];
	_pageControl.currentPage = 0;
	[_pageControl addTarget:self
					 action:@selector(changePage:)
		   forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview: _pageControl];
}

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    int page = floor((self.scrollView.contentOffset.x - [RCTool getScreenSize].width / 2) / [RCTool getScreenSize].width) + 1;
    _pageControl.currentPage = page;
}

- (IBAction)changePage:(id)sender
{
	int page = _pageControl.currentPage;
    CGRect frame = [RCTool getScreenRect];
    frame.origin.x = frame.size.width * page + 7.5;
    frame.origin.y = 10;
    [self.scrollView scrollRectToVisible:frame animated:YES];
}

- (void)goToIndex:(int)index
{
    _pageControl.currentPage = index;
    
    [self changePage:nil];
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
