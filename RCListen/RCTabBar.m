//
//  RCTabBar.m
//  RCFang
//
//  Created by xuzepei on 3/12/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCTabBar.h"

#define RECT_0 CGRectMake(10,12,100,40)
#define RECT_1 CGRectMake(10+100,12,100,40)
#define RECT_2 CGRectMake(10+100*2,12,100,40)

#define UNDER_LINE_COLOR [UIColor colorWithRed:0.03 green:0.51 blue:1.00 alpha:1.00]

@implementation RCTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        _itemArray = [[NSMutableArray alloc] init];
        
        _underlineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - 3, 100, 3)];
        _underlineView.backgroundColor = UNDER_LINE_COLOR;
        [self addSubview: _underlineView];
        
        self.backgroundColor = [UIColor purpleColor];
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
    if([_itemArray count] < 3)
        return;
    
//    [[UIColor blackColor] set];
    
//    CGFloat width = self.bounds.size.width / [_itemArray count];
//    
//    NSDictionary* temp = [_itemArray objectAtIndex:0];
//    [temp drawInRect:RECT_0 withFont:[UIFont boldSystemFontOfSize:15] lineBreakMode:NSLineBreakByClipping alignment:NSTextAlignmentCenter];
//    
//    temp = [_itemArray objectAtIndex:1];
//    [temp drawInRect:RECT_1 withFont:[UIFont boldSystemFontOfSize:15] lineBreakMode:NSLineBreakByClipping alignment:NSTextAlignmentCenter];
//    
//    temp = [_itemArray objectAtIndex:2];
//    [temp drawInRect:RECT_2 withFont:[UIFont boldSystemFontOfSize:15] lineBreakMode:NSLineBreakByClipping alignment:NSTextAlignmentCenter];
}


- (void)updateContent
{
    [_itemArray removeAllObjects];
    
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"view0" forKey:@"title"];
    [dict setObject:@"tab0" forKey:@"image"];
    [_itemArray addObject:dict];
    [dict release];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"view1" forKey:@"title"];
    [dict setObject:@"tab1" forKey:@"image"];
    [_itemArray addObject:dict];
    [dict release];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"view2" forKey:@"title"];
    [dict setObject:@"tab2" forKey:@"image"];
    [_itemArray addObject:dict];
    [dict release];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"view3" forKey:@"title"];
    [dict setObject:@"tab3" forKey:@"image"];
    [_itemArray addObject:dict];
    [dict release];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"view4" forKey:@"title"];
    [dict setObject:@"tab4" forKey:@"image"];
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
    
    [super touchesEnded:touches withEvent:event];
}

@end
