//
//  UserInfo.m
//  SzfyTradingPlatform
//
//  Created by 侯英格 on 16/7/11.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import "UserInfo.h"
#import "SzfySystemObject.h"
#import <objc/runtime.h>

@implementation UserInfo

-(void)encodeWithCoder:(NSCoder *)aCoder{
    //[aCoder encodeObject:self.mobile forKey:@"mobile"];
    
    unsigned int count;
    //获取属性列表
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    for (unsigned int i=0; i<count; i++) {
        const char *propertyname =property_getName(propertyList[i]);
        id propertyValue = [self valueForKey:[NSString stringWithUTF8String:propertyname]];
        [aCoder encodeObject:propertyValue forKey:[NSString stringWithUTF8String:propertyname]];
    }
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    return self;
}

@end

@implementation TotalUserInfo

-(void)saveUserInfo:(UserInfo*)userInfo{
    if (userInfo) {
        [self.totalUserInfoDic setValue:userInfo forKey:userInfo.mobile];
        [[SzfySystemObject sharedInstance] saveTotalUserInfo];
    }
}

-(NSMutableDictionary *)totalUserInfoDic{
    if (!_totalUserInfoDic) {
        _totalUserInfoDic=[[NSMutableDictionary alloc] init];
    }
    return _totalUserInfoDic;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.totalUserInfoDic forKey:@"totalUserInfoDic"];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    self.totalUserInfoDic = [aDecoder decodeObjectForKey:@"totalUserInfoDic"];
    return self;
}



@end
