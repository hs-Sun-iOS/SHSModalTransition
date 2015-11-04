//
//  SHSPresentationController.m
//  SHSModalTransitionDemo
//
//  Created by sunhaosheng on 15/11/2.
//  Copyright © 2015年 孙浩胜. All rights reserved.
//

#import "SHSPresentationController.h"

@implementation SHSPresentationController

//- (CGRect)frameOfPresentedViewInContainerView {
//    return CGRectZero;
//}

- (void)presentationTransitionWillBegin {

    [self.containerView addSubview:self.presentedView];
}

- (void)presentationTransitionDidEnd:(BOOL)completed {
}

- (void)dismissalTransitionWillBegin {
}

- (void)dismissalTransitionDidEnd:(BOOL)completed {
    [self.presentedView removeFromSuperview];
}

@end
