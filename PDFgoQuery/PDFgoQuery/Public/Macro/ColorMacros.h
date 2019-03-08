//
//  ColorMacros.h
//  HuzhouTourSupervise
//
//  Created by Lemonade on 2018/3/30.
//  Copyright © 2018年 Zhejiang Rongchuang Information Industry Co., Ltd. All rights reserved.
//  色值宏定义

#ifndef ColorMacros_h
#define ColorMacros_h
//普通RGB颜色
#define RGBA(r,g,b,a)                   [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
//普通RGB颜色,默认不透明
#define RGB(r,g,b)                      RGBA(r,g,b,1.0f)
//使用十六进制颜色
#define UIColorFromRGB(rgbValue)        [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define DEFAULT_NAVBAR_COLOR            [UIColor colorWithRed:20.0/255.0 green:20.0/255.0 blue:20.0/255.0 alpha:0.9]
#define DEFAULT_NAVBARTITLE_COLOR       UIColorFromRGB(0x494949)
#define DEFAULT_BACKGROUND_COLOR        UIColorFromRGB(0xeaedf2)
#define DEFAULT_SEARCHBAR_COLOR         [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:244.0/255.0                                                                          alpha:1.0]
#define DEFAULT_GREEN_COLOR             [UIColor colorWithRed:31.0/255 green:185.0/255  blue:34.0/255                                                                                 alpha:1.0f]
#define DEFAULT_TEXT_GRAY_COLOR         [UIColor grayColor]
#define DEFAULT_LINE_GRAY_COLOR         [UIColor colorWithRed:188.0/255 green:188.0/255  blue:188.0/255                                                                               alpha:0.6f]


//导航背景色
#define NAVIGATION_BACKGROUNDCOLOR      UIColorFromRGB(0xec304c)

/*----------   文字颜色(配色方案)  ----------*/

// 视图背景色
#define VIEW_BACKGROUND_COLOR           UIColorFromRGB(0xF5F6FA)

// 主-蓝色
#define MAIN_BLUE_COLOR                 UIColorFromRGB(0x2896F8)
// 文字-黑色
#define TEXT_BLACK_COLOR               UIColorFromRGB(0x555555)
// 文字-灰色
#define TEXT_GRAY_COLOR                UIColorFromRGB(0xBBBBBB)

// 导航分割线颜色
#define NAV_SEPARATOR_COLOR            UIColorFromRGB(0xcdced3)
// 普通分割线颜色
#define NORMAL_SEPARATOR_COLOR         UIColorFromRGB(0xE5E5E5)

/*----------   文字颜色(配色方案)  ----------*/


#endif /* ColorMacros_h */
