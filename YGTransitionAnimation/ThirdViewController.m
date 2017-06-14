//
//  ThirdViewController.m
//  YGTransitionAnimation
//
//  Created by 王耀国 on 2017/6/13.
//  Copyright © 2017年 wyg_mac. All rights reserved.
//

#import "ThirdViewController.h"
#import "PresentDismissAnimation.h"
#import "PresentDismissInteractionAnimation.h"
@interface ThirdViewController ()

@property (nonatomic, strong) PresentDismissInteractionAnimation *interAni;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Page PresentDismis";
    _interAni = [[PresentDismissInteractionAnimation alloc]initWithGestrueForController:self];
}


- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [[PresentDismissAnimation alloc]initWithStyle:AnimationPresentStyle];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[PresentDismissAnimation alloc]initWithStyle:AnimationDismissStyle];
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
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
