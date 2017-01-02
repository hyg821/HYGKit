//
//  SzfyHttpService.h
//  SzfyTradingPlatform
//
//  Created by 侯英格 on 16/7/11.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HYGhttpService.h"

/*
    尚智逢源网络调用层
    把网络请求集中写在一起 把每一个单独的接口暴露给别人使用
 */

@interface SzfyHttpService : NSObject

/**登录接口*/

+(void)startLoginWithRequestHeader:(HYGhttpRequestHeader*)requestHeader andViewController:(UIViewController*)vc andSuccess:(void (^)(NSURLSessionDataTask *task, id responseObject))success andFail:(void (^)(NSURLSessionDataTask * task, NSError * error))failure;

/**注册接口*/

@end
