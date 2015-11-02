//
//  SHSAnimatedTransitioningController.h
//  SHSModalTransitionDemo
//
//  Created by sunhaosheng on 15/11/2.
//  Copyright © 2015年 孙浩胜. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TransitionAnimationBlock)(UIView *view,id<UIViewControllerContextTransitioning> transitionContext);

@interface SHSAnimatedTransitioningController : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic,assign) BOOL presented;
@property (nonatomic,assign) NSTimeInterval duration;
@property (nonatomic,copy) TransitionAnimationBlock modalAnimation;
@property (nonatomic,copy) TransitionAnimationBlock dismissAnimation;


@end
