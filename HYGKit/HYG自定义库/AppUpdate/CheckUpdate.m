//
//  CheckUpdate.m
//  Yipuhui
//
//  Created by 侯英格 on 16/3/2.
//  Copyright © 2016年 亿谱汇理财. All rights reserved.
//

#import "CheckUpdate.h"
#import "AFNetworking.h"
#import "HYGSystemDefine.h"

@interface CheckUpdate()<UIAlertViewDelegate>
@end

@implementation CheckUpdate

static CheckUpdate*check=nil;
+(CheckUpdate*)share{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!check) {
            check=[[CheckUpdate alloc] init];
            check.isNeedUpdate=NO;
        }
    });
    return check;
}

-(void)checkIsNeedUpdate{
    //获取版本号
    NSDictionary *bundleDic = [[NSBundle mainBundle] infoDictionary];
    NSString *appVersion = [bundleDic objectForKey:@"CFBundleShortVersionString"];
    
    
    [[AFHTTPSessionManager manager] POST:[NSString stringWithFormat:@"http://itunes.apple.com/lookup?id=%@",APPID] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *infoArray = [responseObject objectForKey:@"results"];
        if ([infoArray count]==1) {
            self.releaseInfoDic=[infoArray objectAtIndex:0];
            //版本
            NSString*appStoreVersion = [self.releaseInfoDic objectForKey:@"version"];
            //新版本描述
            //NSString*appStoreDescription=[self.releaseInfoDic objectForKey:@"releaseNotes"];
            //[appStoreVersion isEqualToString:appVersion]
            if (appStoreVersion&&[self compareVersionNumberWithAppStoreVersion:appStoreVersion andAppVersion:appVersion])
            {
                self.isNeedUpdate=YES;
                [self update];
            }else{
                self.isNeedUpdate=NO;
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
}

-(void)update{
    if (self.isNeedUpdate==YES) {
        UIAlertView*alert = [[UIAlertView alloc] initWithTitle:@"更新提示" message:[self.releaseInfoDic objectForKey:@"releaseNotes"] delegate:self cancelButtonTitle:@"下载" otherButtonTitles:nil];
        alert.tag=100;
        [alert show];
    }
}



-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag==100) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[self.releaseInfoDic objectForKey:@"trackViewUrl"]]];
    }
}

-(BOOL)compareVersionNumberWithAppStoreVersion:(NSString*)appStoreVersion andAppVersion:(NSString*)appVersion{
    NSArray*appStoreArray=[appStoreVersion componentsSeparatedByString:@"."];
    NSArray*appArray=[appVersion componentsSeparatedByString:@"."];
    if (appStoreArray.count==3&&appArray.count==3) {
        for (int i=0; i<3; i++) {
            if ([appArray[i] integerValue]==[appStoreArray[i] integerValue]) {
                if (i==2) {
                    return NO;
                }
                else{
                    continue;
                }
                
            }
            if ([appArray[i] integerValue]<[appStoreArray[i] integerValue]) {
                return YES;
            }
            else{
                return NO;
            }
        }
    }
    else{
        return NO;
    }
    return NO;
}

@end

























