//
//  PDServantDetailMenuPageController.m
//  PDFgoQuery
//
//  Created by Lemonade on 2019/7/5.
//  Copyright © 2019 Lemonade. All rights reserved.
//

#import "PDServantDetailMenuPageController.h"
#import "PDServantDetailViewModel.h"

static NSInteger const constAvatarTag = 1001;
static NSInteger const constATKTag = 1002;
static NSInteger const constHPTag = 1003;

#define kTitleArr   @[@"技能", @"宝具", @"礼装", @"特攻", @"语音", @"幕间"]

@interface PDServantDetailMenuPageController ()

@property (nonatomic, readwrite, strong) UIView *basicInfoView;

@property (nonatomic, readwrite, strong) PDServantDetailViewModel *viewModel;

@end

@implementation PDServantDetailMenuPageController
#pragma mark - Life Circle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    [self bindSignal];
    [self bindAction];
}
#pragma mark - Private Methods
- (void)bindSignal {
    @weakify(self)
    [self.viewModel.detailCommand.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        NSString *imgStr = [self.viewModel.servantModel.imgPath containsString:CONST_BASE_URL] ? self.viewModel.servantModel.imgPath : [CONST_BASE_URL stringByAppendingString:SURE_STR_NOT_NIL(self.viewModel.servantModel.imgPath)];
        NSURL *imgUrl = [NSURL URLWithString:imgStr];
        
        UIImageView *avatarIV = [self.basicInfoView viewWithTag:constAvatarTag];
        [avatarIV sd_setImageWithURL:imgUrl];
        [avatarIV addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showPortraitAction:)]];
        
        UILabel *atkLb = [self.basicInfoView viewWithTag:constATKTag];
        atkLb.text = [NSString stringWithFormat:@"ATK:  %@", self.viewModel.servantModel.maxATK];
        UILabel *hpLb = [self.basicInfoView viewWithTag:constHPTag];
        hpLb.text = [NSString stringWithFormat: @"HP:  %@", self.viewModel.servantModel.maxHP];
    }];
    [self.viewModel.detailCommand execute:nil];
}
- (void)bindAction {
    UIImageView *avatarIV = [self.basicInfoView viewWithTag:constAvatarTag];
    [avatarIV addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showPortraitAction:)]];
}
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return kTitleArr.count;
}
- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    return [UIViewController new];
}
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return kTitleArr[index];
}
- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    return CGRectMake(0, 130, SCREEN_WIDTH, 50);
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
- (UIView *)basicInfoView {
    if (_basicInfoView == nil) {
        _basicInfoView = [[UIView alloc] init];
        _basicInfoView.backgroundColor = UIColor.whiteColor;
        
        [self.view addSubview:_basicInfoView];
        [_basicInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(0);
            make.height.equalTo(130);
        }];
        
        // 头像
        UIImageView *avatarIV = [[UIImageView alloc] init];
        avatarIV.userInteractionEnabled = YES;
        avatarIV.tag = constAvatarTag;
        [_basicInfoView addSubview:avatarIV];
        [avatarIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(15);
            make.centerY.equalTo(0);
            make.size.equalTo(100);
        }];
        // atk
        UILabel *atkLb = [[UILabel alloc] init];
        atkLb.text = @"ATK:";
        atkLb.font = [UIFont systemFontOfSize:15];
        atkLb.tag = constATKTag;
        [_basicInfoView addSubview:atkLb];
        [atkLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(avatarIV);
            make.left.equalTo(avatarIV.mas_right).equalTo(8);
        }];
        // hp
        UILabel *hpLb = [[UILabel alloc] init];
        hpLb.text = @"HP:";
        hpLb.font = [UIFont systemFontOfSize:15];
        hpLb.tag = constHPTag;
        [_basicInfoView addSubview:hpLb];
        [hpLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(atkLb.mas_bottom).equalTo(10);
            make.left.equalTo(atkLb);
        }];
        
        // 分割线
        UIView *sepView = [[UIView alloc] init];
        sepView.backgroundColor = NORMAL_SEPARATOR_COLOR;
        [_basicInfoView addSubview:sepView];
        [sepView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(0);
            make.height.equalTo(1);
        }];
    }
    return _basicInfoView;
}
- (PDServantDetailViewModel *)viewModel {
    if (_viewModel == nil) {
        _viewModel = [[PDServantDetailViewModel alloc] initWithServantId:self.servantId];
    }
    return _viewModel;
}
@end
