//
//  HYGhttpRequestHeader.m
//  网络库
//
//  Created by 侯英格 on 16/6/24.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import "HYGhttpRequestHeader.h"

@implementation HYGhttpRequestHeader

-(RequestType)requestType{
    if (!_requestType) {
         _requestType=Get;
    }
    return _requestType;
}

-(DebugType)debugType{
    if (!_debugType) {
        _debugType=Debug;
    }
    return _debugType;
}

-(BOOL)isNeedShowHud{
    if (!_isNeedShowHud) {
        _isNeedShowHud=NO;
    }
    return _isNeedShowHud;
}

-(NSMutableDictionary *)paramsDic{
    if (!_paramsDic) {
        _paramsDic=[NSMutableDictionary dictionary];
    }
    return _paramsDic;
}

@end
