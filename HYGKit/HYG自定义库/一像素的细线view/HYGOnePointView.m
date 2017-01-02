//
//  onePointView.m
//  Yipuhui
//
//  Created by 侯英格 on 16/5/3.
//  Copyright © 2016年 亿谱汇理财. All rights reserved.
//

#import "HYGOnePointView.h"
#import "HYGToolDefine.h"

@implementation HYGOnePointView

-(void)awakeFromNib{
    [super awakeFromNib];
    [self prepareForInit];
}

-(instancetype)init{
    self=[super init];
    [self prepareForInit];
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    [self prepareForInit];
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];
    [self prepareForInit];
    return self;
}

-(void)prepareForInit{
    self.backgroundColor=HYGCOLOR(194, 193, 198, 1);
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat width= 1/[UIScreen mainScreen].scale;
    
    if (width>0.3&&width<0.5) {
        width=0.33;
    }
    
    if (self.frame.size.height<2) {
        self.frame=CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width,width);
    }
    
    if (self.frame.size.width<2) {
        self.frame=CGRectMake(self.frame.origin.x, self.frame.origin.y,width,self.frame.size.height);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
