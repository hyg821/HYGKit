//
//  HYGPageVC.h
//  
//
//  Created by 侯英格 on 15/12/3.
//
//

#import <UIKit/UIKit.h>
@interface HYGPageVC : UIViewController
/**我的标题*/
@property(nonatomic,copy)NSString*myTitle;
/**选择跳转到的页面*/
@property(nonatomic,assign)NSInteger pageIndex;
/**子控制器数组*/
@property(nonatomic,strong)NSArray*controllerArray;
/**初始化方法*/
-(instancetype)initWithControllerArray:(NSArray*)controllerArray;
@end


/*
 UIStoryboard*story=[UIStoryboard storyboardWithName:@"MyInvestmentrStoryboard" bundle:nil];
 MyInvestmentViewController*controller= [story instantiateViewControllerWithIdentifier:@"MyInvestmentViewController"];
 controller.title=@"亿计划";
 
 
 UIStoryboard*story1=[UIStoryboard storyboardWithName:@"MyStandardPowderInvestmentController" bundle:nil];
 MyStandardPowderInvestmentController*controller1= [story1 instantiateViewControllerWithIdentifier:@"MyStandardPowderInvestmentController"];
 controller1.title=@"散标直投";
 
 
 UIStoryboard*story2=[UIStoryboard storyboardWithName:@"MyExperienceInvestment" bundle:nil];
 MyExperienceInvestment*controller2= [story2 instantiateViewControllerWithIdentifier:@"MyExperienceInvestment"];
 controller2.title=@"体验标";
 
 
 HYGPageVC*vc=[[HYGPageVC alloc] initWithControllerArray:@[controller,controller1,controller2]];
 vc.myTitle=@"我的投资";
 vc.hidesBottomBarWhenPushed=YES;
 [self.navigationController pushViewController:vc animated:YES];
 */