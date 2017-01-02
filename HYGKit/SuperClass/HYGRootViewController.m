//
//  HYGRootViewController.m
//  网络库
//
//  Created by 侯英格 on 16/6/24.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import "HYGRootViewController.h"

@implementation HYGViewControllerInfo

-(NSMutableDictionary *)storyBoardInfoDic{
    if (!_storyBoardInfoDic) {
        _storyBoardInfoDic=[[NSMutableDictionary alloc] init];
    }
    return _storyBoardInfoDic;
}

-(NSMutableDictionary *)xibInfoDic{
    if (!_xibInfoDic) {
        _xibInfoDic=[[NSMutableDictionary alloc] init];
    }
    return _xibInfoDic;
}

-(NSMutableDictionary *)codeInfoDic{
    if (!_codeInfoDic) {
        _codeInfoDic=[[NSMutableDictionary alloc] init];
    }
    return _codeInfoDic;
}

@end

@implementation UIViewController (TransitionCategory)

+(void)transitionFromViewController:(UIViewController*)fromVC jumpToViewController:(UIViewController*)toVC with:(UIViewControllerJumpType)jumpType{
    if (fromVC&&toVC)
    {
        if (jumpType==Present)
        {
            if (!toVC.navigationController)
            {
                UINavigationController*navigationVC=[[UINavigationController alloc] initWithRootViewController:toVC];
                [fromVC presentViewController:navigationVC animated:YES completion:nil];
            }
            
            else
            {
                [fromVC presentViewController:toVC animated:YES completion:nil];
            }
            
        }
        else if (jumpType==Push)
        {
            if (fromVC.navigationController)
            {
                [fromVC.navigationController pushViewController:toVC animated:YES];
            }
        }
    }
}

@end

@interface HYGRootViewController ()

@end

@implementation HYGRootViewController

-(instancetype)init{
    self=[super init];
    [self prepareForInit];
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];
    [self prepareForInit];
    return self;
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    [self prepareForInit];
    return self;
}

/**控制器初始化基本准备*/
-(void)prepareForInit{
    self.isNeedHideNavigationBar=NO;
}

+(instancetype)creatViewControllerWithInfo:(HYGViewControllerInfo*)viewControllerInfo andParams:(NSDictionary*)paramsDic{
    HYGRootViewController*vc;
    switch (viewControllerInfo.type) {
        //从代码创建
        case FromCode:
        {
            vc=[[self alloc] init];
        }
            break;
        //从xib创建
        case FromXib:
        {
            //基本自己写不会出现这种情况 就先不做判断了
        }
            break;
        //从storyBoard创建
        case FromStoryBoard:
        {
            //最常用的一种方法
            NSString*storyboardName=[viewControllerInfo.storyBoardInfoDic objectForKey:@"storyboardName"];
            NSString*identifier=[viewControllerInfo.storyBoardInfoDic objectForKey:@"identifier"];
            UIStoryboard*story=[UIStoryboard storyboardWithName:storyboardName bundle:nil];
            vc=[story instantiateViewControllerWithIdentifier:identifier];
        }
            break;
            
        default:
            break;
    }
    if (paramsDic) {
        vc.paramsDic=paramsDic;
    }
    return vc;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self doSomethingWithWillAppear];
}

-(void)doSomethingWithWillAppear{
    //每一个控制器只在viewWillAppear控制一次 navigationBar的显示与消失 默认都是显示的
    if (self.isNeedHideNavigationBar==YES) {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }else{
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self doSomethingWithWillDisappear];
}

-(void)doSomethingWithWillDisappear{
//    if (self.isNeedHideNavigationBar==YES) {
//        [self.navigationController setNavigationBarHidden:NO animated:NO];
//    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatBaseData];
    [self creatUI];
    [self creatWebReq];
}

/**初始化基本数据*/
-(void)creatBaseData{
}

/**创建视图*/
-(void)creatUI{
    self.view.backgroundColor=[UIColor whiteColor];
}

/**发起网络请求*/
-(void)creatWebReq{
}

/**刷新数据*/
-(void)updateUI{
    
}

-(HYGWaitView *)waitView{
    if (!_waitView) {
        _waitView=[[HYGWaitView alloc] initWithViewController:self];
    }
    return _waitView;
}

#pragma mark setter && getter方法

-(void)setParamsDic:(NSDictionary *)paramsDic{
    _paramsDic=paramsDic;
}

-(NSMutableArray *)taskArray{
    if (!_taskArray) {
        _taskArray=[NSMutableArray array];
    }
    return _taskArray;
}


-(void)dealloc{
    for (NSURLSessionDataTask*task in self.taskArray) {
        [task cancel];
    }
}

@end
