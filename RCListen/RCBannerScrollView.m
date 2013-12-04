//
//  RCBannerScrollView.m
//  RCTemplate
//
//  Created by xuzepei on 11/25/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCBannerScrollView.h"
#import "RCBannerView.h"

#define UNDER_LINE_SIZE CGSizeMake(20.0,2.0)
#define UNDER_LINE_BG_COLOR [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:225/255.0]
#define UNDER_LINE_COLOR [UIColor colorWithRed:247/255.0 green:125/255.0 blue:0/255.0 alpha:225/255.0]

@implementation RCBannerScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        _itemArray = [[NSMutableArray alloc] init];
        
        if(nil == _scrollView)
        {
            _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
            _scrollView.pagingEnabled = YES;
            _scrollView.showsHorizontalScrollIndicator = NO;
            _scrollView.showsVerticalScrollIndicator = NO;
            _scrollView.scrollsToTop = NO;
            _scrollView.delegate = self;
        }
        
        [self addSubview: _scrollView];
        
        
        if(nil == _timer)
        {
            self.timer = [NSTimer
                          scheduledTimerWithTimeInterval:5
                          target:self
                          selector:@selector(handleTimer:)
                          userInfo:nil
                          repeats:YES
                          ];
        }
        
        [_timer fire];
    }
    return self;
}

- (void)dealloc
{
    if(_timer)
    {
        [_timer invalidate];
        [_timer release];
        _timer = nil;
    }
    
    self.itemArray = nil;
    self.underLineView = nil;
    self.delegate = nil;
    
    [super dealloc];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{

}

- (void)updateContent:(NSArray*)itemArray
{
    [self.itemArray removeAllObjects];
    [self.itemArray addObjectsFromArray:itemArray];
    
    self.scrollView.contentSize = CGSizeMake(self.bounds.size.width * [self.itemArray count], self.bounds.size.height);
    
    for(UIView* subview in [self.scrollView subviews])
    {
        [subview removeFromSuperview];
    }
    
    int i = 0;
    for(NSDictionary* item in itemArray)
    {
        RCBannerView* itemView = [[[RCBannerView alloc] initWithFrame:CGRectMake(self.bounds.size.width * i,0,self.bounds.size.width,self.bounds.size.height)] autorelease];
        itemView.delegate = self.delegate;
        [itemView updateContent:item];
        [self.scrollView addSubview:itemView];
        
        i++;
    }
    
    
    if(nil == _underLineView)
    {
        int count = [self.itemArray count];
        CGRect bgRect = CGRectMake((self.bounds.size.width - UNDER_LINE_SIZE.width*count)/2.0, self.bounds.size.height - UNDER_LINE_SIZE.height, UNDER_LINE_SIZE.width*count, UNDER_LINE_SIZE.height);
        
        UIView* underLineBgView = [[[UIView alloc] initWithFrame:bgRect] autorelease];
        underLineBgView.backgroundColor = UNDER_LINE_BG_COLOR;
        [self addSubview: underLineBgView];
        
        _underLineView = [[UIView alloc] initWithFrame:CGRectMake(0,self.bounds.size.height - UNDER_LINE_SIZE.height,UNDER_LINE_SIZE.width,UNDER_LINE_SIZE.height)];
    }
    
	_underLineView.backgroundColor = UNDER_LINE_COLOR;
    [self addSubview: _underLineView];
    [self scrollViewDidScroll:nil];
}

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    int page = floor((self.scrollView.contentOffset.x - self.bounds.size.width / 2) / self.bounds.size.width) + 1;
    
    self.currentIndex = page;
    
    if(_underLineView)
    {
        int count = [self.itemArray count];
        CGRect rect = _underLineView.frame;
        rect.origin.x = (self.bounds.size.width - UNDER_LINE_SIZE.width*count)/2.0 + UNDER_LINE_SIZE.width*self.currentIndex;
        _underLineView.frame = rect;
    }
}

- (IBAction)changePage:(id)sender
{
	int page = self.currentIndex;
    CGRect frame = self.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [self.scrollView scrollRectToVisible:frame animated:YES];
    
    if(_underLineView)
    {
        [UIView animateWithDuration:0.3 animations:^{
            int count = [self.itemArray count];
            CGRect rect = _underLineView.frame;
            rect.origin.x = (self.bounds.size.width - UNDER_LINE_SIZE.width*count)/2.0 + UNDER_LINE_SIZE.width*self.currentIndex;
            _underLineView.frame = rect;
        }];
    }
}

- (void)goToIndex:(int)index
{
    self.currentIndex = index;
    [self changePage:nil];
}

- (void)handleTimer:(NSTimer*)timer
{
    static BOOL forward = YES;
    if(self.currentIndex == [self.itemArray count] - 1)
        forward = NO;
    else if(self.currentIndex == 0)
        forward = YES;
    
    if(forward)
    {
        if(self.currentIndex < [self.itemArray count])
            [self goToIndex: self.currentIndex + 1];
    }
    else
    {
        int index = self.currentIndex - 1;
        if(index < [self.itemArray count] && index != -1)
            [self goToIndex: index];
    }
}


@end
