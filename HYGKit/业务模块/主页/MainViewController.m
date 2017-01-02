//
//  MainViewController.m
//  SzfyTradingPlatform
//
//  Created by 侯英格 on 16/7/15.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import "MainViewController.h"


@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation MainViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setNavigationBarColorWithTitleColor:[UIColor greenColor] andBarColor:[UIColor orangeColor] andItemColor:[UIColor redColor] andIsNeedAnimation:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"哇哈哈";
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"嘻嘻" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"静态动态混合" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    [HYGTitleView creatTitleWithTitle:@"啦啦啦啦" andVC:self WithMaskTableArray:@[@"x1",@"x2",@"x3"] withSelectCellIndex:0  andColor:[UIColor redColor] withReturnIndex:nil];
    
    
    [MBProgressHUD hyg_showSuccessMessageWithString:@"what?" andImage:nil];
   
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:@"http://pic29.nipic.com/20130508/9252150_163600489317_2.jpg"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        NSLog(@"%@",image);
        NSLog(@"%@",error);
    }];
    
    

}

-(void)back{
    HYGhttpRequestHeader*header=[HYGhttpRequestHeader new];
    header.requestAddress=APP_BASIC_HTTPURL;
    header.requestURL=APP_BASIC_USER;
    header.requestCode=@"A01002";
    header.isNeedShowHud=NO;
    [SzfyHttpService startLoginWithRequestHeader:header andViewController:self andSuccess:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSLog(@"%@",responseObject);
        
    } andFail:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [MBProgressHUD hyg_showSuccessMessageWithString:@"成功了吗" andImage:nil];
}

@end
