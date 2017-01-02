//
//  HYGNoticeView.m
//  HYGNoticeView
//
//  Created by 侯英格 on 16/2/26.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import "HYGNoticeView.h"
#import "HYGNoticeCell.h"

static  NSString*noMoreNoticeStr=@"暂无通知";

@interface HYGNoticeView()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSTimer*timer;
@property(nonatomic,strong)UITableView*noticeTableView;
@property(nonatomic,assign)BOOL isFinishLayout;
@property(nonatomic,assign)NSInteger scrollToRowIndex;
@end

@implementation HYGNoticeView

-(void)awakeFromNib{
    [super awakeFromNib];
    self.isFinishLayout=NO;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    if (self.isFinishLayout==NO) {
        self.isFinishLayout=YES;
        [self layout];
    }
}

-(void)didSelectNotice:(callBackBlock)block{
    self.block=block;
}

-(void)setNoticeArray:(NSMutableArray *)noticeArray{
    [self stopScroll];
    if (!noticeArray||noticeArray.count==0) {
        _noticeArray=[NSMutableArray array];
        [_noticeArray addObject:noMoreNoticeStr];
        [self.noticeTableView reloadData];
        return;
    }else{
        _noticeArray=[noticeArray mutableCopy];
        [_noticeArray addObject:[noticeArray firstObject]];
        [self.noticeTableView reloadData];
    }
}

-(void)layout{
    self.noticeTableView.frame=self.bounds;
}

-(UITableView *)noticeTableView{
    if (!_noticeTableView) {
        _noticeTableView=[[UITableView alloc] init];
        _noticeTableView.delegate=self;
        _noticeTableView.dataSource=self;
        _noticeTableView.scrollEnabled=NO;
        _noticeTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        
        [self addSubview:_noticeTableView];
    }
    return _noticeTableView;
}

-(void)startScroll{
    if (!self.noticeArray||self.noticeArray.count==0||[self.noticeArray.firstObject isEqualToString:noMoreNoticeStr]) {
        return;
    }else{
        //启动定时器
        [self timer];
    }
}
-(void)stopScroll{
    self.scrollToRowIndex=0;
    self.noticeTableView.contentOffset=CGPointMake(0, 0);
    //暂停定时器
    [_timer invalidate];
    _timer=nil;
}

-(NSTimer *)timer{
    if (!_timer) {
        _timer=[NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(scrolling) userInfo:nil repeats:YES];
    }
    return _timer;
}

-(void)scrolling{
    self.scrollToRowIndex++;
    if (self.scrollToRowIndex==self.noticeArray.count) {
        self.scrollToRowIndex=0;
        NSIndexPath* indexPath = [NSIndexPath indexPathForRow:self.scrollToRowIndex inSection:0];
        [self.noticeTableView scrollToRowAtIndexPath:indexPath
                                    atScrollPosition:UITableViewScrollPositionBottom animated:NO];
        [self.timer fire];
    }
    else{
        NSIndexPath* indexPath = [NSIndexPath indexPathForRow:self.scrollToRowIndex inSection:0];
        [self.noticeTableView scrollToRowAtIndexPath:indexPath
                                    atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }
}

#pragma mark -----------tableView-delegate-----------
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.bounds.size.height;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.noticeArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString*name=@"HYGNoticeCell";
    HYGNoticeCell*cell =[HYGNoticeCell creatCellWithTableView:tableView andIdentifier:name];
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([NSStringFromClass([cell class]) isEqualToString:@"HYGNoticeCell"]) {
        HYGNoticeCell*hygCell=(HYGNoticeCell*)cell;
        hygCell.noticeLab.text=[self.noticeArray objectAtIndex:indexPath.row];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger indexRow;
    if (indexPath.row==self.noticeArray.count-1) {
        indexRow=0;
    }
    else{
        indexRow=indexPath.row;
    }
    if ([self.noticeArray.firstObject isEqualToString:noMoreNoticeStr]) {
        return;
    }else{
        self.block([NSString stringWithFormat:@"%ld",(long)indexRow]);
    }
   
}



@end
