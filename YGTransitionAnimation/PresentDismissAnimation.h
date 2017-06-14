//
//  PresentDismissAnimation.h
//  YGTransitionAnimation
//
//  Created by wyg_mac on 2017/6/12.
//  Copyright © 2017年 wyg_mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, AnimationStyle) {
    AnimationPresentStyle,
    AnimationDismissStyle
};

@interface PresentDismissAnimation : NSObject <UIViewControllerAnimatedTransitioning>

-(instancetype)initWithStyle:(AnimationStyle)style;

@end
