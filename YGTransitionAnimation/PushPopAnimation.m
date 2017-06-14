//
//  PushPopAnimation.m
//  YGTransitionAnimation
//
//  Created by wyg_mac on 2017/6/12.
//  Copyright © 2017年 wyg_mac. All rights reserved.
//

#import "PushPopAnimation.h"

@interface PushPopAnimation()

@property (nonatomic, assign) AnimationStyle aniStyle;

@end

@implementation PushPopAnimation

-(instancetype)initWithStyle:(AnimationStyle)style; {
    _aniStyle = style;
    return self;
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3f;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    BOOL isPushing = (_aniStyle == AnimationPushStyle);
    if (isPushing) {
        [self animationPush:transitionContext];
    } else {
        [self animationPop:transitionContext];
    }
}

-(void)animationPush:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containView = [transitionContext containerView];
    [containView addSubview:toVC.view];
    
    CGRect visibleFrame = containView.frame;
    CGRect rightFrame = CGRectMake(visibleFrame.size.width, visibleFrame.origin.y, visibleFrame.size.width, visibleFrame.size.height);
    CGRect leftFrame = CGRectMake(-60, visibleFrame.origin.y, visibleFrame.size.width, visibleFrame.size.height);
    
    toVC.view.frame = rightFrame;
    fromVC.view.frame = visibleFrame;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        toVC.view.frame = visibleFrame;
        fromVC.view.frame = leftFrame;
        
    } completion:^(BOOL finished) {
        if ([transitionContext transitionWasCancelled]) {
            [toVC.view removeFromSuperview];
        }
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

-(void)animationPop:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containView = [transitionContext containerView];
    [containView addSubview:toVC.view];
    [containView bringSubviewToFront:fromVC.view];
    
    CGRect visibleFrame = containView.frame;
    CGRect rightFrame = CGRectMake(visibleFrame.size.width, visibleFrame.origin.y, visibleFrame.size.width, visibleFrame.size.height);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        toVC.view.frame = visibleFrame;
        fromVC.view.frame = rightFrame;
    } completion:^(BOOL finished) {
        if ([transitionContext transitionWasCancelled]) {
            [toVC.view removeFromSuperview];
        }
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}


@end
