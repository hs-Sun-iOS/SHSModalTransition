//
//  PresentedViewController.m
//  SHSModalTransitionDemo
//
//  Created by sunhaosheng on 15/11/2.
//  Copyright © 2015年 孙浩胜. All rights reserved.
//

#import "PresentedViewController.h"

@interface PresentedViewController ()

@end

@implementation PresentedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    UISwitch *sw = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    sw.center = self.view.center;
    [self.view addSubview:sw];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
