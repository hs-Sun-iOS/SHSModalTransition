//
//  UIViewController+SHSModalTransition.m
//  SHSModalTransitionDemo
//
//  Created by sunhaosheng on 15/11/2.
//  Copyright © 2015年 孙浩胜. All rights reserved.
//

#import "UIViewController+SHSModalTransition.h"
#import "SHSPresentationController.h"
#import "SHSAnimatedTransitioningController.h"
#import <objc/runtime.h>

@implementation UIViewController(ModalTransition)

- (void)setAnimationDuration:(NSTimeInterval)duration andPresentAnimation:(TransitionAnimationBlock)presentAnimation withDismissAnimation:(TransitionAnimationBlock)dismissAnimation {
    self.presentAnimation = presentAnimation;
    self.dismissAnimation = dismissAnimation;
    self.duration = duration;
    self.modalPresentationStyle = UIModalPresentationCustom;
    self.transitioningDelegate = self;
}

#pragma mark - UIViewControllerTransitioningDelegate
- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    SHSPresentationController *presentation = [[SHSPresentationController alloc] initWithPresentedViewController:presented presentingViewController:source];
    return presentation;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    SHSAnimatedTransitioningController *animatedTransitioning = [[SHSAnimatedTransitioningController alloc] init];
    animatedTransitioning.presented = YES;
    animatedTransitioning.presentAnimation = self.presentAnimation;
    animatedTransitioning.duration = self.duration;
    return animatedTransitioning;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    SHSAnimatedTransitioningController *animatedTransitioning = [[SHSAnimatedTransitioningController alloc] init];
    animatedTransitioning.presented = NO;
    animatedTransitioning.dismissAnimation = self.dismissAnimation;
    animatedTransitioning.duration = self.duration;
    return animatedTransitioning;
}

#pragma mark - runtime关联属性
- (void)setPresentAnimation:(TransitionAnimationBlock)presentAnimation {
    objc_setAssociatedObject(self, @selector(presentAnimation), presentAnimation, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (TransitionAnimationBlock)presentAnimation {
    return objc_getAssociatedObject(self, @selector(presentAnimation));
}

- (void)setDismissAnimation:(TransitionAnimationBlock)dismissAnimation {
    objc_setAssociatedObject(self, @selector(dismissAnimation), dismissAnimation, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (TransitionAnimationBlock)dismissAnimation {
    return objc_getAssociatedObject(self, @selector(dismissAnimation));
}

- (void)setDuration:(NSTimeInterval)duration {
    objc_setAssociatedObject(self, @selector(duration), [NSNumber numberWithDouble:duration], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)duration {
    NSNumber *duration = objc_getAssociatedObject(self, @selector(duration));
    return duration.doubleValue;
}

@end
