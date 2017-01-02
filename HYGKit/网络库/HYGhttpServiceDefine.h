//
//  HYGhttpServiceDefine.h
//  SzfyTradingPlatform
//
//  Created by 侯英格 on 16/7/12.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#ifndef HYGhttpServiceDefine_h
#define HYGhttpServiceDefine_h

//App网络地址宏+网络库头文件

//加密的key
#define APPKEY  @"eph20150923wgxxym,com,.*"
//测试地址

//齐斌辉地址     http://192.168.0.186:8080
//王赛期测试地址  http://192.168.0.130
//239测试地址    http://192.168.0.239:7000
//测试环境地址    http://192.168.0.234:6699
//231测试地址    http://192.168.0.231:8000
//UAT地址       http://192.168.0.236:6699
//正式环境       http://mobile.ephwealth.com:6699

//SZFY_RELEASE 生产
//SZFY_DEBUG 调试
#define SZFY_DEBUG


//------------------------------测试URL-----------------------------------------------//
#ifdef SZFY_DEBUG

#define APP_BASIC_HTTPURL @"http://192.168.0.234:6699"

/*用户URI*/
#define APP_BASIC_USER                   @"/ephwealth-mobile/user/executeFun?params="
/*投资URI*/
#define APP_BASIC_INVEST                 @"/ephwealth-mobile/invest/executeFun?params="
/*银行卡URI*/
#define APP_BASIC_BANKINFO               @"/ephwealth-mobile/bankInfo/executeFun?params="
/*充值URI*/
#define APP_BASIC_RECHARGE               @"/ephwealth-mobile/recharge/executeFun?params="
/*提现URI*/
#define APP_BASIC_CASH                   @"/ephwealth-mobile/cash/executeFun?params="
/*交易URI*/
#define APP_BASIC_TRADE                  @"/ephwealth-mobile/trade/executeFun?params="
/*安全URI*/
#define APP_BASIC_SECURITY               @"/ephwealth-mobile/security/executeFun?params="
/*红包URI*/
#define APP_BASIC_REDPACKET              @"/ephwealth-mobile/coupon/executeFun?params="
/*轮播图URI*/
#define APP_BASIC_ACTIVITY               @"/ephwealth-mobile/index/executeFun?params="
/**散标*/
#define APP_BASIC_STANDARDPOWDER         @"/ephwealth-mobile/bidinfo/executeFun?params="
/**积分——李杰接口*/
#define APP_BASIC_JIFEN                  @"/ephwealth-mobile/jifen/executeFun?params="
/**登录积分商城*/
#define APP_BASIC_LOGININTEGRALMALL      @"/mallFront/autoLogin/executeFun?params="
/**签到接口*/
#define APP_BASIC_DAILYSIGNIN            @"/mallFront/dailySignIn/executeFun?params="
/**查询用户积分总数返回是否签到*/
#define APP_BASIC_GETUSERPOINTS          @"/mallFront/getUserPoints/executeFun?params="
/**查询用户积分日历*/
#define APP_BASIC_GETSIGNDAYS            @"/mallFront/getSignDays/executeFun?params="
/**体验金*/
#define APP_BASIC_UEBIDINFO              @"/ephwealth-mobile/ueBidInfo/executeFun?params="

#endif


//------------------------------线上URL---------------------------------------------------//
#ifdef YPH_RELEASE

#define APP_BASIC_HTTPURL @"http://mobile.ephwealth.com:6699"

/*用户URI*/
#define APP_BASIC_USER                   @"/user/executeFun?params="
/*投资URI*/
#define APP_BASIC_INVEST                 @"/invest/executeFun?params="
/*银行卡URI*/
#define APP_BASIC_BANKINFO               @"/bankInfo/executeFun?params="
/*充值URI*/
#define APP_BASIC_RECHARGE               @"/recharge/executeFun?params="
/*提现URI*/
#define APP_BASIC_CASH                   @"/cash/executeFun?params="
/*交易URI*/
#define APP_BASIC_TRADE                  @"/trade/executeFun?params="
/*安全URI*/
#define APP_BASIC_SECURITY               @"/security/executeFun?params="
/*红包URI*/
#define APP_BASIC_REDPACKET              @"/coupon/executeFun?params="
/*轮播图URI*/
#define APP_BASIC_ACTIVITY               @"/index/executeFun?params="
/*散标*/
#define APP_BASIC_STANDARDPOWDER         @"/bidinfo/executeFun?params="
/**积分——李杰接口*/
#define APP_BASIC_JIFEN                  @"/jifen/executeFun?params="
/**登录积分商城*/
#define APP_BASIC_LOGININTEGRALMALL      @"/autoLogin/executeFun?params="
/**签到接口*/
#define APP_BASIC_DAILYSIGNIN            @"/dailySignIn/executeFun?params="
/**查询用户积分总数返回是否签到*/
#define APP_BASIC_GETUSERPOINTS          @"/getUserPoints/executeFun?params="
/**查询用户积分日历*/
#define APP_BASIC_GETSIGNDAYS            @"/getSignDays/executeFun?params="
/**体验金*/
#define APP_BASIC_UEBIDINFO              @"/ueBidInfo/executeFun?params="

#endif

#import "HYGhttpRequestHeader.h"
#import "HYGhttpService.h"
#import "SzfyHttpService.h"

#endif /* HYGhttpServiceDefine_h */
