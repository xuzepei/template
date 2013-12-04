//
//  RCBannerScrollView.h
//  RCTemplate
//
//  Created by xuzepei on 11/25/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCBannerScrollView : UIView<UIScrollViewDelegate>

@property(nonatomic,retain)UIScrollView* scrollView;
@property(nonatomic,retain)NSMutableArray* itemArray;
@property(nonatomic,retain)UIView* underLineView;
@property(nonatomic,retain)NSTimer* timer;
@property(assign)int currentIndex;
@property(assign)id delegate;

- (void)updateContent:(NSArray*)itemArray;
- (void)goToIndex:(int)index;

@end
