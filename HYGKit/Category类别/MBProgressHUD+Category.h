//
//  MBProgressHUD+Category.h
//  HYG外带全家桶
//
//  Created by 侯英格 on 16/6/28.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Category)

/**只显示字体 居中 默认1.75s之后消失*/
+(MBProgressHUD*)hyg_showMessageWithString:(NSString*)str;

/**显示默认的转圈view*/
+(MBProgressHUD*)hyg_showWaitView;
/**隐藏hudview*/
+(void)hyg_hideWaitView;

/**显示成功的自定义view*/
+(MBProgressHUD*)hyg_showSuccessMessageWithString:(NSString*)str andImage:(UIImage*)image;
/**显示失败的自定义view*/
+(MBProgressHUD*)hyg_showFailMessageWithString:(NSString*)str andImage:(UIImage*)image;
@end
