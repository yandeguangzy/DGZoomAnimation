//
//  ViewController.h
//  UIviewZoom
//
//  Created by FSLB on 16/4/5.
//  Copyright © 2016年 FSLB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+LBZoomView.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *begin;
@property (weak, nonatomic) IBOutlet UIButton *stop;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

