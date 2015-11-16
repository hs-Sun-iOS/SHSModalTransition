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

@interface ViewController ()<UIViewControllerTransitioningDelegate> {
    id<UIViewControllerContextTransitioning> _transitionContext;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    PresentedViewController *vc = [[PresentedViewController alloc] init];
    vc.view.backgroundColor = [UIColor cyanColor];
    
    // 设置modal动画和dismiss动画
    [vc setAnimationDuration:0.5 andPresentAnimation:^(UIView *presentedView, id<UIViewControllerContextTransitioning> transitionContext) {
         //presentedView为被modal出的控制器的view
        presentedView.layer.mask = ({
            CAShapeLayer *mask = [CAShapeLayer layer];
            mask.frame = CGRectMake(0, 0, presentedView.frame.size.height*2, presentedView.frame.size.height*2);
            mask.fillColor = [UIColor blackColor].CGColor;
            mask.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(mask.bounds.size.width/2, mask.bounds.size.height/2) radius:mask.bounds.size.width/2 startAngle:0 endAngle:2*M_PI clockwise:YES].CGPath;
            mask.position = CGPointMake(CGRectGetMaxX(presentedView.frame),CGRectGetMaxY(presentedView.frame));
            mask.anchorPoint = CGPointMake(0, 0);
            mask;
        });
        
        CABasicAnimation *an = [CABasicAnimation animationWithKeyPath:@"position"];
        an.fromValue = [NSValue valueWithCGPoint:CGPointMake(CGRectGetMaxX(presentedView.frame),CGRectGetMaxY(presentedView.frame))];
        an.toValue = [NSValue valueWithCGPoint:CGPointMake(-presentedView.frame.size.width, -presentedView.frame.size.width)];
        an.fillMode = kCAFillModeForwards;
        an.removedOnCompletion = NO;
        an.duration = 0.5;
        an.delegate = self;
        _transitionContext = transitionContext;
        [presentedView.layer.mask addAnimation:an forKey:nil];
        
    } withDismissAnimation:^(UIView *presentedView, id<UIViewControllerContextTransitioning> transitionContext) {
        CABasicAnimation *an = [CABasicAnimation animationWithKeyPath:@"position"];
        an.toValue= [NSValue valueWithCGPoint:CGPointMake(CGRectGetMaxX(presentedView.frame),CGRectGetMaxY(presentedView.frame))];
        an.fromValue = [NSValue valueWithCGPoint:CGPointMake(-presentedView.frame.size.width, -presentedView.frame.size.width)];
        an.fillMode = kCAFillModeForwards;
        an.removedOnCompletion = NO;
        an.duration = 0.5;
        an.delegate = self;
        _transitionContext = transitionContext;
        [presentedView.layer.mask addAnimation:an forKey:nil];
    }];
    
    
    [self presentViewController:vc animated:YES completion:nil];
}
#warning 动画结束后必须调用 completeTransition：方法  否则页面不能实现交互
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
   //动画结束后必须调用 completeTransition：方法  否则页面不能实现交互
    [_transitionContext completeTransition:YES];
}

@end
