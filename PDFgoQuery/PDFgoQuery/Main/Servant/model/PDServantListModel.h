//
//  PDServantListModel.h
//  PDFgoQuery
//
//  Created by Lemonade on 2019/3/8.
//  Copyright © 2019 Lemonade. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+MJExtension.h"

NS_ASSUME_NONNULL_BEGIN

@interface PDServantListModel : NSObject

@property (nonatomic, readwrite, strong) NSString *ID;

@property (nonatomic, readwrite, strong) NSString *name;

@property (nonatomic, readwrite, strong) NSString *clazz;

@property (nonatomic, readwrite, strong) NSString *sex;

@property (nonatomic, readwrite, strong) NSString *imgPath;

@property (nonatomic, readwrite, strong) NSString *rarity;

@property (nonatomic, readwrite, strong) NSString *clothFlag;

@property (nonatomic, readwrite, strong) NSString *version;

@property (nonatomic, readwrite, strong) NSArray *addition;

@end

NS_ASSUME_NONNULL_END
