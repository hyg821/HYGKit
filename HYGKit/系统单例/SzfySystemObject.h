//
//  SzfySystemObject.h
//  SzfyTradingPlatform
//
//  Created by 侯英格 on 16/7/11.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UserInfo.h"


@interface SzfySystemObject : NSObject

+(instancetype)sharedInstance;

-(void)prepareForAppInitialize;

//-----------------------------------数据层-----------------------------------//

/**是否是调试模式 YES=debug NO=Release*/
@property(nonatomic,assign)BOOL isDebug;

//-----------------------------------数据层-----------------------------------//

/**当前的userinfo 只有登录之后才能设置 所有的当前用户的信息都从这里拿 不要使用下边的totalUserInfo totalUserInfo这个东西就是为了存储用的*/
@property(nonatomic,strong)UserInfo*mainUserInfo;

/**让某一个userinfo变成当前的userinfo*/
-(void)makeSomeUserInfoBecameMainUserInfo:(UserInfo*)userInfo;

/**所有的userinfo集合 每次程序启动 都会先从缓存读 然后 登陆之后 调用上边的方法在重新设置成 主userinfo*/
@property(nonatomic,strong)TotalUserInfo*totalUserInfo;

/**存储当前的所有userinfo 只要有userinfo的信息改变 都需要重新存一下*/
-(void)saveTotalUserInfo;

/**移除当前的所有userinfo*/
-(void)removeTotalUserInfo;

//-----------------------------------UI层-----------------------------------//

/**当前的tabbar控制器*/
@property(nonatomic,strong)UITabBarController*tabBarViewController;

@end
