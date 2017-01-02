//
//  HYGPageVC.m
//  
//
//  Created by 侯英格 on 15/12/3.
//
//

#import "HYGPageVC.h"
#import "HYGToolDefine.h"


@interface HYGPageVC ()<UIScrollViewDelegate>
/**最上边选项条的背景view*/
@property(nonatomic,strong)UIView*pageBackgroundView;
/**选项条下边的指示view*/
@property(nonatomic,strong)UIView*indicateView;
/**偏移指示view*/
@property(nonatomic,strong)UIView*pageLineView;

@property(nonatomic,strong)UIScrollView*scrollView;

@property(nonatomic,strong)NSMutableArray*buttonArray;
@end


@implementation HYGPageVC

-(instancetype)init{
    self=[super init];
    if (self) {
        [self creatDefault];
        [self createWithControllerArray:nil];
    }
    return self;
}

-(instancetype)initWithControllerArray:(NSArray*)controllerArray{
    self=[super init];
    if (self) {
         self.controllerArray=controllerArray;
        [self creatDefault];
        [self createWithControllerArray:controllerArray];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];
    if (self) {
        [self creatDefault];
        [self createWithControllerArray:nil];
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.title=self.myTitle;
}

-(void)viewDidLoad{
    [super viewDidLoad];
}

-(void)creatDefault{
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor=[UIColor whiteColor];
}

-(void)createWithControllerArray:(NSArray*)controllerArray{
    [self creatTopBar];
    [self setChildViewController];
}

-(void)creatTopBar{
    [self.view addSubview:self.pageBackgroundView];
    [self.view addSubview:self.scrollView];
}

-(void)setChildViewController{
    [self.controllerArray enumerateObjectsUsingBlock:^(id  obj, NSUInteger idx, BOOL *  stop) {
        UIViewController*vc=(UIViewController*)obj;
        [self addChildViewController:vc];
        UIView*view=[self.scrollView viewWithTag:idx];
        vc.view.frame=CGRectMake(0,0,UIW,UIH-45-64);
        [view addSubview:vc.view];
    }];
    
}



-(void)setPageIndex:(NSInteger)pageIndex{
    _pageIndex=pageIndex;
    [self reSetPageLineView:pageIndex];
}

-(void)reSetPageLineView:(NSInteger)pageIndex{
    [_scrollView setContentOffset:CGPointMake(UIW*self.pageIndex, 0) animated:YES];
    [self setBtnHightWithIndex:pageIndex];
    
}

-(void)setBtnHightWithIndex:(NSInteger)pageIndex{
    for (UIButton*btn in self.buttonArray) {
        if (btn.tag==pageIndex) {
            [btn setTitleColor:[UIColor colorWithRed:255/255.0 green:102/255.0 blue:0/255.0 alpha:1] forState:UIControlStateNormal];
        }
        else{
            [btn setTitleColor:HYGCOLOR(102, 102, 102, 1) forState:UIControlStateNormal];
        }
    }
}


-(UIView *)pageBackgroundView{
    if (!_pageBackgroundView) {
        _pageBackgroundView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, UIW, 45)];
        _pageBackgroundView.backgroundColor=[UIColor whiteColor];
        
        UIView*lineView=[[UIView alloc] initWithFrame:CGRectMake(0, 45-0.5, UIW, 0.5)];
        lineView.backgroundColor=[UIColor colorWithRed:178/255.0 green:178/255.0 blue:178/255.0 alpha:1];
        
        self.pageLineView=[[UIView alloc] initWithFrame:CGRectMake(0, 45-1, UIW/self.controllerArray.count, 1)];
        self.pageLineView.backgroundColor=[UIColor colorWithRed:255/255.0 green:102/255.0 blue:0/255.0 alpha:1];
        
        UIImageView*fenyesanjiao=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fenyesanjiao"]];
        fenyesanjiao.center=CGPointMake(self.pageLineView.frame.size.width/2-2.5, -2.5);
        fenyesanjiao.bounds=CGRectMake(0, 0, 10, 5);
        
        [self.pageLineView addSubview:fenyesanjiao];
        [_pageBackgroundView addSubview:lineView];
        [_pageBackgroundView addSubview:self.pageLineView];
        
        for (int i=0; i<self.controllerArray.count; i++) {
            UIViewController*vc= [self.controllerArray objectAtIndex:i];
            UIButton*btn=[[UIButton alloc] initWithFrame:CGRectMake(i*UIW/self.controllerArray.count, 0, UIW/self.controllerArray.count, _pageBackgroundView.frame.size.height)];
            btn.titleLabel.font=[UIFont systemFontOfSize:15];
            [btn setTitle:vc.title forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            if (i==self.pageIndex) {
                 [btn setTitleColor:[UIColor colorWithRed:255/255.0 green:102/255.0 blue:0/255.0 alpha:1] forState:UIControlStateNormal];
            }
            else{
               [btn setTitleColor:HYGCOLOR(102, 102, 102, 1) forState:UIControlStateNormal];
            }
            
            [btn addTarget:self action:@selector(pageBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag=i;
            
            [self.buttonArray addObject:btn];
            [_pageBackgroundView addSubview:btn];
        }
    }
    return _pageBackgroundView;
}

-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, self.pageBackgroundView.frame.size.height, UIW, UIH-64-self.pageBackgroundView.frame.size.height)];
        _scrollView.delegate=self;
        _scrollView.showsHorizontalScrollIndicator=NO;
        _scrollView.showsVerticalScrollIndicator=NO;
        _scrollView.backgroundColor=[UIColor whiteColor];
        _scrollView.pagingEnabled=YES;
        _scrollView.bounces=NO;
        _scrollView.contentSize=CGSizeMake(UIW*self.controllerArray.count, _scrollView.frame.size.height);
        for (int i=0; i<self.controllerArray.count; i++) {
            UIView*view=[[UIView alloc] initWithFrame:CGRectMake(i*UIW, 0, UIW, _scrollView.frame.size.height)];
            view.tag=i;
            view.backgroundColor=[UIColor whiteColor];
            [_scrollView addSubview:view];
        }
    }
    return _scrollView;
}

-(NSMutableArray *)buttonArray{
    if (!_buttonArray) {
        _buttonArray=[NSMutableArray array];
    }
    return _buttonArray;
}

-(void)setControllerArray:(NSArray *)controllerArray{
    if (controllerArray) {
        _controllerArray=controllerArray;
    }
    
}

-(void)pageBtnClick:(UIButton*)btn{
    self.pageIndex=btn.tag;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint offsize= scrollView.contentOffset;
    self.pageLineView.frame=CGRectMake(offsize.x/self.controllerArray.count, 45-1, UIW/self.controllerArray.count, 1);
    for (UIButton*btn in self.buttonArray) {
        if (self.pageLineView.center.x<=btn.frame.origin.x+btn.frame.size.width&&self.pageLineView.center.x>=btn.frame.origin.x) {
            [btn setTitleColor:[UIColor colorWithRed:255/255.0 green:102/255.0 blue:0/255.0 alpha:1] forState:UIControlStateNormal];

        }
        else{
            [btn setTitleColor:HYGCOLOR(102, 102, 102, 1) forState:UIControlStateNormal];
        }
    }
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    self.pageIndex=scrollView.contentOffset.x/UIW;
}


@end
