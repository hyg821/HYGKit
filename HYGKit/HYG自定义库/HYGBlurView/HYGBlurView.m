//
//  HYGBlurView.m
//  Yipuhui
//
//  Created by 侯英格 on 16/1/6.
//  Copyright © 2016年 亿谱汇理财. All rights reserved.
//

#import "HYGBlurView.h"
#import "HYGToolDefine.h"

@implementation HYGBlurView
static HYGBlurView*view=nil;

-(HYGBlurView*)init{
    self=[super init];
    if (self) {
        self.alpha=0;
        self.frame=CGRectMake(0, 0, UIW, UIH);
        self.dynamic=NO;
        self.blurRadius=15;
        self.tintColor=HYGCOLOR(0, 0.5, 0.5, 1);
    }
    return self;
}

+(HYGBlurView*)share{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!view) {
            view=[[HYGBlurView alloc] init];
        }
    });
    return view;
}

+(void)show{
    HYGBlurView*view=[HYGBlurView share];
    if (!view.superview) {
        if (view.alpha!=0) {
            view.alpha=0;
        }
        [[UIApplication sharedApplication].keyWindow addSubview:view];
        [UIView animateWithDuration:0.15 animations:^{
            view.alpha=1;
        }];
    }
}
+(void)dismis{
    HYGBlurView*view=[HYGBlurView share];
    if (view.superview) {
        if (view.alpha!=1) {
            view.alpha=1;
        }
        [UIView animateWithDuration:0.15 animations:^{
            view.alpha=0;
        } completion:^(BOOL finished) {
            [view removeFromSuperview];
        }];
       
    }
}

@end
