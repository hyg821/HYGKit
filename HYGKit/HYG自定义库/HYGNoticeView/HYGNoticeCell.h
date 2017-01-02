//
//  HYGNoticeCell.h
//  HYGNoticeView
//
//  Created by 侯英格 on 16/2/26.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYGNoticeCell : UITableViewCell
/**内容lab*/
@property (weak, nonatomic) IBOutlet UILabel *noticeLab;
/**创建方法*/
+(HYGNoticeCell*)creatCellWithTableView:(UITableView*)tableView andIdentifier:(NSString*)identifier;
@end
