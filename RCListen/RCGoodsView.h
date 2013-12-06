//
//  RCGoodsView.h
//  RCTemplate
//
//  Created by xuzepei on 12/6/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCGoodsView : UIView

@property(nonatomic,retain)NSDictionary* item;

- (void)updateContent:(NSDictionary*)item;

@end
