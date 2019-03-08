//
//  DataHandleMacros.h
//  HuzhouTourSupervise
//
//  Created by Lemonade on 2018/3/30.
//  Copyright © 2018年 Zhejiang Rongchuang Information Industry Co., Ltd. All rights reserved.
//  数据处理宏定义

#ifndef DataHandleMacros_h
#define DataHandleMacros_h

// 用户ID
#define USER_ID         [RCUserDataManager shareUserData].userId
//  用户昵称
#define USER_NAME       [RCUserDataManager shareUserData].userName
// 用户token
#define USER_TOKEN      [RCUserDataManager shareUserData].token
// 用户手机号
#define USER_PHONE      [RCUserDataManager shareUserData].phone
// 用户头像地址
#define USER_IMAGE_URL  [RCUserDataManager shareUserData].picUrl

//判断是否为空
#define IsNilOrNull(_ref)   (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]))
// 判断是否为null
#define IsNull(_ref)    ([(_ref) isEqual:[NSNull null]])
// 判断是否为number
#define IsNumber(_ref)  ([(_ref) isKindOfClass:[NSNumber class]])
// 判断是否为string
#define IsString(_ref)   ([(_ref) isKindOfClass:[NSString class]])
// 判断是否为dictionary
#define IsDictionary(_ref)  ([(_ref) isKindOfClass:[NSDictionary class]])
// 判断是否为array
#define IsArray(_ref)   ([(_ref) isKindOfClass:[NSArray class]])

#define SURE_STR_NOT_NULL(x) ((x) == nil || [(x) isEqualToString:@"null"] ? @"" : (x))

#define SURE_STR_NOT_NIL(x) ((x) == nil || [(x) isEqualToString:@""] ? @"" : (x))

#define GetIntegerFromDict(_dict,_name,_defValue) ( (_dict == nil || [_dict objectForKey:_name] == nil) ? _defValue : [[NSString stringWithFormat:@"%@",[_dict objectForKey:_name]] integerValue])

#define GetFloatFromDict(_dict,_name,_defValue) ((_dict == nil || [_dict objectForKey:_name] == nil) ? _defValue : [[NSString stringWithFormat:@"%@",[_dict objectForKey:_name]] doubleValue])

#define GetStringFromDict(_dict,_name,_defValue) ((_dict == nil || [_dict objectForKey:_name] == nil || [_dict[_name] isEqual:[NSNull null]] ) ? _defValue : [NSString stringWithFormat:@"%@",[_dict objectForKey:_name]])

#define GetDictionaryFromDict(_dict,_name,_defValue) ((_dict == nil || [_dict objectForKey:_name] == nil) ? _defValue : [_dict objectForKey:_name])

#define GetDateFromDict(_dict,_name,_defValue) ((_dict == nil || [_dict objectForKey:_name] == nil) ? _defValue : [NSDate dateWithTimeIntervalSince1970:[[NSString stringWithFormat:@"%@",[_dict objectForKey:_name]] doubleValue]])

#endif /* DataHandleMacros_h */
