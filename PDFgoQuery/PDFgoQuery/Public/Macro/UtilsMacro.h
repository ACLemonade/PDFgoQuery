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


#define RCDefaultDuration 2.f

#define ServiceName     APPBundleID


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

#define WEEKDAY_ARRAY       @[@"", @"星期天", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六"]


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



