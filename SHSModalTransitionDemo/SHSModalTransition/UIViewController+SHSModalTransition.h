//
//  UIViewController+SHSModalTransition.h
//  SHSModalTransitionDemo
//
//  Created by sunhaosheng on 15/11/2.
//  Copyright © 2015年 孙浩胜. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TransitionAnimationBlock)(UIView *presentedView,id<UIViewControllerContextTransitioning> transitionContext);

@interface UIViewController(ModalTransition)<UIViewControllerTransitioningDelegate>

/* 开启自定义modal动画并设置动画时间、present动画、dismiss动画
   设置的动画时间需和具体的动画时间相同
 */
- (void)setAnimationDuration:(NSTimeInterval)duration andPresentAnimation:(TransitionAnimationBlock)presentAnimation withDismissAnimation:(TransitionAnimationBlock)dismissAnimation;

@end
