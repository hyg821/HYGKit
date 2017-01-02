//
//  TransactionTitleView.h
//  Yipuhui
//
//  Created by 侯英格 on 15/11/11.
//  Copyright © 2015年 YPH—HAN. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^indexBlock)(NSInteger index);

@interface HYGTitleView : UIView
@property(nonatomic,copy)NSString*titleStr;
@property(nonatomic,strong)UILabel*titleLab;
@property(nonatomic,strong)UIImageView*titleImageView;

@property(nonatomic,strong)UIColor*colorStyle;

/**是否旋转箭头图片yes是正 no是反*/
@property(nonatomic,assign)BOOL isRotat;
/**蒙版button*/
@property(nonatomic,strong)UIButton*maskButton;
/**蒙版选择的tableview*/
@property(nonatomic,strong)UITableView*maskTableView;
/**tableview需要的数组*/
@property(nonatomic,strong)NSArray*maskTableArray;
/**回调的block*/
@property(nonatomic,copy)indexBlock block;
/**最开始的选择*/
@property(nonatomic,assign)NSInteger startSelectCellIndex;
+(HYGTitleView*)creatTitleWithTitle:(NSString*)title andVC:(UIViewController*)vc WithMaskTableArray:(NSArray*)maskTableArray withSelectCellIndex:(NSInteger)selectCellIndex andColor:(UIColor*)colorStyle withReturnIndex:(indexBlock)index;

/*
  [HYGTitleView creatTitleWithTitle:@"啦啦啦啦" andVC:self WithMaskTableArray:@[@"x1",@"x2",@"x3"] withSelectCellIndex:0  andColor:[UIColor redColor] withReturnIndex:nil];
 */

@end
