//
//  SHSAnimatedTransitioningController.m
//  SHSModalTransitionDemo
//
//  Created by sunhaosheng on 15/11/2.
//  Copyright © 2015年 孙浩胜. All rights reserved.
//

#import "SHSAnimatedTransitioningController.h"

@implementation SHSAnimatedTransitioningController

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return self.duration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    if (self.presented && self.modalAnimation) {
        self.modalAnimation([transitionContext viewForKey:UITransitionContextToViewKey],transitionContext);
    } else if (!self.presented && self.dismissAnimation) {
        self.dismissAnimation([transitionContext viewForKey:UITransitionContextFromViewKey],transitionContext);
    }
}


@end
