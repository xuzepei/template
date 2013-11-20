//
//  WRCheckButton.m
//  WRadio
//
//  Created by xuzepei on 6/21/13.
//  Copyright (c) 2013 SanguoTech Co.,Ltd. All rights reserved.
//

#import "RCCheckButton.h"

@implementation RCCheckButton

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
    self.checkedImage = nil;
    self.uncheckedImage = nil;
    
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

- (void)setChecked:(BOOL)isChecked
{
    _isChecked = isChecked;
    
    if(_isChecked)
    {
        [self setImage:self.checkedImage forState:UIControlStateNormal];
    }
    else
    {
        [self setImage:self.uncheckedImage forState:UIControlStateNormal];
    }
}

- (BOOL)isChecked
{
    return _isChecked;
}

@end
