//
//  RCScrollTextView.m
//  RCTemplate
//
//  Created by xuzepei on 12/4/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCScrollTextView.h"

@implementation RCScrollTextView

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

- (void)updateContent:(NSDictionary*)item
{
    self.item = item;
    
    if(nil == _drawView)
    {
        _drawView = [[RCTextDrawView alloc] initWithFrame:CGRectZero];
    }
    
    [self addSubview:_drawView];
    
    NSString* temp = [self.item objectForKey:@"text"];
    CGSize size = [temp sizeWithFont:[UIFont systemFontOfSize:18] constrainedToSize:CGSizeMake([RCTool getScreenSize].width - 20, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
    _drawView.frame = CGRectMake(0, 0, [RCTool getScreenSize].width, size.height + 20);
    [_drawView updateContent:self.item];
    
    [self setContentSize:CGSizeMake([RCTool getScreenSize].width, size.height + 40)];
}


@end
