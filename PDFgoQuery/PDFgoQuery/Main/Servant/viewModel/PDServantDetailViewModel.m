//
//  PDServantDetailViewModel.m
//  PDFgoQuery
//
//  Created by Lemonade on 2019/3/11.
//  Copyright © 2019 Lemonade. All rights reserved.
//

#import "PDServantDetailViewModel.h"

@interface PDServantDetailViewModel ()

@property (nonatomic, readwrite, strong) NSString *servantId;

@end

@implementation PDServantDetailViewModel

- (instancetype)init {
    NSAssert(NO, @"请使用initWithServantId:方法初始化");
    return nil;
}
- (instancetype)initWithServantId:(NSString *)servantId {
    if (self = [super init]) {
        self.servantId = servantId;
        [self setUp];
    }
    return self;
}
- (void)setUp {
    @weakify(self)
    self.detailCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        @strongify(self)
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            PDBaseRequest *request = [[PDBaseRequest alloc] initWithRequestUrl:@"servant/getServantInfo.do" paramDict:@{@"servantId": self.servantId} requestMethod:YTKRequestMethodGET];
            [request startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
                NSDictionary *successDict = request.responseObject;
                NSInteger code = [successDict[@"code"] integerValue];
                if (code == 10000) {
                    self.servantModel = [PDServantDetailModel parse:successDict[@"data"]];
                    
                    // 根据是否有灵衣和灵衣数组来配置立绘数组
                    if ([self.servantModel.clothFlag isEqualToString:@"N"]) {
                        self.portraitSuffixArr = @[@"A", @"B", @"C", @"D"];
                    } else {
                        if (self.servantModel.clothImg.count == 1) {
                            self.portraitSuffixArr = @[@"A", @"B", @"C", @"D", @"Z"];
                        } else {
                            self.portraitSuffixArr = @[@"A", @"B", @"C", @"D", @"Z", @"E"];
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
            return nil;
        }];
    }];
    
}


@end
