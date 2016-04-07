//
//  UIView+LBZoomView.h
//  LBBuyer
//
//  Created by FSLB on 16/4/7.
//  Copyright © 2016年 Lubao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBZoomImageView.h"

@interface UIImageView (LBZoomView)

- (void) startAnimationWithFrame:(CGRect) frame andZoomTimes:(CGFloat)zoomTimes andFrequency:(CGFloat) frequency andContinuousTime:(NSInteger) continuousTime;

- (void) startAnimation;
- (void) stopAnimation;

- (BOOL) Animationing;

@property (nonatomic, strong) LBZoomImageView *zoomView;

@end
