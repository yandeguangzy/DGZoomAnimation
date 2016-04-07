//
//  LBZoomImageView.m
//  LBBuyer
//
//  Created by FSLB on 16/4/7.
//  Copyright © 2016年 Lubao. All rights reserved.
//

#import "LBZoomImageView.h"

@implementation LBZoomImageView{
    //记录缩放时间内共缩放次数
    NSInteger allTimes;
}

- (instancetype) initWithFrame:(CGRect) frame andZoomTimes:(CGFloat)zoomTimes andFrequency:(CGFloat) frequency andContinuousTime:(NSInteger) continuousTime{
    self = [super initWithFrame:frame];
    if(self){
        _IsStop = YES;
        _times = zoomTimes;
        _frequency = frequency;
        _continuousTime = continuousTime;
        _initialBounds = frame;
         self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void) start{
    if(self == nil){
        return;
    }
    if(_IsStop){
        _IsStop = NO;
    }else{
        return;
    }
    [self smallStop];
}

- (void)smallStop{
    if(_continuousTime != 0){
        if(allTimes < _continuousTime * _frequency){
            allTimes ++;
            NSLog(@"%ld",allTimes);
        }else{
            _IsStop = YES;
        }
    }
    if(_IsStop){
        self.bounds = _initialBounds;
        return;
    }
    //使用bounds，以中心点位原点进行缩放
    CGRect bounds = _initialBounds;
    bounds.size.height = _initialBounds.size.height * _times;
    bounds.size.width = _initialBounds.size.width * _times;
    
    //设置首尾动画
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1/_frequency/2];
    self.bounds = bounds;
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(bigStop:)];
    [UIView commitAnimations];
    
}

- (void)bigStop:(id)sender {
    if(_IsStop){
        self.bounds = _initialBounds;
        return;
    }
    //使用bounds，以中心点位原点进行缩放
    CGRect bounds = _initialBounds;
    
    //设置首尾动画
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1/self.frequency/2];
    self.bounds = bounds;
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(smallStop)];
    [UIView commitAnimations];  
}

- (void) stop{
    _IsStop = YES;
}

@end
