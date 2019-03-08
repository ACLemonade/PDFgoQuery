//
//  PDBaseRequest.h
//  JustReader2.0
//
//  Created by Lemonade on 2019/3/1.
//  Copyright © 2019 Lemonade. All rights reserved.
//

#import "YTKBaseRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface PDBaseRequest : YTKBaseRequest

- (instancetype)initWithRequestUrl:(nullable NSString *)requestUrl
                         paramDict:(nullable NSDictionary *)paramDict
                     requestMethod:(YTKRequestMethod)requestMethod;

- (instancetype)initWithBaseUrl:(nullable NSString *)baseUrl
                     requestUrl:(nullable NSString *)requestUrl
                      paramDict:(nullable NSDictionary *)paramDict
                  requestMethod:(YTKRequestMethod)requestMethod;

@end

NS_ASSUME_NONNULL_END
