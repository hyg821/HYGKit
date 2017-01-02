//
//  HYGToolDefine.h
//  SzfyTradingPlatform
//
//  Created by 侯英格 on 16/7/12.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#ifndef HYGToolDefine_h
#define HYGToolDefine_h

//系统工具宏

//调试模式 Log
#ifdef DEBUG
#define HYGLog(...) NSLog(@"%@",[NSString stringWithFormat:__VA_ARGS__])
#else
#define HYGLog(...)
#endif

//app在appstore的ID
#define APPID @"1065712109"

//获取屏幕的frame
#define UIX [[UIScreen mainScreen] bounds].origin.x
#define UIY [[UIScreen mainScreen] bounds].origin.y
#define UIH [[UIScreen mainScreen] bounds].size.height
#define UIW [[UIScreen mainScreen] bounds].size.width

//边界设置颜色
#define HYGCOLOR(a,b,c,d) [UIColor colorWithRed:a/255.0 green:b/255.0 blue:c/255.0 alpha:d]

//设置颜色通过#ffffff这种形式
#define HYGCOLORFROMRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//随机颜色
#define HYGCOLORRANDOM [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

//强弱引用转换
/*
  block外部      weakSelf(self);
  block内部      strongSelf(weakSelf);
  block内部调用   [strongSelf heh];
 */
#define weakSelf(self)  __weak __typeof__(self) weakSelf = self
#define strongSelf(weakSelf) __strong __typeof__(weakSelf) strongSelf = weakSelf;

//GCD - 在Main线程上运行
#define HYGDISPATCH_MAIN_THREAD(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock);
//GCD - 开启异步线程
#define HYGDISPATCH_GLOBAL_QUEUE_DEFAULT(globalQueueBlock) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlocl);

#endif /* HYGToolDefine_h */
