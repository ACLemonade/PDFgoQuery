//
//  PDAlertCenterView.h
//  PDAlertControllerOC
//
//  Created by Lemonade on 2019/5/30.
//  Copyright © 2019 Lemonade. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PDAlertAction.h"

NS_ASSUME_NONNULL_BEGIN

@interface PDAlertCenterView : UIView
//
/// 初始化方式,初始化标题(可不填),内容信息(必填)
- (instancetype)initWithTitle:(nullable NSString *)title
                      message:(NSString *)message
                   actionList:(nullable NSArray<PDAlertAction *> *)actionList;

@end

NS_ASSUME_NONNULL_END
