//
//  RCBannerView.h
//  RCTemplate
//
//  Created by xuzepei on 11/25/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RCBannerViewDelegate <NSObject>

- (void)clickedBanner:(id)token;

@end

@interface RCBannerView : UIView

@property(nonatomic,retain)NSDictionary* item;
@property(nonatomic,retain)NSString* imageUrl;
@property(nonatomic,retain)UIImage* image;
@property(assign)id delegate;

- (void)updateContent:(NSDictionary*)item;

@end
