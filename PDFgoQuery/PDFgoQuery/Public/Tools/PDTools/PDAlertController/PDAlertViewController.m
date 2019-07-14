//
//  PDAlertViewController.m
//  PDAlertControllerOC
//
//  Created by Lemonade on 2019/5/28.
//  Copyright © 2019 Lemonade. All rights reserved.
//

#import "PDAlertViewController.h"
#import "PDAlertCenterView.h"

@interface PDAlertViewController () {
}
/** 弹出框样式,0-中间,1-底部 */
@property (nonatomic, readwrite, assign) PDAlertStyle alertStyle;

@property (nonatomic, readwrite, strong) NSString *alertTitle;
@property (nonatomic, readwrite, strong) NSString *alertMessage;

@property (nonatomic, readwrite, strong) PDAlertCenterView *centerView;

@property (nonatomic, readwrite, strong) NSMutableArray<PDAlertAction *> *actionList;

@end

@implementation PDAlertViewController
#pragma mark - Initial Methods

static PDAlertViewController *_instanceController = nil;
- (instancetype)initWithAlertStyle:(PDAlertStyle)alerStyle title:(NSString *)title message:(NSString *)message {
    if (self = [super init]) {
        self.alertStyle = alerStyle;
        self.alertTitle = title;
        self.alertMessage = message;
    }
    return self;
}
- (instancetype)initWithAlertStyleCustom {
    return [self initWithAlertStyle:PDAlertStyleCustom title:@"" message:@""];
}
#pragma mark - Life Circle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationDidChanged:) name:@"dismiss" object:nil];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    if (self.alertStyle == PDAlertStyleCenter) {
        [self.view addSubview:self.centerView];
    } else if (self.alertStyle == PDAlertStyleBottom) {
        
    } else {
        if (self.customView) {
            [self.view addSubview:self.customView];
        }
    }
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"dismiss" object:nil];
}
#pragma mark - Private Methods
- (void)notificationDidChanged:sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *tapTouch = touches.anyObject;
    CGPoint tapPoint = [tapTouch locationInView:self.view];
    if (!CGRectContainsPoint(self.centerView.frame, tapPoint)) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark - Public Methods
- (void)addAlertAction:(PDAlertAction *)alertAction {
    [self.actionList addObject:alertAction];
}
#pragma mark - Lazy Load
- (PDAlertCenterView *)centerView {
    if (_centerView == nil) {
        _centerView = [[PDAlertCenterView alloc] initWithTitle:self.alertTitle message:self.alertMessage actionList:[self.actionList copy]];
    }
    return _centerView;
}
- (NSMutableArray<PDAlertAction *> *)actionList {
    if (_actionList == nil) {
        _actionList = [NSMutableArray array];
    }
    return _actionList;
}
@end


