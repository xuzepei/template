//
//  RCGoodsView.m
//  RCTemplate
//
//  Created by xuzepei on 12/6/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCGoodsView.h"

#define IMAGE_RECT CGRectMake(22,100,self.bounds.size.width -44,180)

@implementation RCGoodsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
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
    
    CGRect bgRect = CGRectMake(15, 60, self.bounds.size.width -30, 410);
    [self drawRoundRect:bgRect radius:12];
    
    CGFloat offset_x = 22.0;
    CGFloat offset_y = 70.0;
    NSString* temp = @"直接出示此页即可在门店领取";
    if([temp length])
    {
        [[UIColor orangeColor] set];
        CGSize size = [temp drawInRect:CGRectMake(offset_x, offset_y, self.bounds.size.width -offset_x*2, 20) withFont:[UIFont systemFontOfSize:18] lineBreakMode:NSLineBreakByTruncatingTail
                       alignment:NSTextAlignmentCenter];
    }
    
    UIRectFill(IMAGE_RECT);
    
    offset_y = 290.0f;
    
    temp = [self.item objectForKey:@"title"];
    if([temp length])
    {
        [[UIColor grayColor] set];
        CGSize size = [temp drawInRect:CGRectMake(offset_x, offset_y, self.bounds.size.width - offset_x*2, 20) withFont:[UIFont systemFontOfSize:15] lineBreakMode:NSLineBreakByTruncatingTail];
        offset_y += size.height + 6.0;
    }
    
    UIImage* payImage = [UIImage imageNamed:@"pay_button_selected"];
    [payImage drawAtPoint:CGPointMake(260, offset_y - 8.0)];
    
    temp = [self.item objectForKey:@"price"];
    if([temp length])
    {
        [[UIColor orangeColor] set];
        
        NSString* price = [NSString stringWithFormat:@"价格: %@分",temp];
        CGSize size = [price drawInRect:CGRectMake(offset_x, offset_y, self.bounds.size.width - offset_x*2, 20) withFont:[UIFont systemFontOfSize:15] lineBreakMode:NSLineBreakByTruncatingTail];
        offset_y += size.height + 12.0;
    }
    
    
    [[UIColor grayColor] set];
    CGRect lineRect = CGRectMake(offset_x, offset_y, self.bounds.size.width - offset_x*2, 1);
    UIRectFill(lineRect);
    
    offset_y += 12.0;
    
    temp = [self.item objectForKey:@"count"];
    if([temp length])
    {
        [[UIColor grayColor] set];
        
        NSString* count = [NSString stringWithFormat:@"数量: %@卷",temp];
        CGSize size = [count drawInRect:CGRectMake(offset_x, offset_y, self.bounds.size.width - offset_x*2, 20) withFont:[UIFont systemFontOfSize:15] lineBreakMode:NSLineBreakByTruncatingTail];
        offset_y += size.height + 6.0;
    }
    
    temp = [self.item objectForKey:@"address"];
    if([temp length])
    {
        [[UIColor grayColor] set];
        
        NSString* address = @"地址: ";
        CGSize size = [address drawInRect:CGRectMake(offset_x, offset_y, self.bounds.size.width - offset_x*2, 20) withFont:[UIFont systemFontOfSize:15] lineBreakMode:NSLineBreakByTruncatingTail];
        
        size = [temp drawInRect:CGRectMake(offset_x + size.width, offset_y, self.bounds.size.width - offset_x*2 - size.width*2, 40) withFont:[UIFont systemFontOfSize:15] lineBreakMode:NSLineBreakByTruncatingTail];
        
        offset_y += size.height + 6.0;
    }
    
    
    temp = [self.item objectForKey:@"phone"];
    if([temp length])
    {
        [[UIColor grayColor] set];
        
        NSString* count = [NSString stringWithFormat:@"电话: %@",temp];
        CGSize size = [count drawInRect:CGRectMake(offset_x, offset_y, self.bounds.size.width - offset_x*2, 20) withFont:[UIFont systemFontOfSize:15] lineBreakMode:NSLineBreakByTruncatingTail];
        offset_y += size.height + 6.0;
    }
}

- (void)updateContent:(NSDictionary*)item
{
    self.item = item;
    
    [self setNeedsDisplay];
}

@end
