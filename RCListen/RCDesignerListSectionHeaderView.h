//
//  RCDesignerListSectionHeaderView.h
//  RCTemplate
//
//  Created by xuzepei on 11/25/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCDesignerListSectionHeaderView : UIView

@property(nonatomic,retain)id item;

- (void)updateContent:(id)item;

@end
