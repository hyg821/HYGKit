//
//  HYGhttpRequestHeader.h
//  网络库
//
//  Created by 侯英格 on 16/6/24.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, RequestType) {
    Get,
    Post,
};


typedef NS_ENUM(NSInteger, DebugType) {
    Debug,
    Release,
};

@interface HYGhttpRequestHeader : NSObject

/**请求域名*/
@property(nonatomic,copy)NSString*requestAddress;

/**请求地址*/
@property(nonatomic,copy)NSString*requestURL;

/**接口名称*/
@property(nonatomic,copy)NSString*requestCode;

/**请求参数*/
@property(nonatomic,strong)NSMutableDictionary*paramsDic;

/**请求类型 0=get/ 1=post*/
@property(nonatomic,assign)RequestType requestType;

/**是否需要显示hud*/
@property(nonatomic,assign)BOOL isNeedShowHud;

/**调试模式 debug/release*/
@property(nonatomic,assign)DebugType debugType;

@end
