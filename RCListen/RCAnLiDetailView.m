//
//  RCAnLiDetailView.m
//  RCTemplate
//
//  Created by xuzepei on 12/5/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCAnLiDetailView.h"

@implementation RCAnLiDetailView

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
    
    CGRect headerRect = CGRectMake(0, 0, self.bounds.size.width, 86);
    UIRectFill(headerRect);
    
    CGRect infoRect = CGRectMake(6, 106, self.bounds.size.width -12, self.bounds.size.height - 126);
    [self drawRoundRect:infoRect radius:12];
    
    
    NSString* temp = @"华都美林湾 打造品质现代 工长大本营首席设计师 作品";
    if([temp length])
    {
        CGFloat offset_x = 8.0;
        CGFloat offset_y = 8.0;
        
        [[UIColor blackColor] set];
        CGSize size = [temp drawInRect:CGRectMake(offset_x, offset_y, self.bounds.size.width -12, 50) withFont:[UIFont systemFontOfSize:18] lineBreakMode:NSLineBreakByTruncatingTail];
        offset_y += size.height + 8.0;
        
        [[UIColor grayColor] set];
        size = [@"设计师: " drawInRect:CGRectMake(offset_x,offset_y, self.bounds.size.width -12, 30) withFont:[UIFont systemFontOfSize:14] lineBreakMode:NSLineBreakByTruncatingTail];
        offset_x += size.width;
        
        [[UIColor orangeColor] set];
        size = [@"杜婷婷" drawInRect:CGRectMake(offset_x, offset_y, self.bounds.size.width -12, 30) withFont:[UIFont systemFontOfSize:14] lineBreakMode:NSLineBreakByTruncatingTail];
    }
    
    
    CGFloat offset_x = 14.0;
    CGFloat offset_y = 120;
    
    temp = @"楼盘名称: ";
    if([temp length])
    {
        [[UIColor grayColor] set];
        CGSize size = [temp drawInRect:CGRectMake(offset_x, offset_y, self.bounds.size.width - 30, 20) withFont:[UIFont systemFontOfSize:15] lineBreakMode:NSLineBreakByTruncatingTail];
        offset_y += size.height + 6.0;
    }
    
    temp = @"面积: ";
    if([temp length])
    {
        [[UIColor grayColor] set];
        CGSize size = [temp drawInRect:CGRectMake(offset_x, offset_y, self.bounds.size.width - 30, 20) withFont:[UIFont systemFontOfSize:15] lineBreakMode:NSLineBreakByTruncatingTail];
        offset_y += size.height + 6.0;
    }
    
    temp = @"设计师: ";
    if([temp length])
    {
        [[UIColor grayColor] set];
        CGSize size = [temp drawInRect:CGRectMake(offset_x, offset_y, self.bounds.size.width - 30, 20) withFont:[UIFont systemFontOfSize:15] lineBreakMode:NSLineBreakByTruncatingTail];
        offset_y += size.height + 6.0;
    }
    
    temp = @"套餐类型: ";
    if([temp length])
    {
        [[UIColor grayColor] set];
        CGSize size = [temp drawInRect:CGRectMake(offset_x, offset_y, self.bounds.size.width - 30, 20) withFont:[UIFont systemFontOfSize:15] lineBreakMode:NSLineBreakByTruncatingTail];
        offset_y += size.height + 6.0;
    }
    
    temp = @"装修风格: ";
    if([temp length])
    {
        [[UIColor grayColor] set];
        CGSize size = [temp drawInRect:CGRectMake(offset_x, offset_y, self.bounds.size.width - 30, 20) withFont:[UIFont systemFontOfSize:15] lineBreakMode:NSLineBreakByTruncatingTail];
        offset_y += size.height + 6.0;
    }
    
    temp = @"施工周期: ";
    if([temp length])
    {
        [[UIColor grayColor] set];
        CGSize size = [temp drawInRect:CGRectMake(offset_x, offset_y, self.bounds.size.width - 30, 20) withFont:[UIFont systemFontOfSize:15] lineBreakMode:NSLineBreakByTruncatingTail];
        offset_y += size.height + 6.0;
    }
    
    temp = @"套餐造价: ";
    if([temp length])
    {
        [[UIColor grayColor] set];
        CGSize size = [temp drawInRect:CGRectMake(offset_x, offset_y, self.bounds.size.width - 30, 20) withFont:[UIFont systemFontOfSize:15] lineBreakMode:NSLineBreakByTruncatingTail];
        offset_y += size.height + 6.0;
    }
    
    temp = @"总造价: ";
    if([temp length])
    {
        [[UIColor grayColor] set];
        CGSize size = [temp drawInRect:CGRectMake(offset_x, offset_y, self.bounds.size.width - 30, 20) withFont:[UIFont systemFontOfSize:15] lineBreakMode:NSLineBreakByTruncatingTail];
        offset_y += size.height + 6.0;
    }
    
    
    CGRect imageRect= CGRectMake(offset_x, offset_y + 6.0, self.bounds.size.width - 30, 172);
    UIRectFill(imageRect);
    
}

- (void)updateContent:(NSDictionary *)item
{
    self.item = item;
    
    [self setNeedsDisplay];
}

@end
