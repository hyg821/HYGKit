//
//  HYGhttpService.m
//  
//
//  Created by 侯英格 on 15/9/25.
//
//

#import "HYGhttpService.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import "DesUtil.h"
#import "MBProgressHUD+Category.h"
#import "HYGhttpServiceDefine.h"


static NSUInteger hudNum=0;

@implementation HYGhttpService

/**收集网络任务*/
+(void)startWebReqWithRequestHeader:(HYGhttpRequestHeader*)requestHeader andViewController:(UIViewController*)vc andSuccess:(void (^)(NSURLSessionDataTask *task, id responseObject))success andFail:(void (^)(NSURLSessionDataTask * task, NSError * error))failure{
    NSURLSessionDataTask *task=[HYGhttpService startWebReqWithRequestHeader:requestHeader andSuccess:success andFail:failure];
    if ([vc isKindOfClass:[HYGRootViewController class]]) {
        HYGRootViewController*hygVC=(HYGRootViewController*)vc;
        [hygVC.taskArray addObject:task];
    }
}

/**加密*/
+(NSURLSessionDataTask *)startWebReqWithRequestHeader:(HYGhttpRequestHeader*)requestHeader andSuccess:(void (^)(NSURLSessionDataTask *task, id responseObject))success andFail:(void (^)(NSURLSessionDataTask * task, NSError * error))failure{
    
    if (requestHeader.isNeedShowHud==YES) {
        if (hudNum==0) {
            hudNum++;
            [MBProgressHUD hyg_showWaitView];
        }
    }
    
    //转换成String
    NSString *paramsData =[requestHeader.paramsDic mj_JSONString];
    
    //包装字典
    NSMutableDictionary*finalParams=[[NSMutableDictionary alloc]init];
    [finalParams setValue:paramsData  forKey:@"paramsData"];
    [finalParams setValue:requestHeader.requestCode forKey:@"paramsCode"];
    
    //包装之后的字典转换String
    NSString*ParmesStr=[finalParams mj_JSONString];
    
    //替换转译字符
    NSString*finalParmesStr=[HYGhttpService stringReplace:ParmesStr];
    
    //加密
    NSString *encyrptStr=[DesUtil encryptUseDES:finalParmesStr key:APPKEY];
    
    //发送请求
    NSString*requestURL=[NSString stringWithFormat:@"%@%@%@",requestHeader.requestAddress,requestHeader.requestURL,encyrptStr];
    
    NSURLSessionDataTask * ask=[HYGhttpService getWithURL:requestURL params:nil success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
        if (success) {
            success(task,responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(task,error);
        }
    }];
    
    return ask;
}

/**正式请求*/
+ (NSURLSessionDataTask *)getWithURL:(NSString *)url params:(NSString *)params success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval=15;
    NSURLSessionDataTask * task=[manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSData *resultData = [HYGhttpService decodeDataWith:responseObject];
        if (resultData) {
            id result = [NSJSONSerialization JSONObjectWithData:resultData options:NSJSONReadingMutableContainers error:nil];
            [MBProgressHUD hyg_hideWaitView];
            hudNum--;
            success(task,result);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [MBProgressHUD hyg_hideWaitView];
         hudNum--;
        [MBProgressHUD hyg_showFailMessageWithString:@"请检查您的网络" andImage:nil];
        failure(task,error);
    }];
    return task;
}


+ (NSString *)stringReplace:(NSString *)userPackStr{
    NSString* str =[userPackStr stringByReplacingOccurrencesOfString:@"\\\"" withString:@"\""];
    NSString*sting=[str stringByReplacingOccurrencesOfString:@"\"{" withString:@"{"];
    NSString*sting1=[sting stringByReplacingOccurrencesOfString:@"}\"" withString:@"}"];
    return sting1;
}

+ (NSData *)decodeDataWith:(NSData *)secretData{
    NSString *result = [[NSString alloc] initWithData:secretData encoding:NSUTF8StringEncoding];
    NSString* str =[result stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    NSString* dencyrptStriv=[DesUtil decryptUseDES:str key:APPKEY];
    NSData*data=[dencyrptStriv dataUsingEncoding:NSUTF8StringEncoding];
    return data;
}

@end
