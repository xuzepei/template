//
//  RCCenterListHeaderView.m
//  RCTemplate
//
//  Created by xuzepei on 12/5/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCCenterListHeaderView.h"

@implementation RCCenterListHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)dealloc
{
    self.item = nil;
    
    [super dealloc];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    NSString* text = (NSString*)self.item;
    if([text length])
    {
        [[UIColor orangeColor] set];
        [text drawInRect:CGRectMake(10, 10, self.bounds.size.width - 20, 20) withFont:[UIFont systemFontOfSize:18] lineBreakMode:NSLineBreakByTruncatingTail];
    }
}


- (void)updateContent:(id)item
{
    self.item = item;
    
    [self setNeedsDisplay];
}

@end
