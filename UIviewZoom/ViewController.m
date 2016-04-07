//
//  ViewController.m
//  UIviewZoom
//
//  Created by FSLB on 16/4/5.
//  Copyright © 2016年 FSLB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}
- (IBAction)start:(id)sender {
    [_imageView startAnimation];
}
- (IBAction)stop:(id)sender {
    [_imageView stopAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
