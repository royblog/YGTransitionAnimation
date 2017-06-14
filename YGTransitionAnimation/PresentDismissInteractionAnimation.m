//
//  PresentDismissInteractionAnimation.m
//  YGTransitionAnimation
//
//  Created by wyg_mac on 2017/6/12.
//  Copyright © 2017年 wyg_mac. All rights reserved.
//

#import "PresentDismissInteractionAnimation.h"

@interface PresentDismissInteractionAnimation()

@property (nonatomic, strong) UIViewController *dismissVC;
@property (nonatomic, assign) BOOL isComplete;

@end

@implementation PresentDismissInteractionAnimation

- (instancetype)initWithGestrueForController:(UIViewController *)controller {
    self = [super init];
    if (self) {
        _dismissVC = controller;
        UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handleGesture:)];
        [_dismissVC.view addGestureRecognizer:gesture];
    }
    return self;
}

- (void)handleGesture:(UIPanGestureRecognizer *)gesture {
    CGPoint translation = [gesture translationInView:gesture.view.superview];
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
            self.interacting = YES;
            [_dismissVC dismissViewControllerAnimated:YES completion:nil];
            break;
        case UIGestureRecognizerStateChanged: {
            CGFloat dis = translation.y / 400.0;
            dis = fminf(fmaxf(dis, 0.0), 1.0);
            _isComplete = dis >= 0.5;
            [self updateInteractiveTransition:dis];
            break;
        }
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded:
            self.interacting = NO;
            if (!self.isComplete || gesture.state == UIGestureRecognizerStateCancelled) {
                [self cancelInteractiveTransition];
            } else {
                [self finishInteractiveTransition];
            }
            break;
        default:
            break;
    }
}

@end
