//
//  MBProgressHUD+Category.m
//  HYG外带全家桶
//
//  Created by 侯英格 on 16/6/28.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import "MBProgressHUD+Category.h"

#define dismissTime 1.85f
#define fontSize 15
#define fuzzyAlpha 0.065

@implementation MBProgressHUD (Category)

+(MBProgressHUD*)hyg_showMessageWithString:(NSString*)str{
    __block MBProgressHUD *hud;
    dispatch_async(dispatch_get_main_queue(), ^{
        hud=[MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
        hud.bezelView.layer.cornerRadius=10;
        hud.mode = MBProgressHUDModeText;
       
        hud.label.text =str;
        hud.label.numberOfLines=0;
        hud.label.font=[UIFont systemFontOfSize:fontSize];
        hud.label.textColor=[UIColor blackColor];
        hud.bezelView.color=[UIColor colorWithWhite:0 alpha:fuzzyAlpha];
        [hud hideAnimated:YES afterDelay:dismissTime];
    });
    return hud;
}


+(MBProgressHUD*)hyg_showWaitView{
    __block MBProgressHUD *hud;
    dispatch_async(dispatch_get_main_queue(), ^{
        hud=[MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
        hud.bezelView.layer.cornerRadius=10;
        hud.bezelView.color=[UIColor colorWithWhite:0 alpha:fuzzyAlpha];
    });
    return hud;
}

+(void)hyg_hideWaitView{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow animated:YES];
    });
}

+(MBProgressHUD*)hyg_showSuccessMessageWithString:(NSString*)str andImage:(UIImage*)image{
    __block MBProgressHUD *hud;
    dispatch_async(dispatch_get_main_queue(), ^{
        hud=[MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
        hud.mode = MBProgressHUDModeCustomView;
        hud.bezelView.layer.cornerRadius=10;
        hud.bezelView.color=[UIColor colorWithWhite:0 alpha:fuzzyAlpha];
        hud.label.text =str;
        hud.label.numberOfLines=0;
        hud.label.font=[UIFont systemFontOfSize:fontSize];
        hud.label.textColor=[UIColor blackColor];
        NSBundle *bundle = [NSBundle bundleForClass:[MBProgressHUD class]];
        NSURL *url = [bundle URLForResource:@"MBProgressHUD" withExtension:@"bundle"];
        NSBundle *imageBundle = [NSBundle bundleWithURL:url];
        UIImage*subimage;
        if (!image) {
            subimage=[UIImage imageWithContentsOfFile:[imageBundle pathForResource:@"success" ofType:@"png"]];
        }else{
            subimage=image;
        }
        hud.customView = [[UIImageView alloc] initWithImage:subimage];
        [hud hideAnimated:YES afterDelay:dismissTime];
        
    });
    return hud;
}

+(MBProgressHUD*)hyg_showFailMessageWithString:(NSString*)str andImage:(UIImage*)image{
    __block MBProgressHUD *hud;
    dispatch_async(dispatch_get_main_queue(), ^{
        hud=[MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
        hud.mode = MBProgressHUDModeCustomView;
        hud.bezelView.layer.cornerRadius=10;
        hud.bezelView.color=[UIColor colorWithWhite:0 alpha:fuzzyAlpha];
        hud.label.text =str;
        hud.label.numberOfLines=0;
        hud.label.font=[UIFont systemFontOfSize:fontSize];
        hud.label.textColor=[UIColor blackColor];
        NSBundle *bundle = [NSBundle bundleForClass:[MBProgressHUD class]];
        NSURL *url = [bundle URLForResource:@"MBProgressHUD" withExtension:@"bundle"];
        NSBundle *imageBundle = [NSBundle bundleWithURL:url];
        UIImage*subimage;
        if (!image) {
            subimage=[UIImage imageWithContentsOfFile:[imageBundle pathForResource:@"error" ofType:@"png"]];
        }else{
            subimage=image;
        }
        hud.customView = [[UIImageView alloc] initWithImage:subimage];
        [hud hideAnimated:YES afterDelay:dismissTime];
    });
    return hud;
}

@end
