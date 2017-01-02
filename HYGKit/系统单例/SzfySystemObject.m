//
//  SzfySystemObject.m
//  SzfyTradingPlatform
//
//  Created by 侯英格 on 16/7/11.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import "SzfySystemObject.h"
#import "HYGPodsDefine.h"
#import "MainViewController.h"

static  NSString* const SystemCacheKey = @"SystemCache";
static  NSString* const TotalUserInfoKey = @"TotalUserInfo";

@implementation SzfySystemObject

static SzfySystemObject*_szfySystemObject=nil;

+(instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_szfySystemObject) {
            _szfySystemObject=[[SzfySystemObject alloc] init];
        }
    });
    return _szfySystemObject;
}

-(void)prepareForAppInitialize{
    [self prepareForData];
    [self prepareForUI];
}

-(void)prepareForData{
    if (DEBUG) {
        self.isDebug=YES;
    }else{
        self.isDebug=NO;
    }
    
    YYCache*cache=[[YYCache alloc] initWithName:SystemCacheKey];
    TotalUserInfo*totalUserInfo=(TotalUserInfo*)[cache objectForKey:TotalUserInfoKey];
    if (!totalUserInfo) {
        self.totalUserInfo=[[TotalUserInfo alloc] init];
        [cache setObject:self.totalUserInfo forKey:TotalUserInfoKey];
    }else{
        self.totalUserInfo=totalUserInfo;
    }
}


-(void)prepareForUI{
    NSDictionary *firstTabBarItemsAttributes = @{CYLTabBarItemTitle : @"首页",CYLTabBarItemImage : @"home_normal",CYLTabBarItemSelectedImage : @"home_highlight",};
    
    
    HYGViewControllerInfo*info=[HYGViewControllerInfo new];
    info.type=FromStoryBoard;
    [info.storyBoardInfoDic setValue:@"MainViewController" forKey:@"storyboardName"];
    [info.storyBoardInfoDic setValue:@"MainViewController" forKey:@"identifier"];
    MainViewController*vc=[MainViewController creatViewControllerWithInfo:info andParams:nil];
    
    self.tabBarViewController=[CYLTabBarController tabBarControllerWithViewControllers:@[[[UINavigationController alloc] initWithRootViewController:vc],[[UINavigationController alloc] initWithRootViewController:[UIViewController new]]] tabBarItemsAttributes:@[firstTabBarItemsAttributes,firstTabBarItemsAttributes]];

}

-(void)makeSomeUserInfoBecameMainUserInfo:(UserInfo*)userInfo{
    self.mainUserInfo=userInfo;
}



-(void)saveTotalUserInfo{
    YYCache*cache=[[YYCache alloc] initWithName:SystemCacheKey];
    [cache setObject:self.totalUserInfo forKey:TotalUserInfoKey];
}

-(void)removeTotalUserInfo{
    YYCache*cache=[[YYCache alloc] initWithName:SystemCacheKey];
    [cache removeAllObjects];
    [self.totalUserInfo.totalUserInfoDic removeAllObjects];
}



-(TotalUserInfo *)totalUserInfo{
    if (!_totalUserInfo) {
        _totalUserInfo=[[TotalUserInfo alloc] init];
    }
    return _totalUserInfo;
}

@end
