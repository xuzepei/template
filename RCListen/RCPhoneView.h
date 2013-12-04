//
//  RCPhoneView.h
//  RCTemplate
//
//  Created by xuzepei on 12/3/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RCPhoneViewDelegate <NSObject>

- (void)clickedPhoneNumber:(id)sender;

@end

@interface RCPhoneView : UIView

@property(nonatomic,retain)NSString* text;
@property(assign)id delegate;

- (void)updateContent:(NSString*)text;

@end
