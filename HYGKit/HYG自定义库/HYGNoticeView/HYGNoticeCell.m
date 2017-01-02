//
//  HYGNoticeCell.m
//  HYGNoticeView
//
//  Created by 侯英格 on 16/2/26.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import "HYGNoticeCell.h"

@implementation HYGNoticeCell

+(HYGNoticeCell*)creatCellWithTableView:(UITableView*)tableView andIdentifier:(NSString*)identifier{
    HYGNoticeCell*cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"HYGNoticeCell" owner:self options:nil] firstObject];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    return cell;
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
