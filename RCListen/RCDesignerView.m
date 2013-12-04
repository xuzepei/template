//
//  RCDesignerView.m
//  RCTemplate
//
//  Created by xuzepei on 12/3/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCDesignerView.h"
#import <QuartzCore/QuartzCore.h>

#define IMAGE_HEIGHT 168.0f

@implementation RCDesignerView

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
    [[UIColor blackColor] set];
    UIRectFill(self.bounds);
    
    UIImage* bg = [UIImage imageNamed:@"bg"];
    if(bg)
        [bg drawAtPoint:CGPointMake(0, STATUS_BAR_HEIGHT)];
    
    CGRect imageRect = CGRectMake(0, STATUS_BAR_HEIGHT, self.bounds.size.width, IMAGE_HEIGHT);
    [[UIColor redColor] set];
    UIRectFill(imageRect);
    
    UIImage* headerFrame = [UIImage imageNamed:@"designer_header_frame"];
    if(headerFrame)
    {
        [headerFrame drawAtPoint:CGPointMake(9, 116)];
    }
    
    NSString* temp = @"杜婷婷";
    if([temp length])
    {
        [[UIColor whiteColor] set];
        [temp drawInRect:CGRectMake(82, 132, 225, 20) withFont:[UIFont boldSystemFontOfSize:18] lineBreakMode:NSLineBreakByTruncatingTail];
    }
    
    temp = @"设计没有完美，但我可以尽量做到极致之美。";
    if([temp length])
    {
        [[UIColor whiteColor] set];
        [temp drawInRect:CGRectMake(82, 160, 225, 20) withFont:[UIFont boldSystemFontOfSize:12] lineBreakMode:NSLineBreakByTruncatingTail];
    }
}


- (void)updateContent:(NSDictionary*)item
{
    self.item = item;
    [self setNeedsDisplay];
}

@end
