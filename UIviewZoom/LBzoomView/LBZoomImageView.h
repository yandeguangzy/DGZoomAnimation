//
//  LBZoomImageView.h
//  LBBuyer
//
//  Created by FSLB on 16/4/7.
//  Copyright © 2016年 Lubao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBZoomImageView : UIImageView

@property (nonatomic) CGFloat times;
@property (nonatomic) CGFloat frequency;
@property (nonatomic) NSInteger continuousTime;
@property (nonatomic) CGRect initialBounds;

//缩放状态
@property (nonatomic, assign) BOOL IsStop;

- (instancetype) initWithFrame:(CGRect) frame andZoomTimes:(CGFloat)zoomTimes andFrequency:(CGFloat) frequency andContinuousTime:(NSInteger) continuousTime;


- (void) start;
- (void) stop;
@end
