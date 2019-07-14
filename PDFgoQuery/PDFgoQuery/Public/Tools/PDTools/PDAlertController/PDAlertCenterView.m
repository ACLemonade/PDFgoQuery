//
//  PDAlertCenterView.m
//  PDAlertControllerOC
//
//  Created by Lemonade on 2019/5/30.
//  Copyright © 2019 Lemonade. All rights reserved.
//

#import "PDAlertCenterView.h"
#import "NSString+PDAlertUtils.h"
// 尺寸
#define kLeftSpacing    50
#define kMinTopSpacing     100
#define kActionButtonHeight 44

#define kSeperatorLineHeight    1

#define kDefaultSpacing 15

#define kScreenWidth    UIScreen.mainScreen.bounds.size.width
#define kScreenHeight   UIScreen.mainScreen.bounds.size.height

#define kViewWidth  (kScreenWidth-kLeftSpacing*2)
// 字体
#define kTitleFont      [UIFont systemFontOfSize:17 weight:UIFontWeightBold]
#define kMessageFont    [UIFont systemFontOfSize:13 weight:UIFontWeightRegular]
#define kButtonFont     [UIFont systemFontOfSize:15 weight:UIFontWeightRegular]
// 颜色
#define kRGBHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define kMainBlueColor  kRGBHex(0x1E90FF)

#define kBtnDefaultTag  20000

@interface PDAlertCenterView () {
    CGFloat _estimateViewHeight;
    CGFloat _viewHeight;
    NSString *_title;
    NSString *_message;
}
/** 内容视图 */
@property (nonatomic, readwrite, strong) UIScrollView *contentView;

@property (nonatomic, readwrite, strong) NSArray<PDAlertAction *> *actionList;

@end

@implementation PDAlertCenterView
#pragma mark - Initial Methods
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message actionList:(nullable NSArray *)actionList {
    if (self = [super init]) {
        _estimateViewHeight = 300;
        _viewHeight = 300;
        _title = _title ?: @"";
        self.actionList = actionList;
        // 去除标题首尾空格,换行
        _title = [title stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        // 去除内容首尾空格,换行
        _message = [message stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        CGFloat titleHeight = ceil([_title boundingRectWithSize:CGSizeMake(kViewWidth-kDefaultSpacing*2, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: kTitleFont} context:nil].size.height);
//        CGFloat messageHeight = ceil([_message boundingRectWithSize:CGSizeMake(kViewWidth-kDefaultSpacing*2, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: kMessageFont} context:nil].size.height);
        CGFloat messageHeight = [_message heightWithFont:kMessageFont width:kViewWidth-kDefaultSpacing*2 hasFirstLineHeadIndent:YES];
        if (![_title isEqualToString:@""]) {
            _estimateViewHeight = 25 + titleHeight + 10 + messageHeight + 25 + (kSeperatorLineHeight+kActionButtonHeight)*self.actionList.count;
        } else {
            _estimateViewHeight = 25 + messageHeight + 25 + (kSeperatorLineHeight+kActionButtonHeight)*self.actionList.count;
        }
        // 如果预估总高度过高，给定最大值，并对内容部分做滚动处理
        if ((_estimateViewHeight+kMinTopSpacing*2) > kScreenHeight) {
            _viewHeight = kScreenHeight - kMinTopSpacing*2;
        } else {
            _viewHeight = _estimateViewHeight;
        }

        self.backgroundColor = kRGBHex(0xB0C4DE);
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        self.frame = CGRectMake(kLeftSpacing, (kScreenHeight-_viewHeight)/2, kViewWidth, _viewHeight);
        
        [self createActionButtons];
    }
    return self;
}
#pragma mark - Private Methods
- (void)createActionButtons {
    UIView *lastView = self.contentView;
    NSInteger index = kBtnDefaultTag;
    for (PDAlertAction *action in self.actionList) {
        UIButton *actionBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        actionBtn.frame = CGRectMake(0, CGRectGetMaxY(lastView.frame)+kSeperatorLineHeight, kViewWidth, kActionButtonHeight);
        [self addSubview:actionBtn];
        [actionBtn setTitle:action.actionTitle forState:UIControlStateNormal];
        [actionBtn setTitleColor:kMainBlueColor forState:UIControlStateNormal];
        actionBtn.titleLabel.font = kButtonFont;
        actionBtn.backgroundColor = UIColor.whiteColor;
        actionBtn.tag = index;
        [actionBtn addTarget:self action:@selector(btnClickAction:) forControlEvents:UIControlEventTouchUpInside];
        lastView = actionBtn;
        index++;
    }
}
#pragma mark - Event Response
- (void)btnClickAction:(UIButton *)sender {
    PDAlertAction *action = self.actionList[sender.tag-kBtnDefaultTag];
    if (action.handlerBlock) {
        action.handlerBlock();
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"dismiss" object:nil];
}
#pragma mark - Lazy Load
- (UIScrollView *)contentView {
    if (_contentView == nil) {
        _contentView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kViewWidth, _viewHeight-(kSeperatorLineHeight+kActionButtonHeight)*self.actionList.count)];
        _contentView.contentSize = CGSizeMake(kViewWidth, _estimateViewHeight-(kSeperatorLineHeight+kActionButtonHeight)*self.actionList.count);
        [self addSubview:_contentView];
        _contentView.backgroundColor = UIColor.whiteColor;
        _contentView.bounces = NO;
        _contentView.showsVerticalScrollIndicator = NO;
        CGFloat titleHeight = ceil([_title boundingRectWithSize:CGSizeMake(kViewWidth-kDefaultSpacing*2, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: kTitleFont} context:nil].size.height);
//        CGFloat messageHeight = ceil([_message boundingRectWithSize:CGSizeMake(kViewWidth-kDefaultSpacing*2, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: kMessageFont} context:nil].size.height);
        CGFloat messageHeight = [_message heightWithFont:kMessageFont width:kViewWidth-kDefaultSpacing*2 hasFirstLineHeadIndent:YES];

        if (![_title isEqualToString:@""]) {
            UILabel *titleLb = [[UILabel alloc] initWithFrame:CGRectMake(kDefaultSpacing, 25, kViewWidth-kDefaultSpacing*2, titleHeight)];
            [_contentView addSubview:titleLb];
            titleLb.text = _title;
            titleLb.textColor = UIColor.blackColor;
            titleLb.font = kTitleFont;
            titleLb.textAlignment = NSTextAlignmentCenter;
            
            UILabel *messageLb = [[UILabel alloc] initWithFrame:CGRectMake(kDefaultSpacing, CGRectGetMaxY(titleLb.frame)+10, kViewWidth-kDefaultSpacing*2, messageHeight)];
            [_contentView addSubview:messageLb];
            NSMutableParagraphStyle *style = _message.pargraphStyle;
            style.firstLineHeadIndent = kMessageFont.lineHeight*2-2;
            messageLb.attributedText = [[NSAttributedString alloc] initWithString:_message attributes:@{NSForegroundColorAttributeName: UIColor.lightGrayColor, NSFontAttributeName: kMessageFont, NSParagraphStyleAttributeName: style}];
            messageLb.lineBreakMode = NSLineBreakByCharWrapping;
            messageLb.numberOfLines = 0;
        } else {
            UILabel *messageLb = [[UILabel alloc] initWithFrame:CGRectMake(kDefaultSpacing, 25, kViewWidth-kDefaultSpacing*2, messageHeight)];
            [_contentView addSubview:messageLb];
            NSMutableParagraphStyle *style = _message.pargraphStyle;
            style.firstLineHeadIndent = kMessageFont.lineHeight*2-2;
            messageLb.attributedText = [[NSAttributedString alloc] initWithString:_message attributes:@{NSForegroundColorAttributeName: UIColor.lightGrayColor, NSFontAttributeName: kMessageFont, NSParagraphStyleAttributeName: style}];
            messageLb.lineBreakMode = NSLineBreakByCharWrapping;
            messageLb.numberOfLines = 0;
        }
        
    }
    return _contentView;
}
@end
