//
//  UserInfo.h
//  SzfyTradingPlatform
//
//  Created by 侯英格 on 16/7/11.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject<NSCoding>

/**手机号*/
@property(nonatomic,copy)NSString*mobile;

@end























@interface TotalUserInfo : NSObject<NSCoding>

/**key--value 来存储小的userInfo  key是每一个userinfo的手机号*/
@property(nonatomic,strong)NSMutableDictionary*totalUserInfoDic;

/**唯一的存储小userinfo的方法*/
-(void)saveUserInfo:(UserInfo*)userInfo;

@end
