//
//  WaitView.h
//  
//
//  Created by 侯英格 on 15/10/20.
//
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CustomViewType) {
    Empty=0,
    Text,
    ImageAndText,
    ImageAndTextAndBtn,
};


@interface HYGWaitView : UIView

//三段式

/**hud图片*/
@property(nonatomic,strong)UIImageView*waitImageView;

/**hud文字*/
@property(nonatomic,strong)UILabel*waitLab;

/**hud按钮*/
@property(nonatomic,strong)UIButton*waitBtn;

-(HYGWaitView*)initWithViewController:(UIViewController*)vc;

-(void)addCustomViewWithType:(CustomViewType)viewType;

-(void)showWithView:(UIView*)view;

-(void)hide;

typedef void (^waitViewCallBack)();
/**回调的block*/
@property(nonatomic,copy)waitViewCallBack block;

@end


/*
 [self.waitView addCustomViewWithType:Empty];
 self.waitView.waitLab.text=@"阿拉啦啦啦啦啦啦啦啦";
 self.waitView.waitImageView.image=[UIImage imageNamed:@"cvb"];
 self.waitView.block=^(){
 NSLog(@"1");
 };
 */
