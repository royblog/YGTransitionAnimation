//
//  FirstViewController.m
//  YGTransitionAnimation
//
//  Created by wyg_mac on 2017/6/10.
//  Copyright © 2017年 wyg_mac. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Main Page";
}


- (IBAction)pushController:(id)sender {
    SecondViewController *secondVC = [[SecondViewController alloc]init];
    self.navigationController.delegate = secondVC;
    [self.navigationController pushViewController:secondVC animated:YES];
}

- (IBAction)presentController:(id)sender {
    ThirdViewController *thirdVC = [[ThirdViewController alloc]init];
    thirdVC.transitioningDelegate = thirdVC;
    [self presentViewController:thirdVC animated:YES completion:nil];
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
