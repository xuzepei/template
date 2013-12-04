//
//  RCBannerView.m
//  RCTemplate
//
//  Created by xuzepei on 11/25/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCBannerView.h"
#import "RCImageLoader.h"

@implementation RCBannerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)dealloc
{
    self.item = nil;
    self.imageUrl = nil;
    self.image = nil;
    self.delegate = nil;
    
    [super dealloc];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    if(self.image)
    {
        [self.image drawInRect:self.bounds];
    }
}

- (void)updateContent:(NSDictionary*)item
{
    self.image = nil;
    self.item = item;
    
    self.imageUrl = [item objectForKey:@"url"];
    NSString* imageName = [item objectForKey:@"image_name"];
    if([imageName length])
    {
        UIImage* image = [UIImage imageNamed:imageName];
        if(image)
            self.image = image;
    }
    else if([self.imageUrl length])
    {
        UIImage* image = [RCTool getImageFromLocal:self.imageUrl];
        if(image)
            self.image = image;
        else
        {
            [[RCImageLoader sharedInstance] saveImage:self.imageUrl
                                             delegate:self
                                                token:nil];
        }
    }
    
    [self setNeedsDisplay];
}

- (void)succeedLoad:(id)result token:(id)token
{
	NSDictionary* dict = (NSDictionary*)result;
	NSString* urlString = [dict valueForKey: @"url"];
    
	if([urlString isEqualToString: self.imageUrl])
	{
		self.image = [RCTool getImageFromLocal:self.imageUrl];
		[self setNeedsDisplay];
	}
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(_delegate && [_delegate respondsToSelector:@selector(clickedBanner:)])
    {
        [_delegate clickedBanner:self.item];
    }
}

@end
