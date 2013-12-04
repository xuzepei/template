//
//  RCDesignerView.h
//  RCTemplate
//
//  Created by xuzepei on 12/3/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCDesignerView : UIView

@property(nonatomic,retain)NSDictionary* item;

- (void)updateContent:(NSDictionary*)item;

@end
