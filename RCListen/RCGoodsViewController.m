//
//  RCGoodsViewController.m
//  RCTemplate
//
//  Created by xuzepei on 12/6/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCGoodsViewController.h"

@interface RCGoodsViewController ()

@end

@implementation RCGoodsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.view.backgroundColor = [UIColor blackColor];
    }
    return self;
}

- (void)dealloc
{
    self.item = nil;
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [RCTool hideTabBar:YES];
    
    RCGoodsView* temp = (RCGoodsView*)self.view;
    [temp updateContent:self.item];
    
    UIButton* closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    closeButton.frame = CGRectMake(0, 0, 40, 40);
    [closeButton setImage:[UIImage imageNamed:@"close_button"] forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(clickedCloseButton:) forControlEvents:UIControlEventTouchUpInside];
    closeButton.center = CGPointMake(294, 64);
    [self.view addSubview: closeButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateContent:(NSDictionary*)item
{
    self.item = item;
    
    RCGoodsView* temp = (RCGoodsView*)self.view;
    [temp updateContent:self.item];
}

- (void)clickedCloseButton:(id)sender
{
    [RCTool hideTabBar:NO];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
