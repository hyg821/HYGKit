//
//  HYGNoticeView.h
//  HYGNoticeView
//
//  Created by 侯英格 on 16/2/26.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^callBackBlock)(NSString*index);
//目前只提供xib创建方式 
@interface HYGNoticeView : UIView

/**通知数组*/
@property(nonatomic,strong)NSMutableArray*noticeArray;
@property(nonatomic,copy)callBackBlock block;

/**开始滚动*/
-(void)startScroll;
/**停止滚动*/
-(void)stopScroll;
/**点击回调方法*/
-(void)didSelectNotice:(callBackBlock)block;

@end


//用法
/*
    [self.noticeView didSelectNotice:^(NSString *url) {
        NSLog(@"%@",url);
    }];
    self.noticeView.noticeArray=nil;
    [self.noticeView startScroll];
*/

