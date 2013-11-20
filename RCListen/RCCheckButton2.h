//
//  RCCheckButton2.h
//  RCFang
//
//  Created by xuzepei on 9/3/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCCheckButton2 : UIButton
{
    BOOL _isChecked;
}

@property(nonatomic,retain)UIImage* checkedImage;
@property(nonatomic,retain)UIImage* uncheckedImage;
@property(nonatomic,retain)UIImageView* checkedImageView;
@property(nonatomic,retain)UILabel* textLabel;

- (void)setChecked:(BOOL)isChecked;
- (void)setButtonText:(NSString*)text;
- (BOOL)isChecked;

@end
