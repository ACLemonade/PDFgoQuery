//
//  PDServantDetailViewModel.h
//  PDFgoQuery
//
//  Created by Lemonade on 2019/3/11.
//  Copyright © 2019 Lemonade. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PDServantDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PDServantDetailViewModel : NSObject

@property (nonatomic, readwrite, strong) RACCommand *detailCommand;

@property (nonatomic, readwrite, strong) PDServantDetailModel *servantModel;

@property (nonatomic, readwrite, strong) NSArray<NSString *> *portraitSuffixArr;

- (instancetype)initWithServantId:(NSString *)servantId;

@end

NS_ASSUME_NONNULL_END
