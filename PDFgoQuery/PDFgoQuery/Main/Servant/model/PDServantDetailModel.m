//
//  PDServantDetailModel.m
//  PDFgoQuery
//
//  Created by Lemonade on 2019/3/11.
//  Copyright © 2019 Lemonade. All rights reserved.
//

#import "PDServantDetailModel.h"

@implementation PDServantDetailModel

+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{
             @"maxHP": @"maxHp",
             @"maxATK": @"maxAtk"
             };
}

@end
