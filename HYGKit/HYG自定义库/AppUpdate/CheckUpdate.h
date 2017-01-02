//
//  CheckUpdate.h
//  Yipuhui
//
//  Created by 侯英格 on 16/3/2.
//  Copyright © 2016年 亿谱汇理财. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CheckUpdate : NSObject
@property(nonatomic,assign)BOOL isNeedUpdate;
//app信息在appstore
@property(nonatomic,strong)NSDictionary*releaseInfoDic;
+(CheckUpdate*)share;
-(void)checkIsNeedUpdate;
-(void)update;
@end
