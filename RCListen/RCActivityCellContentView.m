//
//  RCActivityCellContentView.m
//  RCTemplate
//
//  Created by xuzepei on 12/6/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCActivityCellContentView.h"

#define LINE_COLOR [UIColor colorWithRed:227/255.0 green:227/255.0 blue:227/255.0 alpha:1.0]

#define IMAGE_RECT_0 CGRectMake(8, 0, [RCTool getScreenSize].width - 16, 182)

@implementation RCActivityCellContentView

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
    [super dealloc];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [[UIColor whiteColor] set];
    
    CGRect bgRect = CGRectMake(8, 0, [RCTool getScreenSize].width - 16, self.bounds.size.height);
    
    UIRectFill(bgRect);
    
    CGRect imageRect0 = IMAGE_RECT_0;
    CGRect lineRect = CGRectMake(8, self.bounds.size.height - 1, [RCTool getScreenSize].width - 16, 1);
    
    [[UIColor redColor] set];
    UIRectFill(imageRect0);
    
    NSString* desc = [self.item objectForKey:@"desc"];
    if([desc length])
    {
        [[UIColor blackColor] set];
        [desc drawInRect:CGRectMake(14,188, [RCTool getScreenSize].width - 40,70) withFont:[UIFont systemFontOfSize:15] lineBreakMode:NSLineBreakByTruncatingTail];
    }
    
    [LINE_COLOR set];
    UIRectFill(lineRect);
    
    UIImage* image = [UIImage imageNamed:@"detail_button"];
    [image drawAtPoint:CGPointMake(294, 210)];
}


- (void)updateContent:(NSDictionary*)item delegate:(id)delegate token:(NSDictionary*)token
{
    self.item = item;
    self.delegate = delegate;
    self.token = token;
    
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    UITouch* touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    {
        if(self.delegate && [self.delegate respondsToSelector:@selector(clickedCell:)])
        {
            [self.delegate clickedCell:self.item];
        }
    }
}

@end
