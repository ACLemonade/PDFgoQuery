//
//  PDHomepageViewModel.m
//  PDFgoQuery
//
//  Created by Lemonade on 2019/3/7.
//  Copyright © 2019 Lemonade. All rights reserved.
//

#import "PDHomepageViewModel.h"

@implementation PDHomepageViewModel

- (instancetype)init {
    if (self = [super init]) {
        [self setUp];
    }
    return self;
}
- (void)setUp {
    @weakify(self)
    self.servantListCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        @strongify(self)
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            // 由于从者列表的数据众多并且不轻易改变,因此每次都进行网络请求重复且没必要,因此在本地制作缓存,当请求一遍数据之后,之后都使用缓存
            NSString *servantPlistPath = [kPathDocument stringByAppendingPathComponent:@"ServantList.plist"];
            NSLog(@"%@", servantPlistPath);
            __block NSMutableArray *servantDataList = [[NSMutableArray alloc] initWithContentsOfFile:servantPlistPath];
            if (servantDataList == nil) {
                // 网络请求,存数据
                PDBaseRequest *request = [[PDBaseRequest alloc] initWithRequestUrl:@"servant/getServantList.do" paramDict:@{@"count": @0} requestMethod:YTKRequestMethodGET];
                [request startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
                    NSDictionary *successDict = request.responseObject;
                    NSInteger code = [successDict[@"code"] integerValue];
                    if (code == 10000) {
                        if (IsArray(successDict[@"data"])) {
                            servantDataList = successDict[@"data"];
                            // 将数据写入缓存
                            [servantDataList writeToFile:servantPlistPath atomically:YES];
                            for (NSDictionary *item in successDict[@"data"]) {
                                PDServantListModel *model = [PDServantListModel parse:item];
                                [self.servantList addObject:model];
                            }
                        }
                        [subscriber sendNext:nil];
                        [subscriber sendCompleted];
                    } else {
                        [subscriber sendError:[NSError errorWithDomain:APPBundleID code:-1000 userInfo:@{NSLocalizedDescriptionKey: successDict[@"msg"]}]];
                    }
                    
                } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
                    [subscriber sendError:request.error];
                }];
            } else {
                // 使用缓存
                for (NSDictionary *item in servantDataList) {
                    PDServantListModel *model = [PDServantListModel parse:item];
                    [self.servantList addObject:model];
                }
                [subscriber sendNext:nil];
                [subscriber sendCompleted];
            }
            return nil;
        }];
    }];
}
- (NSMutableArray<PDServantListModel *> *)servantList {
    if (_servantList == nil) {
        _servantList = [NSMutableArray array];
    }
    return _servantList;
}

@end
