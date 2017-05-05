//
//  GoodsTableViewCell.m
//  TestLocalNotification
//
//  Created by 陈世豪 on 16/8/12.
//  Copyright © 2016年 陈世豪. All rights reserved.
//

#import "GoodsTableViewCell.h"

@implementation GoodsTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
}
-(void)setModel:(GoodsModel *)model{
    _model=model;
    self.textLabel.text=model.title;
    
}
+(GoodsTableViewCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID=@"goodCell";
    GoodsTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell=[[GoodsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

}

@end
