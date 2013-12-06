//
//  RCShopView.m
//  RCTemplate
//
//  Created by xuzepei on 12/6/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCShopView.h"

@implementation RCShopView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
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
    
    CGRect bgRect = CGRectMake(6, 6, self.bounds.size.width -12, self.bounds.size.height - 60);
    [self drawRoundRect:bgRect radius:12];
    
//    CGFloat offset_x = 16.0;
//    CGFloat offset_y = 86.0;
//    NSString* temp = @"用户登录后积分兑换，兑换成功后可线下到点取货";
//    if([temp length])
//    {
//        [[UIColor grayColor] set];
//        CGSize size = [temp drawInRect:CGRectMake(offset_x, offset_y, self.bounds.size.width -12, 20) withFont:[UIFont systemFontOfSize:13] lineBreakMode:NSLineBreakByTruncatingTail];
//        
//
//        CGRect imageRect= CGRectMake(offset_x, offset_y + 24, self.bounds.size.width - 32, 1);
//        UIRectFill(imageRect);
//    }
}


@end
