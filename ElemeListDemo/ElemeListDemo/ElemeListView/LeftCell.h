//
//  leftCell.h
//  TestLocalNotification
//
//  Created by 陈世豪 on 16/8/12.
//  Copyright © 2016年 陈世豪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TitleModel.h"
@interface LeftCell : UITableViewCell

@property(nonatomic,strong)TitleModel *model;

+(LeftCell *)cellWithTableView:(UITableView *)tableView;

@end
