//
//  RC_NavigationViewController.m
//  FireCicada
//
//  Created by weedx on 2018/8/15.
//  Copyright © 2018年 Zhejiang Rongchuang Information Industry Co., Ltd. All rights reserved.
//

#import "RC_NavigationViewController.h"
@interface RC_NavigationViewController ()<UIGestureRecognizerDelegate>

@end

@implementation RC_NavigationViewController

//类初始化的时候调用,懒加载只会调用一次，子类如实现该方法会隐式调用父类的此方法
+ (void)initialize {
    //获取当前类及其子类下的导航条(不会影响其他的导航类)
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    //以下是设置全局导航条属性
    navigationBar.translucent = NO;
    navigationBar.barStyle = UIBarStyleDefault;
    //设置导航条的文字和图标颜色(不包含标题)
    navigationBar.tintColor = UIColor.whiteColor;
    //设置导航条的背景色
    
    [navigationBar setBackgroundImage:[UIImage imageWithColor:UIColorFromRGB(0xFFFFFF)] forBarMetrics:UIBarMetricsDefault];
//    navigationBar.barTintColor = UIColor.whiteColor;
    //设置导航条的标题文字属性
    navigationBar.titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:17 weight:UIFontWeightMedium],NSForegroundColorAttributeName:UIColor.blackColor};
    // 设置导航下方分割线颜色
    [navigationBar setShadowImage:[UIImage imageWithColor:NAV_SEPARATOR_COLOR]];
//    [navigationBar setShadowImage:[UIImage new]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //禁用系统的滑动返回手势功能
    self.interactivePopGestureRecognizer.enabled = YES;
    //创建自己的全屏滑动返回手势 target使用系统手势的代理对象 action使用系统处理滑动返回的action 可使用runtime获取私有属性及方法
    self.panGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:NSSelectorFromString(@"handleNavigationTransition:")];
    self.panGesture.edges = UIRectEdgeLeft;
    //设置手势的代理
    self.panGesture.delegate = self;
    //添加手势到视图
    [self.view addGestureRecognizer:self.panGesture];
}

- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {
    //栈内元素只有一个时禁用手势
    if (self.viewControllers.count == 1) {
        return NO;
    } else {
        return YES;
    }
}

#pragma mark - override
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count) {
        //压栈时设置非根控制器隐藏底部tabbar
        viewController.hidesBottomBarWhenPushed = YES;
        // 设置导航条左边按钮,把系统的返回按钮给覆盖,导航控制器的滑动返回功能就没有了
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navi_back"] style:UIBarButtonItemStylePlain target:self action:@selector(handleBack)];
    }
    [super pushViewController:viewController animated:animated];
}

#pragma mark - private
- (void)handleBack {
    if (self.topViewController && [self.topViewController respondsToSelector:@selector(backForbidden)]) {
        [self.topViewController backForbidden];
        
    } else {
        //出栈
        [self popViewControllerAnimated:YES];
    }
}
@end

@implementation UIViewController (RC_NavigationViewController)
//类装载的时候调用，只执行一次，分类的load()优先级最低,不要在此方法做耗时操作，会增加app启动时间
+ (void)load {
    // load方法里面已经是线程安全
    Class class = [self class];
    Method fromMethod = class_getInstanceMethod(class, @selector(viewWillDisappear:));
    Method toMethod = class_getInstanceMethod(class, @selector(swizzledViewWillDisappear:));
    //判断要交换的方法有没有实现，如果实现则交换两个方法的实现，其他属性不交换
    //如果要交换的方法没有实现可以使用消息转发利用runtime动态添加相应方法
    BOOL success = class_addMethod(class, method_getName(fromMethod), method_getImplementation(toMethod), method_getTypeEncoding(toMethod));
    if (success) {
        class_replaceMethod(class, method_getName(toMethod), method_getImplementation(fromMethod), method_getTypeEncoding(fromMethod));
    }else{
        method_exchangeImplementations(fromMethod, toMethod);
    }
}

- (void)swizzledViewWillDisappear:(BOOL)animated {
    //判断是否使用的自定义导航以及手势是否被禁用
    if (self.rc_navigationController && !self.rc_navigationController.panGesture.enabled) {
        self.rc_navigationController.panGesture.enabled = YES;
    }
    //表面上是递归，实际上是调用viewWillDisappear:方法
    [self swizzledViewWillDisappear:animated];
}

- (RC_NavigationViewController *)rc_navigationController
{
    UIViewController *vc = self;
    if ([vc.navigationController isKindOfClass:[RC_NavigationViewController class]]) {
        return (RC_NavigationViewController *)vc.navigationController;
    }
    return nil;
}

@end
