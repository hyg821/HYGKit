//
//  HYGBlurView.h
//  Yipuhui
//
//  Created by 侯英格 on 16/1/6.
//  Copyright © 2016年 亿谱汇理财. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FXBlurView.h"
@interface HYGBlurView :FXBlurView
@property(nonatomic,copy)NSString*identifier;
+(HYGBlurView*)share;
+(void)show;
+(void)dismis;
@end
