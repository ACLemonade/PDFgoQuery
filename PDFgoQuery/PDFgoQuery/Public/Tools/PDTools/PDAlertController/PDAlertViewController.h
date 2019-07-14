//
//  PDAlertViewController.h
//  PDAlertControllerOC
//
//  Created by Lemonade on 2019/5/28.
//  Copyright © 2019 Lemonade. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+Present.h"
#import "PDAlertAction.h"


typedef NS_ENUM(NSUInteger, PDAlertStyle) {
    PDAlertStyleNone = 0,
    PDAlertStyleCenter = 1,
    PDAlertStyleBottom = 2,
    PDAlertStyleCustom = 3
};

NS_ASSUME_NONNULL_BEGIN
@interface PDAlertViewController : UIViewController
/// 普通的初始化方式,通过弹出类型,标题,内容进行初始化
- (instancetype)initWithAlertStyle:(PDAlertStyle)alerStyle
                             title:(NSString *)title
                           message:(NSString *)message;
/// 通过这种方式初始化,无标题和内容,一般用于自定义视图,用法:继承本c,然后添加自定义视图
- (instancetype)initWithAlertStyleCustom;
/// 添加点击事件按钮,跟系统类似
- (void)addAlertAction:(PDAlertAction *)alertAction;
/// 自定义视图可以直接添加到目标视图上去,或者赋值给此属性
@property (nonatomic, readwrite, strong) UIView *customView;

@end

NS_ASSUME_NONNULL_END

