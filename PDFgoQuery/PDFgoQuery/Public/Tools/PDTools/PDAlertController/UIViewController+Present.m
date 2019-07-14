//
//  UIViewController+Present.m
//  PDAlertControllerOC
//
//  Created by Lemonade on 2018/8/14.
//  Copyright © 2018年 Lemonade. All rights reserved.
//

#import "UIViewController+Present.h"
#import "AlertPresentationController.h"

@implementation UIViewController (Present)

- (void)presentAlertViewController:(UIViewController *)alertViewController {
    alertViewController.modalPresentationStyle = UIModalPresentationCustom;
//    alertViewController.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    alertViewController.transitioningDelegate = self;
    [self presentViewController:alertViewController animated:YES completion:nil];
}
// 重写控制器跳转过程中的协议方法
- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    AlertPresentationController *present = [[AlertPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    return present;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
