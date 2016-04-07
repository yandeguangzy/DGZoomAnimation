//
//  UIView+LBZoomView.m
//  LBBuyer
//
//  Created by FSLB on 16/4/7.
//  Copyright © 2016年 Lubao. All rights reserved.
//

#import "UIView+LBZoomView.h"
#import <objc/runtime.h>

static const void * zoomViewKey = &zoomViewKey;
//static const void * isStopKey = &isStopKey;


@implementation UIImageView (LBZoomView)
@dynamic zoomView;

- (void) startAnimationWithFrame:(CGRect) frame andZoomTimes:(CGFloat)zoomTimes andFrequency:(CGFloat) frequency andContinuousTime:(NSInteger) continuousTime{
    if ([self isKindOfClass:[UIImageView class]]){
        UIImageView *baseView = (UIImageView *)self;
        if(self.zoomView == nil){
            self.zoomView = [[LBZoomImageView alloc] initWithFrame:CGRectMake(0, 0, baseView.bounds.size.width, baseView.bounds.size.height) andZoomTimes:zoomTimes andFrequency:frequency andContinuousTime:continuousTime];
            self.zoomView.center = CGPointMake(baseView.bounds.size.width/2, baseView.bounds.size.height/2);
            self.zoomView.image = baseView.image;
            baseView.image = nil;
            [baseView addSubview:self.zoomView];
            [self.zoomView start];
        }
    }
    
}

- (void) startAnimation{
    if ([self isKindOfClass:[UIImageView class]]){
        UIImageView *baseView = (UIImageView *)self;
        if(self.zoomView == nil){
            self.zoomView = [[LBZoomImageView alloc] initWithFrame:CGRectMake(0, 0, baseView.bounds.size.width, baseView.bounds.size.height) andZoomTimes:1.2 andFrequency:2 andContinuousTime:0];
            self.zoomView.center = CGPointMake(baseView.bounds.size.width/2, baseView.bounds.size.height/2);
            self.zoomView.image = baseView.image;
            baseView.image = nil;
            [baseView addSubview:self.zoomView];
            [self.zoomView start];
        }
    }
}

- (void) stopAnimation{
    if (self.zoomView == nil){
        return;
    }
    
    UIImageView *baseView = (UIImageView *)self;
    baseView.image = self.zoomView.image;
    [self.zoomView removeFromSuperview];
    self.zoomView = nil;
}

- (BOOL) Animationing{
    if (self.zoomView == nil){
        return NO;
    }else{
        if (self.zoomView.IsStop){
            return NO;
        }
        else{
            return YES;
        }
    }
}


- (LBZoomImageView *) zoomView{
    return objc_getAssociatedObject(self, &zoomViewKey);
}
- (void) setZoomView:(id)zoomView{
    [self willChangeValueForKey:@"zoomView"];
    objc_setAssociatedObject(self, zoomViewKey, zoomView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"zoomView"];
}
@end
