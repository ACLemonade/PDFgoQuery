//
//  PDHomepageViewModel.h
//  PDFgoQuery
//
//  Created by Lemonade on 2019/3/7.
//  Copyright © 2019 Lemonade. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PDServantListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PDHomepageViewModel : NSObject

@property (nonatomic, readwrite, strong) RACCommand *servantListCommand;

@property (nonatomic, readwrite, strong) NSMutableArray<PDServantListModel *> *servantList;

@end

NS_ASSUME_NONNULL_END
