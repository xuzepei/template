//
//  RCAnLiDetailView.h
//  RCTemplate
//
//  Created by xuzepei on 12/5/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCAnLiDetailView : UIView

@property(nonatomic,retain)NSDictionary* item;

- (void)updateContent:(NSDictionary*)item;

@end
