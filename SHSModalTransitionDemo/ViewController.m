//
//  ViewController.m
//  SHSModalTransitionDemo
//
//  Created by sunhaosheng on 15/11/2.
//  Copyright © 2015年 孙浩胜. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+SHSModalTransition.h"
#import "PresentedViewController.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    PresentedViewController *vc = [[PresentedViewController alloc] init];
    vc.view.backgroundColor = [UIColor cyanColor];
    [vc setModalAnimation:^(UIView *view, id<UIViewControllerContextTransitioning> transitionContext) {
        view.layer.transform = CATransform3DMakeRotation(M_PI_2, 0, 1, 0);
        [UIView animateWithDuration:2.0f animations:^{
            view.layer.transform = CATransform3DIdentity;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    } andDismissAnimation:^(UIView *view, id<UIViewControllerContextTransitioning> transitionContext) {
        [UIView animateWithDuration:2.0f animations:^{
            
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }];
    vc.duration = 2.0f;
    [self presentViewController:vc animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
