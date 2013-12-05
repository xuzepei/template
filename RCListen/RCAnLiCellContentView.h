//
//  RCAnLiCellContentView.h
//  RCTemplate
//
//  Created by xuzepei on 12/5/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCPublicCellContentView.h"

@protocol RCAnLiCellContentViewDelegate <NSObject>

@optional
- (void)clickedCell:(id)token;

@end

@interface RCAnLiCellContentView : RCPublicCellContentView

@property(nonatomic,assign)BOOL isLiked;

- (void)updateContent:(NSDictionary*)item delegate:(id)delegate token:(NSDictionary*)token;

@end
