//
//  RCCheckButton2.m
//  RCFang
//
//  Created by xuzepei on 9/3/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCCheckButton2.h"

#define IMAGE_HEIGHT 17
#define TEXT_HEIGHT 20

@implementation RCCheckButton2

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        self.checkedImageView = [[[UIImageView alloc] initWithFrame:CGRectMake(0,(frame.size.height - IMAGE_HEIGHT/2.0),IMAGE_HEIGHT,IMAGE_HEIGHT)] autorelease];
        [self addSubview:self.checkedImageView];
        
        self.textLabel = [[[UILabel alloc] initWithFrame:CGRectMake(IMAGE_HEIGHT + 6,(frame.size.height - TEXT_HEIGHT/2.0),100 - IMAGE_HEIGHT - 6,TEXT_HEIGHT)] autorelease];
        self.textLabel.textColor = [UIColor blackColor];
        self.textLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:self.textLabel];
    }
    return self;
}

- (void)dealloc
{
    self.checkedImage = nil;
    self.uncheckedImage = nil;
    self.checkedImageView = nil;
    self.textLabel = nil;
    
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
        self.checkedImageView.image = self.checkedImage;
    }
    else
    {
        self.checkedImageView.image = self.uncheckedImage;
    }
}

- (void)setButtonText:(NSString*)text
{
    self.textLabel.text = text;
}

- (BOOL)isChecked
{
    return _isChecked;
}

@end
