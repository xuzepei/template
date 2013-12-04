//
//  RCDesignerListSectionHeaderView.m
//  RCTemplate
//
//  Created by xuzepei on 11/25/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCDesignerListSectionHeaderView.h"

@implementation RCDesignerListSectionHeaderView

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
        [text drawInRect:CGRectMake(10, 6, self.bounds.size.width - 20, 20) withFont:[UIFont systemFontOfSize:18] lineBreakMode:NSLineBreakByTruncatingTail];
    }
}


- (void)updateContent:(id)item
{
    self.item = item;
    
    [self setNeedsDisplay];
}

@end
