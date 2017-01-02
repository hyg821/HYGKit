//
//  TransactionTitleView.m
//  Yipuhui
//
//  Created by 侯英格 on 15/11/11.
//  Copyright © 2015年 YPH—HAN. All rights reserved.
//

#import "HYGTitleView.h"
#import "HYGToolDefine.h"

@interface HYGTitleView ()<UIGestureRecognizerDelegate,UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,weak)UIViewController*vc;
@end

@implementation HYGTitleView

+(HYGTitleView*)creatTitleWithTitle:(NSString*)title andVC:(UIViewController*)vc WithMaskTableArray:(NSArray*)maskTableArray withSelectCellIndex:(NSInteger)selectCellIndex andColor:(UIColor*)colorStyle withReturnIndex:(indexBlock)index {
    HYGTitleView*view= [[HYGTitleView alloc] initWithFrame:CGRectMake(0, 0, 150, 44)];
    view.maskTableArray=maskTableArray;
    view.startSelectCellIndex=selectCellIndex;
    view.titleStr=title;
    view.colorStyle=colorStyle;
    [view addTapgestures];
    [view creatUI];
    view.block=index;
    view.vc=vc;
    vc.navigationItem.titleView=view;
    return view;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    return self;
}



-(void)creatUI{
    self.isRotat=NO;
    self.backgroundColor=[UIColor clearColor];
    [self addSubview:self.titleLab];
    [self addSubview:self.titleImageView];
}

-(void)addTapgestures{
    UITapGestureRecognizer*tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    tap.delegate=self;
    [self addGestureRecognizer:tap];
}

-(void)tap:(UIGestureRecognizer*)tap{
    self.isRotat=!self.isRotat;
    [UIView animateWithDuration:0.4 animations:^{
        self.userInteractionEnabled=NO;
        self.titleImageView.transform = CGAffineTransformMakeRotation(self.isRotat*180 *M_PI / 180.0);
    } completion:nil];
    [UIView animateWithDuration:0.3 animations:^{
        [self addMaskViewWithViewController:self.vc];
    } completion:^(BOOL finished) {
     self.userInteractionEnabled=YES;
    }];
}

-(void)addMaskViewWithViewController:(UIViewController*)vc{
    if (self.isRotat==YES) {
        [self.vc.view addSubview:self.maskButton];
        [self.vc.view addSubview:self.maskTableView];
        [UIView animateWithDuration:0.3 animations:^{
            self.maskButton.alpha=0.4;
            CGRect rect=self.maskTableView.frame;
            rect.size.height=44*self.maskTableArray.count;
            self.maskTableView.frame=rect;
        } completion:nil];
    }
    else{
        [self dismisFormVC];
    }
}

-(void)dismisFormVC{
    [self readDismisVC];
}

-(void)readDismisVC{
    [UIView animateWithDuration:0.3 animations:^{
        self.titleImageView.transform = CGAffineTransformMakeRotation(self.isRotat*180 *M_PI / 180.0);
        self.maskButton.alpha=0;
        CGRect rect=self.maskTableView.frame;
        rect.size.height=0;
        self.maskTableView.frame=rect;
    } completion:^(BOOL finished) {
        [self.maskButton removeFromSuperview];
        //self.maskButton=nil;
        [self.maskTableView removeFromSuperview];
        //self.maskTableView=nil;
    }];
}


-(void)dismisFormVC1{
    self.isRotat=!self.isRotat;
    [self readDismisVC];
}


-(void)setColorStyle:(UIColor *)colorStyle{
    if (!colorStyle) {
        _colorStyle=[UIColor blackColor];
    }else{
        _colorStyle=colorStyle;
    }
}


-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab=[[UILabel alloc] init];
        _titleLab.textAlignment=NSTextAlignmentCenter;
        [_titleLab setFont:[UIFont fontWithName:@"HelveticaNeue-MediumItalic" size:17]];
        _titleLab.text=self.titleStr;
        CGSize textRect=[_titleLab sizeThatFits:CGSizeMake(999, 44)];
        _titleLab.center=self.center;
        _titleLab.bounds=CGRectMake(0, 0, textRect.width+20, 44);
    }
    return _titleLab;
}

-(UIImageView *)titleImageView{
    if (!_titleImageView) {
        _titleImageView=[[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.titleLab.frame)+self.titleLab.frame.origin.x, 17.5, 16, 9)];
        
        _titleImageView.layer.backgroundColor=self.colorStyle.CGColor;
        
        CAShapeLayer*layer=[[CAShapeLayer alloc] init];
        layer.bounds=_titleImageView.bounds;
        layer.anchorPoint=CGPointMake(0, 0);
        _titleImageView.layer.mask=layer;
        
        UIBezierPath*bezierPath=[[UIBezierPath alloc] init];
        [bezierPath moveToPoint:CGPointMake(0, 0)];
        [bezierPath addLineToPoint:CGPointMake(layer.bounds.size.width, 0)];
        [bezierPath addLineToPoint:CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height)];
        [bezierPath closePath];
        
        layer.path=bezierPath.CGPath;
        layer.fillColor=[UIColor yellowColor].CGColor;
        
    }
    return _titleImageView;
}

-(UIButton *)maskButton{
    if (!_maskButton) {
        _maskButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, UIW, UIH)];
        _maskButton.alpha=0;
        _maskButton.backgroundColor=[UIColor blackColor];
        [_maskButton addTarget:self action:@selector(dismisFormVC1) forControlEvents:UIControlEventTouchUpInside];
    }
    return _maskButton;
}


-(UITableView *)maskTableView{
    if (!_maskTableView) {
        _maskTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 64, UIW, 0) style:UITableViewStylePlain];
        _maskTableView.delegate=self;
        _maskTableView.dataSource=self;
        _maskTableView.scrollEnabled=NO;
    }
    return _maskTableView;
}

-(void)resetFrame{
    _titleLab.text=self.titleStr;
    CGSize textRect=[_titleLab sizeThatFits:CGSizeMake(999, 44)];
    _titleLab.bounds=CGRectMake(0, 0, textRect.width+20, 44);
    _titleImageView.frame=CGRectMake(CGRectGetWidth(self.titleLab.frame)+self.titleLab.frame.origin.x, 17.5, 16, 9);
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.maskTableArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString*name=@"cell";
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:name];
    if (!cell) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:name];
    }
    cell.textLabel.text=[self.maskTableArray objectAtIndex:indexPath.row];
    if (indexPath.row==self.startSelectCellIndex) {
        cell.accessoryType=UITableViewCellAccessoryCheckmark;
    }
    else{
        cell.accessoryType=UITableViewCellAccessoryNone;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.startSelectCellIndex=indexPath.row;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self dismisFormVC1];
    self.titleStr=[self.maskTableArray objectAtIndex:indexPath.row];
    [self resetFrame];
    if (self.block) {
        self.block(indexPath.row);
    }
    [tableView reloadData];
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
