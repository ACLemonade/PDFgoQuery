//
//  PDServantDetailViewController.m
//  PDFgoQuery
//
//  Created by Lemonade on 2019/3/8.
//  Copyright © 2019 Lemonade. All rights reserved.
//

#import "PDServantDetailViewController.h"
#import "PDServantDetailViewModel.h"


@interface PDServantDetailViewController ()
/// 头像
@property (weak, nonatomic) IBOutlet UIImageView *avatarIV;
/// 最大atk
@property (weak, nonatomic) IBOutlet UILabel *atkLb;
/// 最大hp
@property (weak, nonatomic) IBOutlet UILabel *hpLb;

@property (nonatomic, readwrite, strong) PDServantDetailViewModel *viewModel;

@end

@implementation PDServantDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bindSignal];
    
}
- (void)bindSignal {
    @weakify(self)
    [self.viewModel.detailCommand.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        NSString *imgStr = [self.viewModel.servantModel.imgPath containsString:CONST_BASE_URL] ? self.viewModel.servantModel.imgPath : [CONST_BASE_URL stringByAppendingString:self.viewModel.servantModel.imgPath];
        NSURL *imgUrl = [NSURL URLWithString:imgStr];
        [self.avatarIV sd_setImageWithURL:imgUrl];
        self.avatarIV.userInteractionEnabled = YES;
        [self.avatarIV addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showPortraitAction:)]];
        
        self.atkLb.text = self.viewModel.servantModel.maxATK;
        self.hpLb.text = self.viewModel.servantModel.maxHP;
    }];
    [self.viewModel.detailCommand execute:nil];
}
#pragma mark - Event Response
- (void)showPortraitAction:sender {
    PDLog(@"显示立绘");
    NSMutableArray *portraitsArr = [NSMutableArray array];
    for (NSString *suffix in self.viewModel.portraitSuffixArr) {
        YBImageBrowseCellData *data = [[YBImageBrowseCellData alloc] init];
        data.url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@%@.jpg", CONST_BASE_URL, PATH_SERVANT_PORTRAIT, [self.servantId substringFromIndex:1], suffix]];
        [portraitsArr addObject:data];
    }
    YBImageBrowser *browser = [[YBImageBrowser alloc] init];
    browser.dataSourceArray = [portraitsArr copy];
    [browser show];
}
#pragma mark - Lazy Load
- (PDServantDetailViewModel *)viewModel {
    if (_viewModel == nil) {
        _viewModel = [[PDServantDetailViewModel alloc] initWithServantId:self.servantId];
    }
    return _viewModel;
}

@end
