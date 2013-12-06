//
//  RCActivityDetailView.m
//  RCTemplate
//
//  Created by xuzepei on 12/6/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCActivityDetailView.h"

@implementation RCActivityDetailView

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

- (void)drawRoundRect:(CGRect)rect radius:(CGFloat)radius
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    CGPathRef clippath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius].CGPath;
    CGContextSetFillColorWithColor(ctx, [[UIColor colorWithRed:1 green:1 blue:1 alpha:1] CGColor]);
    
    CGContextAddPath(ctx, clippath);
    CGContextFillPath(ctx);
    
    CGContextRestoreGState(ctx);
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [[UIColor whiteColor] set];
    
    CGRect bgRect = CGRectMake(6, 10, self.bounds.size.width -12, self.bounds.size.height - 20);
    [self drawRoundRect:bgRect radius:12];
    
    CGFloat offset_x = 12.0;
    CGFloat offset_y = 20.0;
    NSString* temp = @"促销活动介绍";
    if([temp length])
    {
        [[UIColor blackColor] set];
        CGSize size = [temp drawInRect:CGRectMake(offset_x, offset_y, self.bounds.size.width -12, 50) withFont:[UIFont systemFontOfSize:18] lineBreakMode:NSLineBreakByTruncatingTail];
        
        [[UIColor grayColor] set];
        CGRect imageRect= CGRectMake(12, 50, self.bounds.size.width - 24, 1);
        UIRectFill(imageRect);
    }
    
    
    offset_y = 60.0f;
    
    temp = [self.item objectForKey:@"desc"];
    if([temp length])
    {
        [[UIColor grayColor] set];
        CGSize size = [temp drawInRect:CGRectMake(offset_x, offset_y, self.bounds.size.width - 30, 20) withFont:[UIFont systemFontOfSize:15] lineBreakMode:NSLineBreakByTruncatingTail];
        offset_y += size.height + 6.0;
    }
}

- (void)updateContent:(NSDictionary *)item
{
    self.item = item;
    
    [self setNeedsDisplay];
}

@end
