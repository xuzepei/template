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

#define BG_COLOR [UIColor blackColor]
#define UNDER_LINE_COLOR [UIColor colorWithRed:0.03 green:0.51 blue:1.00 alpha:1.00]
#define DEFAULT_TEXT_COLOR [UIColor grayColor]
#define HIGHLIGHT_TEXT_COLOR [UIColor whiteColor]

@implementation RCTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        _itemArray = [[NSMutableArray alloc] init];
        
//        _underlineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - 3, 100, 3)];
//        _underlineView.backgroundColor = UNDER_LINE_COLOR;
//        [self addSubview: _underlineView];
        
        //self.backgroundColor = [UIColor purpleColor];
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

//画背景
//    UIImage* bgImage = [UIImage imageNamed:@"tabbar_bg"];
//    if(bgImage)
//        [bgImage drawInRect:self.bounds];
    [BG_COLOR set];
    UIRectFill(self.bounds);

//画没选中的项
    CGFloat width = self.bounds.size.width / [_itemArray count];
    
    for(int i = 0; i < [_itemArray count]; i++)
    {
        if(i != self.selectedIndex)
        {
            NSString* imageName = [NSString stringWithFormat:@"tabbar_item_%d",i];
            
            UIImage* itemImage = [UIImage imageNamed:imageName];
            if(itemImage)
            {
                CGRect tempRect = CGRectMake(i*width, 0, width, self.bounds.size.height);
                [itemImage drawInRect:tempRect];
                
                NSDictionary* item = [_itemArray objectAtIndex:i];
                NSString* title = [item objectForKey:@"title"];
                if([title length])
                {
                    [DEFAULT_TEXT_COLOR set];
                    
                    [title drawInRect:CGRectMake(i*width, self.bounds.size.height - 16, width, self.bounds.size.height) withFont:[UIFont boldSystemFontOfSize:12] lineBreakMode:NSLineBreakByWordWrapping alignment:NSTextAlignmentCenter];
                }
            }
        }
    }

//画选中的项
    NSString* tabbar_item_image_name = [NSString stringWithFormat:@"tabbar_item_%d_1",self.selectedIndex];
    UIImage* itemImage = [UIImage imageNamed:tabbar_item_image_name];
    if(itemImage)
    {
        CGRect tempRect = CGRectMake(self.selectedIndex*width, 0, width, self.bounds.size.height);
        [itemImage drawInRect:tempRect];
        
        NSDictionary* item = [_itemArray objectAtIndex:self.selectedIndex];
        NSString* title = [item objectForKey:@"title"];
        if([title length])
        {
            [HIGHLIGHT_TEXT_COLOR set];
            
            [title drawInRect:CGRectMake(self.selectedIndex*width, self.bounds.size.height - 16, width, self.bounds.size.height) withFont:[UIFont boldSystemFontOfSize:12] lineBreakMode:NSLineBreakByWordWrapping alignment:NSTextAlignmentCenter];
        }
    }
    
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
    [dict setObject:@"首页" forKey:@"title"];
    [dict setObject:@"tab0" forKey:@"image"];
    [_itemArray addObject:dict];
    [dict release];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"设计案例" forKey:@"title"];
    [dict setObject:@"tab1" forKey:@"image"];
    [_itemArray addObject:dict];
    [dict release];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"促销活动" forKey:@"title"];
    [dict setObject:@"tab2" forKey:@"image"];
    [_itemArray addObject:dict];
    [dict release];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"积分商城" forKey:@"title"];
    [dict setObject:@"tab3" forKey:@"image"];
    [_itemArray addObject:dict];
    [dict release];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"售后服务" forKey:@"title"];
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
    self.selectedIndex = index - 1;
    
//    toRect = CGRectMake((index - 1)*width, 0, width, self.bounds.size.height);
//    //if(toRect.origin.x)
//    {
//        [UIView animateWithDuration:0.3
//                         animations:^{
//                             
//            CGRect rect = _underlineView.frame;
//            rect.origin.x = toRect.origin.x;
//            _underlineView.frame = rect;
//        }];
//    }
    
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
