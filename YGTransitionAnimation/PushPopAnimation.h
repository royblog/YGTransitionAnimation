//
//  PushPopAnimation.h
//  YGTransitionAnimation
//
//  Created by wyg_mac on 2017/6/12.
//  Copyright © 2017年 wyg_mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, AnimationStyle) {
    AnimationPushStyle,
    AnimationPopStyle
};

@interface PushPopAnimation : NSObject <UIViewControllerAnimatedTransitioning>

-(instancetype)initWithStyle:(AnimationStyle)style;

@end
