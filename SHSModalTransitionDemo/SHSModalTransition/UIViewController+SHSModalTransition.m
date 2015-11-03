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
@dynamic modalAnimation;
@dynamic dismissAnimation;
@dynamic duration;

- (void)setModalAnimation:(TransitionAnimationBlock)modalAnimation andDismissAnimation:(TransitionAnimationBlock)dismissAnimation {
    self.modalAnimation = modalAnimation;
    self.dismissAnimation = dismissAnimation;
    self.modalPresentationStyle = UIModalPresentationCustom;
    self.transitioningDelegate = self;
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    SHSPresentationController *presentation = [[SHSPresentationController alloc] initWithPresentedViewController:presented presentingViewController:source];
    return presentation;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    SHSAnimatedTransitioningController *animatedTransitioning = [[SHSAnimatedTransitioningController alloc] init];
    animatedTransitioning.presented = YES;
    animatedTransitioning.modalAnimation = self.modalAnimation;
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

- (void)setModalAnimation:(TransitionAnimationBlock)modalAnimation {
    objc_setAssociatedObject(self, @selector(modalAnimation), modalAnimation, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (TransitionAnimationBlock)modalAnimation {
    return objc_getAssociatedObject(self, @selector(modalAnimation));
}

- (void)setDismissAnimation:(TransitionAnimationBlock)dismissAnimation {
    objc_setAssociatedObject(self, @selector(dismissAnimation), dismissAnimation, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (TransitionAnimationBlock)dismissAnimation {
    return objc_getAssociatedObject(self, @selector(dismissAnimation));
}

- (void)setDuration:(NSTimeInterval)duration {
    objc_setAssociatedObject(self, @selector(duration), @(duration), OBJC_ASSOCIATION_ASSIGN);
}

- (NSTimeInterval)duration {
    NSNumber *duration = objc_getAssociatedObject(self, @selector(duration));
    return duration.doubleValue;
}

@end
