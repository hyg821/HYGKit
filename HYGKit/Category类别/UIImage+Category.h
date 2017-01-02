//
//  UIImage+changeColor.h
//  Yipuhui
//
//  Created by 侯英格 on 15/12/16.
//  Copyright © 2015年 亿谱汇理财. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)
-(UIImage *)imageWithColor:(UIColor *)color;
+(UIImage*)getWithImage:(UIImage*)image SubImage:(CGRect)rect;
@end
