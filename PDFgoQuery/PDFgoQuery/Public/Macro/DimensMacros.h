//
//  DimensMacros.h
//  HuzhouTourSupervise
//
//  Created by Lemonade on 2018/3/30.
//  Copyright © 2018年 Zhejiang Rongchuang Information Industry Co., Ltd. All rights reserved.
//  尺寸宏定义

#ifndef DimensMacros_h
#define DimensMacros_h

// 字体大小
#define FONT(_size)     [UIFont systemFontOfSize:_size]
#define PF_FONT(_size)     [UIFont fontWithName:@"PingFang SC" size:_size]

// 判断是否是iPhone X
#define KIS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
// 判断是否是iPhone XR
#define KIS_IPHONE_XR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
// 判断是否是iPhone XS Max
#define KIS_IPHONE_XS_MAX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)
// 状态栏高度
#define kStatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height
// 导航栏高度
#define kNavigationBarHeight (44.f)

#define kTopBarHeight       (kStatusBarHeight + kNavigationBarHeight)
#define kBottomBarHeight    ((KIS_IPHONE_X || KIS_IPHONE_XR || KIS_IPHONE_XS_MAX) ? (49.f + 34.f) : 49.f)

// iPhone X系列底部留白高度
#define kBottomWhiteHeight ((KIS_IPHONE_X || KIS_IPHONE_XR || KIS_IPHONE_XS_MAX) ? 34.f : 0)

#define kCellDefaultHeight      (44.f)

// 屏幕rect
#define SCREEN_RECT ([UIScreen mainScreen].bounds)
// 屏幕宽度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
// 屏幕高度
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

// App Frame
#define Application_Frame       [[UIScreen mainScreen] applicationFrame]

// App Frame Height&Width
#define App_Frame_Height        [[UIScreen mainScreen] applicationFrame].size.height
#define App_Frame_Width         [[UIScreen mainScreen] applicationFrame].size.width

#define CONTENT_HEIGHT (SCREEN_HEIGHT - kTopBarHeight)


// View 坐标(x,y)和宽高(width,height)
#define ViewxPos(v)                 (v).frame.origin.x
#define ViewyPos(v)                 (v).frame.origin.y
#define ViewWidth(v)                (v).frame.size.width
#define ViewHeight(v)               (v).frame.size.height

#define MinFrameX(v)                 CGRectGetMinX((v).frame)
#define MinFrameY(v)                 CGRectGetMinY((v).frame)

#define MidFrameX(v)                 CGRectGetMidX((v).frame)
#define MidFrameY(v)                 CGRectGetMidY((v).frame)

#define MaxFrameX(v)                 CGRectGetMaxX((v).frame)
#define MaxFrameY(v)                 CGRectGetMaxY((v).frame)

// 屏幕分辨率
#define SCREEN_RESOLUTION (SCREEN_WIDTH * SCREEN_HEIGHT * ([UIScreen mainScreen].scale))

// 获取安全区范围
#define VIEW_SAFE_AREA_INSETS(view)        ({UIEdgeInsets insets; if(@available(iOS 11.0, *)) {insets = view.safeAreaInsets;} else {insets = UIEdgeInsetsZero;} insets;})



#endif /* DimensMacros_h */
