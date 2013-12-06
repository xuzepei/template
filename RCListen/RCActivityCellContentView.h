//
//  RCActivityCellContentView.h
//  RCTemplate
//
//  Created by xuzepei on 12/6/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCPublicCellContentView.h"

@protocol RCActivityContentViewDelegate <NSObject>

@optional
- (void)clickedCell:(id)token;

@end

@interface RCActivityCellContentView : RCPublicCellContentView

- (void)updateContent:(NSDictionary*)item delegate:(id)delegate token:(NSDictionary*)token;

@end
