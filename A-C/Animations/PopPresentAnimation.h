//
//  PopAnimation.h
//  WZXPopAnimation
//
//  Created by WzxJiang on 16/12/6.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopPresentAnimation : NSObject <UIViewControllerAnimatedTransitioning>

@end

/* 使用方式
 
 #import "FirstViewController.h"
 #import "SecondViewController.h"
 #import "PopPresentAnimation.h"
 #import "PopDismissAnimation.h"
 
 @interface FirstViewController () <UIViewControllerTransitioningDelegate>
 
 @end
 
 @implementation FirstViewController
 
 - (void)viewDidLoad {
 [super viewDidLoad];
 }
 
 - (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
 SecondViewController * secondViewController = [SecondViewController new];
 secondViewController.modalPresentationStyle = UIModalPresentationCustom;
 secondViewController.transitioningDelegate = self;
 
 [self presentViewController:secondViewController animated:YES completion:nil];
 }
 
 - (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
 return [PopPresentAnimation new];
 }
 
 - (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
 return [PopDismissAnimation new];
 }
 
 
 
 
 第二个控制器
 @interface SecondViewController ()
 
 @end
 
 @implementation SecondViewController
 
 - (void)viewDidLoad {
 [super viewDidLoad];
 self.view.layer.shadowColor = [UIColor blackColor].CGColor;
 self.view.layer.shadowOffset = CGSizeMake(0.5, 0.5);
 self.view.layer.shadowOpacity = 0.8;
 self.view.layer.shadowRadius = 5;
 self.view.backgroundColor = [UIColor whiteColor];
 
 
 UIButton * closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
 closeBtn.frame = CGRectMake(15, 0, 50, 40);
 [closeBtn setTitle:@"关闭" forState:UIControlStateNormal];
 [closeBtn setTitleColor:[UIColor colorWithRed:217/255.0 green:110/255.0 blue:90/255.0 alpha:1] forState:UIControlStateNormal];
 [closeBtn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
 [self.view addSubview:closeBtn];
 }
 
 - (void)close {
 [self dismissViewControllerAnimated:YES completion:nil];
 }
 
 
 
 */
