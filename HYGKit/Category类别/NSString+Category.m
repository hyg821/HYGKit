//
//  NSString+Category.m
//  SzfyTradingPlatform
//
//  Created by 侯英格 on 16/7/13.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import "NSString+Category.h"
#import "MBProgressHUD+Category.h"

//@"^[A-Za-z0-9]{6,20}+$"; 用户名

//@"^[a-zA-Z0-9]{6,20}+$"; 密码

@implementation NSString (Category)

+ (BOOL)hyg_isMobilePhoneNumber:(NSString *)number andIsNeedHud:(BOOL)hud {
    NSString *pattern = @"^1[3|4|5|7|8][0-9]\\d{8}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL result = [predicate evaluateWithObject:number];
    if (hud==YES) {
        if (result==NO) {
            [MBProgressHUD hyg_showFailMessageWithString:@"请输入正确的手机号" andImage:nil];
        }
    }
    return result;
}


+ (BOOL)hyg_isPassword:(NSString *)number andIsNeedHud:(BOOL)hud {
    if (number.length!=6) {
        if (hud==YES) {
            [MBProgressHUD hyg_showFailMessageWithString:@"请输入正确的密码,规则有且仅有6位数字组成" andImage:nil];
        }
        return NO;
    }else{
        return YES;
    }
}

+ (BOOL)hyg_isIdCard:(NSString *)number andIsNeedHud:(BOOL)hud {
    if (number.length==15||number.length==18) {
        NSString *pattern=pattern=@"^(\\d{14}|\\d{17})(\\d|[xX])$";
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
        BOOL result = [predicate evaluateWithObject:number];
        if (hud==YES) {
            if (result==NO) {
                [MBProgressHUD hyg_showFailMessageWithString:@"请输入正确的身份证号" andImage:nil];
            }
        }
        return result;
    }else{
        if (hud==YES) {
            [MBProgressHUD hyg_showFailMessageWithString:@"请输入正确的身份证号" andImage:nil];
        }
        return NO;
    }
}

+ (BOOL)hyg_isMoneyNumber:(NSString *)number andIsNeedHud:(BOOL)hud {
    NSString *pattern = @"^[0-9]+(.[0-9]{2})?$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL result = [predicate evaluateWithObject:number];
    if (hud==YES) {
        if (result==NO) {
            [MBProgressHUD hyg_showFailMessageWithString:@"请输入正确的金额" andImage:nil];
        }
    }
    return result;
}

/**检验不能为空*/
+ (BOOL)hyg_isEmpty:(NSString *)number andIsNeedHud:(BOOL)hud{
    if (number.length==0||!number) {
        if (hud==YES) {
            [MBProgressHUD hyg_showFailMessageWithString:@"输入不能为空" andImage:nil];
        }
        return NO;
    }else{
        return YES;
    }
}

+ (NSString *)makeNumberSecureWithNormalNumber:(NSString *)normalNum{
    if (normalNum.length<=7) {
        NSMutableString *newNumber = [NSMutableString stringWithString:normalNum];
        [newNumber replaceCharactersInRange:NSMakeRange(3,normalNum.length-4 ) withString:@"****"];
        return newNumber;
    }
    NSMutableString *newNumber = [NSMutableString stringWithString:normalNum];
    [newNumber replaceCharactersInRange:NSMakeRange(4, 4) withString:@"****"];
    return newNumber;
}

+ (NSString *)makeIdCardNumberSecureWithNormalNumber:(NSString *)normalNum{
    if (!normalNum || [normalNum isEqualToString:@"<null>"] || normalNum.length<=12){
        return @"";
    }
    NSMutableString *newNumber = [NSMutableString stringWithString:normalNum];
    [newNumber replaceCharactersInRange:NSMakeRange(3, normalNum.length-7) withString:@"**********"];
    return newNumber;
    
}

+(NSString *)changeNumWithNumString:(NSString *)str{
    NSNumber* normalNum=@([str doubleValue]);
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = kCFNumberFormatterCurrencyStyle;
    NSString *string = [formatter stringFromNumber:normalNum];
    string = [string stringByReplacingOccurrencesOfString:@"$" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"￥" withString:@""];
    return string;
}

@end
