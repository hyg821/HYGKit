//
//  HYGListView.h
//  HYGListView
//
//  Created by 侯英格 on 16/5/24.
//  Copyright © 2016年 侯英格. All rights reserved.
//


/*
    HYGListView 仅适用于 手写代码 tableview 难以复用的情况 抛弃了协议代理方式
    自己管理自己的view  十分简单
    
    特点是cell不复用 适合那种不规则 但是需要手写代码 频繁 增删修改view的情况
 
 */


#import <UIKit/UIKit.h>

@interface UIView (Addition)
@property(nonatomic,strong)NSNumber* oldHeight;
@end


@interface HYGListView : UIScrollView
@property(nonatomic,strong)NSMutableArray*viewArray;
@property(nonatomic,assign)BOOL cellIsNeedsize;

/**初始化方法*/
-(HYGListView*)initWithViewArray:(NSMutableArray*)viewArray;

/**修改viewArray*/
-(void)setViewArray:(NSMutableArray *)viewArray;
/**修改viewArray 带动画*/
-(void)setViewArray:(NSMutableArray *)viewArray andAnimation:(BOOL)animation;

/**刷新list列表 带动画*/
-(void)reloadSizeWithAnimation:(BOOL)animation;
/**刷新列表*/
-(void)reloadSize;

/**增加一个view在某一行*/
-(void)addView:(UIView*)view WithRow:(NSInteger)row andAnimation:(BOOL)animation;
/**删除某一行的view*/
-(void)deleteRow:(NSInteger)row;
/**删除某一个view*/
-(void)deleteView:(UIView*)view;

/**隐藏某一行*/
-(void)hidenRow:(NSInteger)row;
/**隐藏某一个view*/
-(void)hidenView:(UIView*)view;

/**隐藏某一行*/
-(void)showRow:(NSInteger)row;
/**隐藏某一个view*/
-(void)showView:(UIView*)view;

/**滚动到某一行*/
-(void)scrollToRow:(NSInteger)row;
/**滚动到某一个view*/
-(void)scrollToView:(UIView*)view;

@end

/*
 NSMutableArray*array=[NSMutableArray array];
 for (int i=0; i<150; i++) {
 int c=0;
 if (i%2==0) {
 c=100;
 }else{
 c=75;
 }
 
 UIView*view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, c)];
 view.backgroundColor=[UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
 UILabel*lab=[[UILabel alloc] initWithFrame:view.bounds];
 lab.font=[UIFont systemFontOfSize:30];
 lab.text=[NSString stringWithFormat:@"%d",i];
 lab.textAlignment=NSTextAlignmentCenter;
 [view addSubview:lab];
 [array addObject:view];
 }
 self.listView=[[HYGListView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
 [self.listView setViewArray:array andAnimation:YES];
 [self.view addSubview:self.listView];
 */
