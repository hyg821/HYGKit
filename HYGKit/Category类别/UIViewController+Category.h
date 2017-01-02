//
//  UIViewController+NavigationColor.h
//  Yipuhui
//
//  Created by 侯英格 on 16/3/23.
//  Copyright © 2016年 亿谱汇理财. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Category)

-(void)setNavigationBarColorWithTitleColor:(UIColor*)titleColor andBarColor:(UIColor*)barColor andItemColor:(UIColor*)itemColor andIsNeedAnimation:(BOOL)animation;

@end
