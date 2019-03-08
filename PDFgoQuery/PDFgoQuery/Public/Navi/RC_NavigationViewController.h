//
//  RC_NavigationViewController.h
//  FireCicada
//
//  Created by weedx on 2018/8/15.
//  Copyright © 2018年 Zhejiang Rongchuang Information Industry Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RC_NavigationViewController : UINavigationController

/**
 滑动返回的手势(如需禁用手势在viewDidAppear中设置panGesture.enabled=NO即可)
 */
@property (nonnull, nonatomic ,strong) UIScreenEdgePanGestureRecognizer *panGesture;

@end

@interface UIViewController (RC_NavigationViewController)

/**
 获取viewController的navigationController
 */
@property (nullable, nonatomic, readonly, strong) RC_NavigationViewController *rc_navigationController;

//消除警告
#pragma clang diagnostic ignored "-Wincomplete-implementation"
/**
 禁用返回(多用于有提示的返回),交给对应controller实现
 */
- (void)backForbidden;

@end
