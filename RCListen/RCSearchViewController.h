//
//  RCSearchViewController.h
//  RCTemplate
//
//  Created by xuzepei on 12/5/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCPublicViewController.h"

@interface RCSearchViewController : RCPublicViewController<UITextFieldDelegate>

@property(nonatomic,retain)UITextField* searchTF;

@end
