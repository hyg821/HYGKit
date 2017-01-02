//
//  NSString+Category.h
//  SzfyTradingPlatform
//
//  Created by 侯英格 on 16/7/13.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Category)

//目前想到的就是一些判断

/**是否是移动电话号码*/
+ (BOOL)hyg_isMobilePhoneNumber:(NSString *)number andIsNeedHud:(BOOL)hud;

/**检验密码 根据业务不同 检验条件也不同*/
+ (BOOL)hyg_isPassword:(NSString *)number andIsNeedHud:(BOOL)hud;

/**检验身份证*/
+ (BOOL)hyg_isIdCard:(NSString *)number andIsNeedHud:(BOOL)hud;

/**检验钱数*/
+ (BOOL)hyg_isMoneyNumber:(NSString *)number andIsNeedHud:(BOOL)hud;

/**检验不能为空*/
+ (BOOL)hyg_isEmpty:(NSString *)number andIsNeedHud:(BOOL)hud;


/**隐藏手机号低4位开始中间4位数字*/
+ (NSString *)makeNumberSecureWithNormalNumber:(NSString *)normalNum;

/**隐藏身份证号码*/
+ (NSString *)makeIdCardNumberSecureWithNormalNumber:(NSString *)normalNum;

/**金额转换*/
+(NSString *)changeNumWithNumString:(NSString *)str;

@end
