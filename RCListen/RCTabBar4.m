//
//  RCTabBar4.m
//  RCTemplate
//
//  Created by xuzepei on 12/5/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCTabBar4.h"

#define BG_COLOR [UIColor whiteColor]
#define UNDER_LINE_COLOR [UIColor colorWithRed:246/255.0 green:125/255.0 blue:0 alpha:1.00]
#define DEFAULT_TEXT_COLOR [UIColor grayColor]
#define HIGHLIGHT_TEXT_COLOR [UIColor colorWithRed:246/255.0 green:125/255.0 blue:0 alpha:1.00]

#define UNDER_LINE_SIZE CGSizeMake(64,2)

@implementation RCTabBar4

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _itemArray = [[NSMutableArray alloc] init];
        
        _underlineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - UNDER_LINE_SIZE.height, UNDER_LINE_SIZE.width, UNDER_LINE_SIZE.height
                                                                  )];
        _underlineView.backgroundColor = UNDER_LINE_COLOR;
        [self addSubview: _underlineView];
        
    }
    return self;
}

- (void)dealloc
{
    self.itemArray = nil;
    self.delegate = nil;
    self.underlineView = nil;
    
    [super dealloc];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    if(0 == [_itemArray count])
        return;
    
    [BG_COLOR set];
    UIRectFill(self.bounds);
    
    //画没选中的项
    CGFloat width = self.bounds.size.width / [_itemArray count];
    
    for(int i = 0; i < [_itemArray count]; i++)
    {
        if(i != self.selectedIndex)
        {
            NSDictionary* item = [_itemArray objectAtIndex:i];
            NSString* title = [item objectForKey:@"title"];
            if([title length])
            {
                [DEFAULT_TEXT_COLOR set];
                
                [title drawInRect:CGRectMake(i*width,12, width, self.bounds.size.height) withFont:[UIFont systemFontOfSize:16] lineBreakMode:NSLineBreakByWordWrapping alignment:NSTextAlignmentCenter];
            }
        }
    }
    
    //画选中的项
    NSDictionary* item = [_itemArray objectAtIndex:self.selectedIndex];
    NSString* title = [item objectForKey:@"title"];
    if([title length])
    {
        [HIGHLIGHT_TEXT_COLOR set];
        
        [title drawInRect:CGRectMake(self.selectedIndex*width, 12, width, self.bounds.size.height) withFont:[UIFont systemFontOfSize:16] lineBreakMode:NSLineBreakByWordWrapping alignment:NSTextAlignmentCenter];
    }
}


- (void)updateContent
{
    [_itemArray removeAllObjects];
    
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"现代" forKey:@"title"];
    [_itemArray addObject:dict];
    [dict release];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"田园" forKey:@"title"];
    [_itemArray addObject:dict];
    [dict release];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"欧式" forKey:@"title"];
    [_itemArray addObject:dict];
    [dict release];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"中式" forKey:@"title"];
    [_itemArray addObject:dict];
    [dict release];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"其他" forKey:@"title"];
    [_itemArray addObject:dict];
    [dict release];
    
    CGFloat width = self.bounds.size.width / [_itemArray count];
    CGRect rect = _underlineView.frame;
    rect.size.width = width;
    _underlineView.frame = rect;
    
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    int index = -1;
    CGRect toRect = CGRectZero;
    
    CGFloat width = self.bounds.size.width / [_itemArray count];
    index = ceil(point.x / width);
    self.selectedIndex = index - 1;
    
    toRect = CGRectMake((index - 1)*width, 0, width, self.bounds.size.height);
    //if(toRect.origin.x)
    {
        [UIView animateWithDuration:0.3
                         animations:^{
                             
                             CGRect rect = _underlineView.frame;
                             rect.origin.x = toRect.origin.x;
                             _underlineView.frame = rect;
                         }];
    }
    
    if(-1 != index)
    {
        if(self.delegate && [self.delegate respondsToSelector:@selector(clickedTabBarItem:token:)])
        {
            [self.delegate clickedTabBarItem:index - 1 token:nil];
        }
    }
    
    [self setNeedsDisplay];
    
    [super touchesEnded:touches withEvent:event];
}


@end

