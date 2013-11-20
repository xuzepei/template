//
//  WRCheckButton.h
//  WRadio
//
//  Created by xuzepei on 6/21/13.
//  Copyright (c) 2013 SanguoTech Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCCheckButton : UIButton
{
    BOOL _isChecked;
}

@property(nonatomic,retain)UIImage* checkedImage;
@property(nonatomic,retain)UIImage* uncheckedImage;

- (void)setChecked:(BOOL)isChecked;
- (BOOL)isChecked;

@end
