//
//  UIControl+Event.m
//  HuzhouTourSupervise
//
//  Created by Lemonade on 2018/3/30.
//  Copyright © 2018年 Zhejiang Rongchuang Information Industry Co., Ltd. All rights reserved.
//

#import "UIControl+Event.h"
#import <objc/runtime.h>

static const void *controlClickBlockKey = &controlClickBlockKey;

@implementation UIControl (Event)

- (void)setControlClickBlock:(ControlClickBlock)controlClickBlock{
    objc_setAssociatedObject(self, controlClickBlockKey, controlClickBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (ControlClickBlock)controlClickBlock{
    return objc_getAssociatedObject(self, controlClickBlockKey);
}
- (void)addControlClickBlock:(ControlClickBlock)controlClickBlock forControlEvents:(UIControlEvents)controlEvents{
    NSParameterAssert(controlClickBlock);
    self.controlClickBlock = controlClickBlock;
    [self addTarget:self action:@selector(clickControl:) forControlEvents:controlEvents];
}
- (void)clickControl:(UIControl *)sender{
    self.controlClickBlock(sender);
}
@end
