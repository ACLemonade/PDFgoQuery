//
//  PDBaseRequest.m
//  JustReader2.0
//
//  Created by Lemonade on 2019/3/1.
//  Copyright © 2019 Lemonade. All rights reserved.
//

#import "PDBaseRequest.h"

@interface PDBaseRequest ()

@property (nonatomic, readwrite, strong) NSString *pd_baseUrl;

@property (nonatomic, readwrite, strong) NSString *pd_requestUrl;

@property (nonatomic, readwrite, strong) NSDictionary *pd_paramDict;

@property (nonatomic, readwrite, assign) YTKRequestMethod pd_requestMethod;

@end

@implementation PDBaseRequest
- (instancetype)initWithRequestUrl:(NSString *)requestUrl paramDict:(NSDictionary *)paramDict requestMethod:(YTKRequestMethod)requestMethod {
    return [self initWithBaseUrl:nil requestUrl:requestUrl paramDict:paramDict requestMethod:requestMethod];
}

- (instancetype)initWithBaseUrl:(NSString *)baseUrl requestUrl:(NSString *)requestUrl paramDict:(NSDictionary *)paramDict requestMethod:(YTKRequestMethod)requestMethod {
    if (self = [super init]) {
        _pd_baseUrl = baseUrl ?: CONST_BASE_URL;
        _pd_requestUrl = requestUrl;
        _pd_paramDict = paramDict;
        _pd_requestMethod = requestMethod;
    }
    return self;
}
#pragma mark - Overridden Methods
- (NSString *)baseUrl {
    return self.pd_baseUrl;
}
- (NSString *)requestUrl {
    return self.pd_requestUrl;
}
- (YTKRequestMethod)requestMethod {
    return self.pd_requestMethod;
}
- (id)requestArgument {
    return self.pd_paramDict;
}
- (NSTimeInterval)requestTimeoutInterval {
    return 10;
}
//- (YTKRequestSerializerType)requestSerializerType {
//    return YTKRequestSerializerTypeHTTP;
//}
//- (YTKResponseSerializerType)responseSerializerType {
//    return YTKResponseSerializerTypeHTTP;
//}
@end
