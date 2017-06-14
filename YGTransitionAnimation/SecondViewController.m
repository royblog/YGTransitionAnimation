//
//  SecondViewController.m
//  YGTransitionAnimation
//
//  Created by wyg_mac on 2017/6/10.
//  Copyright © 2017年 wyg_mac. All rights reserved.
//

#import "SecondViewController.h"
#import "PushPopAnimation.h"
#import "PushPopInteractionAnimation.h"
@interface SecondViewController () 

@property (nonatomic, strong) PushPopInteractionAnimation *interAni;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Page PushPop";
    _interAni = [[PushPopInteractionAnimation alloc]initWithGestrueForController:self];
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    return [[PushPopAnimation alloc]initWithStyle:operation == UINavigationControllerOperationPush ? AnimationPushStyle : AnimationPopStyle];
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    return _interAni.interacting ? _interAni : nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
