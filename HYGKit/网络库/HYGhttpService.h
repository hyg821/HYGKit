//
//  HYGhttpService.h
//  
//
//  Created by 侯英格 on 15/9/25.
//
//

#import <Foundation/Foundation.h>
#import "HYGhttpRequestHeader.h"
#import "HYGRootViewController.h"
#import "HYGhttpServiceDefine.h"
@interface HYGhttpService : NSObject

+(void)startWebReqWithRequestHeader:(HYGhttpRequestHeader*)requestHeader andViewController:(UIViewController*)vc andSuccess:(void (^)(NSURLSessionDataTask *task, id responseObject))success andFail:(void (^)(NSURLSessionDataTask * task, NSError * error))failure;

/*
    HYGhttpRequestHeader*header=[HYGhttpRequestHeader new];
    header.requestAddress=APP_BASIC_HTTPURL;
    header.requestURL=APP_BASIC_STANDARDPOWDER;
    header.requestCode=@"K12001";
    header.isNeedShowHud=YES;
    [HYGhttpService startWebReqWithRequestHeader:header andViewController:self andSuccess:^(NSURLSessionDataTask *task, id responseObject) {
    } andFail:^(NSURLSessionDataTask *task, NSError *error) {
 
    }];
 */

@end
