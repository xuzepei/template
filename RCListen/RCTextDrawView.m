//
//  RCTextDrawView.m
//  RCTemplate
//
//  Created by xuzepei on 12/4/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCTextDrawView.h"

@implementation RCTextDrawView

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
    NSString* temp = [self.item objectForKey:@"text"];
    if([temp length])
    {
        CGRect tempRect = self.bounds;
        tempRect.origin.y = 10.0;
        tempRect.origin.x = 10.0;
        tempRect.size.width = 300.0;
        [temp drawInRect:tempRect withFont:[UIFont systemFontOfSize:18] lineBreakMode:NSLineBreakByWordWrapping];
    }
}

- (void)updateContent:(NSDictionary*)item
{
    self.item = item;
    
    [self setNeedsDisplay];
}


@end
