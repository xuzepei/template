//
//  RCGoodsCellContentView.m
//  RCTemplate
//
//  Created by xuzepei on 12/6/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCGoodsCellContentView.h"

@implementation RCGoodsCellContentView

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
    [super dealloc];
}

- (void)drawRoundImage:(UIImage*)image rect:(CGRect)rect radius:(CGFloat)radius
{
    if(nil == image)
        return;
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    //    CGPathRef clippath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius].CGPath;
    CGPathRef clippath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(rect.origin.x, rect.origin.y, 2.0*radius, 2.0*radius)
                                                    cornerRadius:radius].CGPath;
    CGContextAddPath(ctx, clippath);
    CGContextClip(ctx);
    [image drawInRect:rect];
    CGContextRestoreGState(ctx);
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [[UIColor whiteColor] set];
    UIRectFill(self.bounds);
    
    if(nil == self.item)
        return;
    
    //    UIImage* header_frame = [UIImage imageNamed:@"designer_header_frame"];
    //    if(header_frame)
    //    {
    //        [header_frame drawInRect:CGRectMake(8, 8, header_frame.size.width, header_frame.size.height)];
    //    }
    
    CGFloat offset_x = 80.0f;
    CGFloat offset_y = 20.0f;
    
    NSString* temp = [self.item objectForKey:@"title"];
    if([temp length])
    {
        [[UIColor grayColor] set];
        CGSize size = [temp drawInRect:CGRectMake(offset_x, offset_y, self.bounds.size.width - 130, 40) withFont:[UIFont systemFontOfSize:14] lineBreakMode:NSLineBreakByTruncatingTail];
        offset_y += size.height + 4.0;
    }
    
    temp = [NSString stringWithFormat:@"价格: %@分",[self.item objectForKey:@"price"]];
    if([temp length])
    {
        [[UIColor orangeColor] set];
        CGSize size = [temp drawInRect:CGRectMake(offset_x, offset_y, self.bounds.size.width - 130, 30) withFont:[UIFont systemFontOfSize:14] lineBreakMode:NSLineBreakByTruncatingTail];
        offset_y += size.height + 6.0;
    }
    
    UIImage* image = [UIImage imageNamed:@"pay_button"];
    if(image)
    {
        [image drawAtPoint:CGPointMake(266, 32)];
    }
}


- (void)updateContent:(NSDictionary*)item delegate:(id)delegate token:(NSDictionary*)token
{
    self.item = item;
    self.delegate = delegate;
    self.token = token;
    
    [self setNeedsDisplay];
}

@end
