//
//  GoodsTableViewCell.h
//  TestLocalNotification
//
//  Created by 陈世豪 on 16/8/12.
//  Copyright © 2016年 陈世豪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsModel.h"
@interface GoodsTableViewCell : UITableViewCell

@property(nonatomic,strong)GoodsModel *model;

+(GoodsTableViewCell *)cellWithTableView:(UITableView *)tableView;

@end
