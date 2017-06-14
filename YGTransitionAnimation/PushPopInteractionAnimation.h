//
//  PushPopInteractionAnimation.h
//  YGTransitionAnimation
//
//  Created by wyg_mac on 2017/6/12.
//  Copyright © 2017年 wyg_mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PushPopInteractionAnimation : UIPercentDrivenInteractiveTransition

@property (nonatomic, assign) BOOL interacting;

- (instancetype)initWithGestrueForController:(UIViewController *)controller;

@end
