//
//  PDAlertAction.h
//  PDAlertControllerOC
//
//  Created by Lemonade on 2019/6/12.
//  Copyright © 2019 Lemer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PDAlertAction : NSObject <NSCopying>

@property (nonatomic, readwrite, strong) NSString *actionTitle;
@property (nonatomic, readwrite, copy, nullable) void(^handlerBlock)(void);

+ (instancetype)actionWithTitle:(NSString *)title titleColor:(UIColor *)titleColor handler:(void(^ __nullable)(void))handler;


@end

NS_ASSUME_NONNULL_END
