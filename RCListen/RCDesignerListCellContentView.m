//
//  RCDesignerListCellContentView.m
//  RCTemplate
//
//  Created by xuzepei on 11/25/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCDesignerListCellContentView.h"

@implementation RCDesignerListCellContentView

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
    
//    UIImage* header_frame = [UIImage imageNamed:@"designer_header_frame"];
//    if(header_frame)
//    {
//        [header_frame drawInRect:CGRectMake(8, 8, header_frame.size.width, header_frame.size.height)];
//    }
    
    CGFloat offset_x = 100.0f;
    CGFloat offset_y = 30.0f;
    
    NSString* temp = @"杜婷婷";
    if([temp length])
    {
        [[UIColor blackColor] set];
        CGSize size = [temp drawInRect:CGRectMake(offset_x, offset_y, self.bounds.size.width - 110, 20) withFont:[UIFont systemFontOfSize:14] lineBreakMode:NSLineBreakByTruncatingTail];
        offset_y += size.height + 4.0;
    }
    
    temp = @"设计没有完美，但我可以尽量做到极致之美。";
    if([temp length])
    {
        [[UIColor grayColor] set];
        CGSize size = [temp drawInRect:CGRectMake(offset_x, offset_y, self.bounds.size.width - 110, 30) withFont:[UIFont systemFontOfSize:12] lineBreakMode:NSLineBreakByTruncatingTail];
        offset_y += size.height + 6.0;
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
