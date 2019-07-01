//
//  PDServantDetailModel.h
//  PDFgoQuery
//
//  Created by Lemonade on 2019/3/11.
//  Copyright © 2019 Lemonade. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+MJExtension.h"

NS_ASSUME_NONNULL_BEGIN

@interface PDServantDetailModel : NSObject
/// ID
@property (nonatomic, readwrite, strong) NSString *servantId;
/// 别称
@property (nonatomic, readwrite, strong) NSString *sex;
/// 头像路径
@property (nonatomic, readwrite, strong) NSString *imgPath;
/// 最大HP
@property (nonatomic, readwrite, strong) NSString *maxHP;
/// 最大ATK
@property (nonatomic, readwrite, strong) NSString *maxATK;

/// 是否有灵衣
@property (nonatomic, readwrite, strong) NSString *clothFlag;
/// 灵衣数组
@property (nonatomic, readwrite, strong) NSArray *clothImg;

@end

NS_ASSUME_NONNULL_END
