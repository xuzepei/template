//
//  RCPhoneView.m
//  RCTemplate
//
//  Created by xuzepei on 12/3/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCPhoneView.h"

#define BG_COLOR [UIColor colorWithRed:225/255.0 green:225/255.0 blue:225/255.0 alpha:225/255.0]
#define DEFAULT_TEXT_COLOR [UIColor colorWithRed:47/255.0 green:126/255.0 blue:219/255.0 alpha:225/255.0]

@implementation RCPhoneView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)dealloc
{
    self.text = nil;
    self.delegate = nil;
    
    [super dealloc];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    [BG_COLOR set];
    UIRectFill(self.bounds);
    
    if([self.text length])
    {
        [DEFAULT_TEXT_COLOR set];
        CGRect temp = self.bounds;
        temp.origin.y = (temp.size.height - 16)/2.0;
        [self.text drawInRect:temp withFont:[UIFont boldSystemFontOfSize:16] lineBreakMode:NSLineBreakByWordWrapping alignment:NSTextAlignmentCenter];
    }
}

- (void)updateContent:(NSString*)text
{
    self.text = text;
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(clickedPhoneNumber:)])
    {
        [self.delegate clickedPhoneNumber:nil];
    }
}


@end
