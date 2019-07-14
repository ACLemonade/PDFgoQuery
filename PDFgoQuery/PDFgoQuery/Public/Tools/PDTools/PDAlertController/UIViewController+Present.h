//
//  UIViewController+Present.h
//  PDAlertControllerOC
//
//  Created by Lemonade on 2018/8/14.
//  Copyright © 2018年 Lemonade. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Present) <UIViewControllerTransitioningDelegate>
/// 弹出提示控制器
- (void)presentAlertViewController:(UIViewController *)alertViewController;

@end
