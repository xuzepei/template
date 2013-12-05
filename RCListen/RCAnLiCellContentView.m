//
//  RCAnLiCellContentView.m
//  RCTemplate
//
//  Created by xuzepei on 12/5/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCAnLiCellContentView.h"

#define LINE_COLOR [UIColor colorWithRed:227/255.0 green:227/255.0 blue:227/255.0 alpha:1.0]

#define LIKE_BUTTON_RECT CGRectMake([RCTool getScreenSize].width - 56,self.bounds.size.height - 44,40,40)

#define IMAGE_RECT_0 CGRectMake(8, 0, 215, 182)
#define IMAGE_RECT_1 CGRectMake([RCTool getScreenSize].width - 8 - 87, 0, 87, 90)
#define IMAGE_RECT_2 CGRectMake([RCTool getScreenSize].width - 8 - 87, 182 - 90, 87, 90)


@implementation RCAnLiCellContentView

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
    CGRect imageRect1 = IMAGE_RECT_1;
    CGRect imageRect2 = IMAGE_RECT_2;
    CGRect lineRect = CGRectMake(8, self.bounds.size.height - 1, [RCTool getScreenSize].width - 16, 1);
    
    [[UIColor redColor] set];
    UIRectFill(imageRect0);
    
    [[UIColor greenColor] set];
    UIRectFill(imageRect1);
    
    [[UIColor blueColor] set];
    UIRectFill(imageRect2);
    
    NSString* desc = [self.item objectForKey:@"desc"];
    if([desc length])
    {
        [[UIColor blackColor] set];
        [desc drawInRect:CGRectMake(14, self.bounds.size.height - 32, [RCTool getScreenSize].width - 70, 20) withFont:[UIFont systemFontOfSize:15] lineBreakMode:NSLineBreakByTruncatingTail];
    }
    
    [LINE_COLOR set];
    UIRectFill(lineRect);
    
    if(self.isLiked)
    {
        UIImage* image = [UIImage imageNamed:@"like_button"];
        [image drawInRect:LIKE_BUTTON_RECT];
    }
    else
    {
        UIImage* image = [UIImage imageNamed:@"unlike_button"];
        [image drawInRect:LIKE_BUTTON_RECT];
    }
}


- (void)updateContent:(NSDictionary*)item delegate:(id)delegate token:(NSDictionary*)token
{
    self.item = item;
    self.delegate = delegate;
    self.token = token;
    
    self.isLiked = YES;
    
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    UITouch* touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    if(CGRectContainsPoint(LIKE_BUTTON_RECT, point))
    {
        self.isLiked = self.isLiked?NO:YES;
        [self setNeedsDisplay];
    }
    else
    {
        if(self.delegate && [self.delegate respondsToSelector:@selector(clickedCell:)])
        {
            [self.delegate clickedCell:self.item];
        }
    }
}

@end
