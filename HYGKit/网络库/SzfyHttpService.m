//
//  SzfyHttpService.m
//  SzfyTradingPlatform
//
//  Created by 侯英格 on 16/7/11.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import "SzfyHttpService.h"

@implementation SzfyHttpService

/**上来都需要检查一下是否符合后台的格式*/
+(BOOL)checkReturnCode:(id)responseObject{
    if ([responseObject isKindOfClass:[NSDictionary class]]) {
        NSInteger returnCode=[[responseObject objectForKey:@"returnCode"] integerValue];
        NSString * returnMessageStr=[responseObject objectForKey:@"returnMsg"];
        if (returnCode==0) {
            return YES;
        }else{
            [MBProgressHUD hyg_showFailMessageWithString:returnMessageStr andImage:nil];
            return NO;
        }
    }else{
        return NO;
    }
};

/**模板*/
+(void)startLoginWithRequestHeader:(HYGhttpRequestHeader*)requestHeader andViewController:(UIViewController*)vc andSuccess:(void (^)(NSURLSessionDataTask *task, id responseObject))success andFail:(void (^)(NSURLSessionDataTask * task, NSError * error))failure{
    [HYGhttpService startWebReqWithRequestHeader:requestHeader andViewController:vc andSuccess:^(NSURLSessionDataTask *task, id responseObject) {
        BOOL checkResult=[SzfyHttpService checkReturnCode:responseObject];
        if (checkResult) {
            success(task,responseObject);
        }
    } andFail:failure];
}

@end
