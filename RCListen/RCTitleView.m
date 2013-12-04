//
//  RCTitleView.m
//  RCTemplate
//
//  Created by xuzepei on 11/25/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCTitleView.h"

@implementation RCTitleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
//        CGFloat offset_y = 0;
//        if([RCTool systemVersion] >= 7.0)
//            offset_y = STATUS_BAR_HEIGHT;
        
        self.titleLabel = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, [RCTool getScreenSize].width-20, 44)] autorelease];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.shadowOffset = CGSizeMake(1,1);
        self.titleLabel.shadowColor = [UIColor blackColor];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:22.0];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.textColor = NAVIGATION_BAR_TITLE_COLOR;
        
        [self addSubview:_titleLabel];
    }
    return self;
}

- (void)dealloc
{
    self.delegate = nil;
    self.titleLabel = nil;
    
    [super dealloc];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
