//
//  RCCenterListHeaderView.h
//  RCTemplate
//
//  Created by xuzepei on 12/5/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCCenterListHeaderView : UIView

@property(nonatomic,retain)id item;

- (void)updateContent:(id)item;

@end
