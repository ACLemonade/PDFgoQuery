//
//  PDAlertAction.m
//  PDAlertControllerOC
//
//  Created by Lemonade on 2019/6/12.
//  Copyright © 2019 Lemer. All rights reserved.
//

#import "PDAlertAction.h"

@implementation PDAlertAction
#pragma mark - Initial Methods
static PDAlertAction *_instanceAction;
+ (instancetype)actionWithTitle:(NSString *)title titleColor:(UIColor *)titleColor handler:(void (^ _Nullable)(void))handler {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
        _instanceAction = [[PDAlertAction alloc] init];
        _instanceAction.actionTitle = title;
        _instanceAction.handlerBlock = handler;
//    });
    return _instanceAction;
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
        _instanceAction = [super allocWithZone:zone];
        _instanceAction.actionTitle = @"";
        _instanceAction.handlerBlock = nil;
//    });
    return _instanceAction;
}
- (id)copyWithZone:(NSZone *)zone {
    return _instanceAction;
}
@end
