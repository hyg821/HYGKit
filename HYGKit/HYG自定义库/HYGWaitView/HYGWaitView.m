//
//  WaitView.m
//  
//
//  Created by 侯英格 on 15/10/20.
//
//

#import "HYGWaitView.h"
#import "HYGToolDefine.h"

@interface HYGWaitView()
@property(nonatomic,assign)CustomViewType viewType;
@end

@implementation HYGWaitView

-(void)showWithView:(UIView*)view{
    [view addSubview:self];
    [view bringSubviewToFront:self];
}

-(void)hide{
    [self removeFromSuperview];
}

-(HYGWaitView*)initWithViewController:(UIViewController*)vc{
    self=[super init];
    if (vc.navigationController) {
        if (vc.navigationController.navigationBar.hidden==NO&&vc.automaticallyAdjustsScrollViewInsets==YES) {
            self.frame=CGRectMake(0, vc.navigationController.navigationBar.frame.size.height+20, vc.view.frame.size.width, vc.view.frame.size.height-vc.navigationController.navigationBar.frame.size.height-20);
        }else{
            self.frame=vc.view.bounds;
        }
    }else{
        self.frame=vc.view.bounds;
    }
    [self showWithView:vc.view];
    return self;
}

-(void)addCustomViewWithType:(CustomViewType)viewType{
    if (self.viewType==viewType) {
        return;
    }else{
        self.viewType=viewType;
        if (self.subviews.count!=0) {
            for (UIView*view in self.subviews) {
                [view removeFromSuperview];
                self.waitImageView=nil;
                self.waitBtn=nil;
                self.waitLab=nil;
            }
        }else{
            switch (self.viewType) {
                case Text:
                {
                    //只有文字
                    [self hyg_text];
                }
                    break;
                case ImageAndText:
                {
                    //图片+文字
                    [self hyg_imageAndText];
                }
                    break;
                case ImageAndTextAndBtn:
                {
                    //图片+文字+按钮
                    [self hyg_imageAndTextAndBtn];
                }
                    break;
                    
                default:
                    break;
            }
        }
    }
}


-(void)hyg_text{
    [self waitLab];
    self.waitLab.frame=CGRectMake(20, self.frame.size.height/3, self.frame.size.width-40, 40);
    self.waitLab.text=@"暂无数据";
}

-(void)hyg_imageAndText{
    [self waitImageView];
    self.waitLab.frame=CGRectMake(20, _waitImageView.frame.size.height+_waitImageView.frame.origin.y+15, self.frame.size.width-40, 40);
}

-(void)hyg_imageAndTextAndBtn{
    [self waitImageView];
    [self waitLab];
    self.waitLab.frame=CGRectMake(20, _waitImageView.frame.size.height+_waitImageView.frame.origin.y+15, self.frame.size.width-40, 40);
    self.waitBtn.center=CGPointMake(self.center.x, self.waitLab.frame.origin.y+self.waitLab.frame.size.height+30);
    self.waitBtn.bounds=CGRectMake(0, 0, 100, 40);
    
}

-(CustomViewType)viewType{
    if (!_viewType) {
        _viewType=Empty;
    }
    return _viewType;
}

-(UIImageView *)waitImageView{
    if (!_waitImageView) {
        _waitImageView=[[UIImageView alloc] init];
        _waitImageView.center=CGPointMake(self.center.x, self.center.y-self.frame.size.height/3);
        _waitImageView.bounds=CGRectMake(0, 0, 150, 150);
        [self addSubview:_waitImageView];
    }
    return _waitImageView;
}

-(UILabel *)waitLab{
    if (!_waitLab) {
        _waitLab=[[UILabel alloc] init];
        _waitLab.textAlignment=NSTextAlignmentCenter;
        _waitLab.font=[UIFont systemFontOfSize:17];
        _waitLab.textColor=HYGCOLOR(200, 200, 200, 1);
        _waitLab.numberOfLines=0;
        [self addSubview:_waitLab];
    }
    return _waitLab;
}

-(UIButton *)waitBtn{
    if (!_waitBtn) {
        _waitBtn=[[UIButton alloc] init];
        [_waitBtn addTarget:self action:@selector(clickCallBack) forControlEvents:UIControlEventTouchUpInside];
        _waitBtn.layer.masksToBounds=YES;
        _waitBtn.layer.cornerRadius=20;
        _waitBtn.layer.borderWidth=1;
        _waitBtn.layer.borderColor=[UIColor yellowColor].CGColor;
        _waitBtn.backgroundColor=[UIColor clearColor];
        [_waitBtn setTitle:@"重新加载" forState:UIControlStateNormal];
        [_waitBtn setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
        [self addSubview:_waitBtn];
    }
    return _waitBtn;
}

-(void)clickCallBack{
    if (self.block) {
        self.block();
    }
}


@end
