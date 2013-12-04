//
//  RCTextDrawView.h
//  RCTemplate
//
//  Created by xuzepei on 12/4/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCTextDrawView : UIView

@property(nonatomic,retain)NSDictionary* item;

- (void)updateContent:(NSDictionary*)item;

@end
