//
//  AlertPresentationController.m
//  PDAlertControllerOC
//
//  Created by Lemonade on 2018/8/14.
//  Copyright © 2018年 Lemonade. All rights reserved.
//

#import "AlertPresentationController.h"

@interface AlertPresentationController ()
/** 蒙版 */
@property (nonatomic, readwrite, strong) UIView *backView;

@end

@implementation AlertPresentationController

- (CGRect)frameOfPresentedViewInContainerView {
    // 为了方便全屏幕点击响应(退出),默认设置为跟屏幕大小一致
    return [UIScreen mainScreen].bounds;
    
}
- (void)presentationTransitionWillBegin {
    self.backView.alpha = 0;
    [self.containerView addSubview:self.backView];
    [UIView animateWithDuration:0.5 animations:^{
        self.backView.alpha = 1.0;
    }];
}
- (void)dismissalTransitionWillBegin {
    [UIView animateWithDuration:0.5 animations:^{
        self.backView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.backView removeFromSuperview];
    }];
}
- (UIView *)backView {
    if (_backView == nil) {
        _backView = [[UIView alloc] initWithFrame:self.containerView.frame];
        _backView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    }
    return _backView;
}

@end
