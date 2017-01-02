//
//  UIViewController+NavigationColor.m
//  Yipuhui
//
//  Created by 侯英格 on 16/3/23.
//  Copyright © 2016年 亿谱汇理财. All rights reserved.
//

#import "UIViewController+Category.h"

@implementation UIViewController (Category)

-(void)setNavigationBarColorWithTitleColor:(UIColor*)titleColor andBarColor:(UIColor*)barColor andItemColor:(UIColor*)itemColor andIsNeedAnimation:(BOOL)animation{
    if (self.navigationController) {
        UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
        temporaryBarButtonItem.title = @"";
        self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
        if (animation==YES) {
            [UIView animateWithDuration:0.3 animations:^{
                //设置导航条的颜色
                self.navigationController.navigationBar.barTintColor=barColor;
                //返回字体颜色
                self.navigationController.navigationBar.tintColor=itemColor;
                //标题颜色
                [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:titleColor}];
            }];
        }else{
            self.navigationController.navigationBar.barTintColor=barColor;
            self.navigationController.navigationBar.tintColor=itemColor;
            [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:titleColor}];
        }
    }
}
@end
