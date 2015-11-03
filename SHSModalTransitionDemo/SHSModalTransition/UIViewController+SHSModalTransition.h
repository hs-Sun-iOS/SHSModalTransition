//
//  UIViewController+SHSModalTransition.h
//  SHSModalTransitionDemo
//
//  Created by sunhaosheng on 15/11/2.
//  Copyright © 2015年 孙浩胜. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TransitionAnimationBlock)(UIView *view,id<UIViewControllerContextTransitioning> transitionContext);

@interface UIViewController(ModalTransition)<UIViewControllerTransitioningDelegate>

@property (nonatomic,copy) TransitionAnimationBlock modalAnimation;
@property (nonatomic,copy) TransitionAnimationBlock dismissAnimation;
@property (nonatomic,assign) NSTimeInterval duration;

- (void)setModalAnimation:(TransitionAnimationBlock)modalAnimation andDismissAnimation:(TransitionAnimationBlock)dismissAnimation;

@end
