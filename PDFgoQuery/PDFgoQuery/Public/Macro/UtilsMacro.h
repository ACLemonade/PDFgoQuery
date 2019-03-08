//
//  UtilsMacros.h
//  HuzhouTourSupervise
//
//  Created by Lemonade on 2018/3/30.
//  Copyright © 2018年 Zhejiang Rongchuang Information Industry Co., Ltd. All rights reserved.
//  工具宏定义

#ifndef UtilsMacros_h
#define UtilsMacros_h

#ifdef DEBUG
#define PDLog(fmt, ...) NSLog((@"\n%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define PDLog(...)
#endif


typedef NS_ENUM(NSInteger,AppDelegateTargetActionType){
    /**
     *  默认，直接进入首页
     */
    Default = 0,
    /**
     *  主页
     */
    Home,
    /**
     *  登陆页
     */
    Login,
};

#define RCDefaultDuration 2.f

#define ServiceName     @"com.zjrongchuang.fireCicada"

#define PUBKEY @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCO9EyByr2NSiMbj6xf6WePVGeangsfuBC+0k1TWAppaM/XbESsw+/nJVz5gwlU30XEAjK4G8oTUv6fYt807luE0WVJogVfhccvrs9IkiRWEU8PwR8iTuiHzWYkyrzuZ4bjWYYVo6FOM61xz5pTBB1wLwxuo7RAM7TzrNRlE+U1zwIDAQAB"

#define SHOW_ALERT(_msg_)  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:_msg_ delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];\
[alert show];

#define APPDELEGETE     ((AppDelegate*)[[UIApplication sharedApplication] delegate])

#define kImageName(name) [UIImage imageNamed:name]

#define LoadImageWithType(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]

//加载xib
#define LoadNib(x) [[NSBundle mainBundle] loadNibNamed:@(x) owner:nil options:nil][0]

//NSUserDefaults 实例化
#define USER_DEFAULT [NSUserDefaults standardUserDefaults]

//获取window
#define kWindow [UIApplication sharedApplication].keyWindow

//程序的本地化,引用国际化的文件
#define MyLocal(x, ...) NSLocalizedString(x, nil)

//等于系统版本号
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)

//大于系统版本号
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)

//大于或等于系统版本号
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

//小于系统版本号
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

//小于或等于系统版本号
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

// 当前版本
#define FSystemVersion          ([[[UIDevice currentDevice] systemVersion] floatValue])
#define DSystemVersion          ([[[UIDevice currentDevice] systemVersion] doubleValue])
#define SSystemVersion          ([[UIDevice currentDevice] systemVersion])


#define APPBundleVersion       [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

// BundleID
#define APPBundleID             [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"]

#define BaiDuMapKey    @"mhZbxOgmL0X57ETvPnzbhGkeg3npGjXZ"
#define BaiDuMapKey_HZ @"VGBs2nPRFFhAxNBD0qOeyb7hZz7Zxwpd"
#define BaiDuMapKey_JH @"1q0lPVEBG9p8jYiMP1wg7qOkh6hPzsDv"

// 当前语言
#define CURRENTLANGUAGE         ([[NSLocale preferredLanguages] objectAtIndex:0])

//角度转弧度
#define DEGREES_TO_RADIANS(d) (d * M_PI / 180)

//大于等于7.0的ios版本
#define iOS7_OR_LATER SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")

//大于等于8.0的ios版本
#define iOS8_OR_LATER SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")

//iOS6时，导航VC中view的起始高度
#define YH_HEIGHT (iOS7_OR_LATER ? 64:0)


// 获得当前的 年 月 日 时 分 秒
#define  CurrentSec [[NSCalendar currentCalendar] component:NSCalendarUnitSecond fromDate:[NSDate date]]
#define  CurrentMin [[NSCalendar currentCalendar] component:NSCalendarUnitMinute fromDate:[NSDate date]]
#define  CurrentHour [[NSCalendar currentCalendar] component:NSCalendarUnitHour fromDate:[NSDate date]]
#define  CurrentDay  [[NSCalendar currentCalendar] component:NSCalendarUnitDay fromDate:[NSDate date]]
#define  CurrentWeekday  [[NSCalendar currentCalendar] component:NSCalendarUnitWeekday fromDate:[NSDate date]]
#define  CurrentMonth [[NSCalendar currentCalendar] component:NSCalendarUnitMonth fromDate:[NSDate date]]
#define  CurrentYear [[NSCalendar currentCalendar] component:NSCalendarUnitYear fromDate:[NSDate date]]

//获取系统时间戳
#define GET_CURRENT_TIME [NSString stringWithFormat:@"%ld", (long)[[NSDate date] timeIntervalSince1970]]


// View 圆角和加边框
#define ViewBorderRadius(View, Radius, Width, Color)\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]
//masonry mas_equalTo -> equalTo
#define MAS_SHORTHAND_GLOBALS

#define COMPANY_TYPE_ARRAY              [NSArray arrayWithObjects:@"景区景点", @"酒店", @"旅行社", @"购物商场", nil]
#define SCENIC_TYPE_ARRAY               [NSArray arrayWithObjects:@"AAAAA", @"AAAA", @"AAA", @"AA", @"A", @"无", nil]
#define WINESHOP_TYPE_ARRAY             [NSArray arrayWithObjects:@"星级酒店", @"主题酒店", @"绿色酒店", nil]
#define WINESHOP_STAR_TYPE_ARRAY        [NSArray arrayWithObjects:@"未评定", @"1星", @"2星", @"3星", @"4星", @"5星", nil]
#define WINESHOP_THEME_TYPE_ARRAY       [NSArray arrayWithObjects:@"金鼎", @"银鼎", @"其他", nil]
#define WINESHOP_GREEN_TYPE_ARRAY       [NSArray arrayWithObjects:@"金树叶", @"银树叶", nil]
#define CR_REPAIR_STATE                 @[@"",@"待整改",@"待审核",@"延期申请",@"已完成",@"已过期",@"已督办"]

#define CR_EXAMINE_STATE                 @[@"待审核",@"审核通过",@"审核不通过"]

#define WEEKDAY_ARRAY       @[@"", @"星期天", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六"]


#define BANNER_SCENIC_ARRAY                 @[@"wu_01",@"nan_01",@"chang_01",@"an_01",@"de_01",@"du_01",@"kai_01"]
#define BANNER_WINESHOP_ARRAY                 @[@"wu_02",@"nan_02",@"chang_02",@"an_02",@"de_02",@"du_02",@"kai_02"]
#define BANNER_TRAVEL_ARRAY                 @[@"wu_03",@"nan_03",@"chang_03",@"an_03",@"de_03",@"du_03",@"kai_03"]
#define BANNER_SHOPPING_ARRAY                 @[@"wu_04",@"nan_04",@"chang_04",@"an_04",@"de_04",@"du_04",@"kai_04"]



//归解档
#define kArchive \
- (void)encodeWithCoder:(NSCoder *)aCoder{\
unsigned int outCount = 0;\
Ivar *varList = class_copyIvarList(self.class, &outCount);\
for (int i = 0; i<outCount; i++) {\
Ivar tmpIvar = varList[i];\
const char *name = ivar_getName(tmpIvar);\
NSString *propertyName = [NSString stringWithUTF8String:name];\
id obj = [self valueForKey:propertyName];\
[aCoder encodeObject:obj forKey:propertyName];\
}\
free(varList);\
}\
- (instancetype)initWithCoder:(NSCoder *)aDecoder{\
if (self = [super init]) {\
unsigned int outCount = 0;\
Ivar *varList = class_copyIvarList(self.class, &outCount);\
for (int i = 0; i<outCount; i++) {\
Ivar tmpIvar = varList[i];\
const char *name = ivar_getName(tmpIvar);\
NSString *propertyName = [NSString stringWithUTF8String:name];\
id obj = [aDecoder decodeObjectForKey:propertyName];\
[self setValue:obj forKey:propertyName];\
}\
free(varList);\
}\
return self;\
}\

#endif /* UtilsMacros_h */



