//
//  RCScrollTextView.h
//  RCTemplate
//
//  Created by xuzepei on 12/4/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCTextDrawView.h"

@interface RCScrollTextView : UIScrollView

@property(nonatomic,retain)NSDictionary* item;
@property(nonatomic,retain)RCTextDrawView* drawView;

- (void)updateContent:(NSDictionary*)item;

@end
