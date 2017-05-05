//
//  leftCell.m
//  TestLocalNotification
//
//  Created by 陈世豪 on 16/8/12.
//  Copyright © 2016年 陈世豪. All rights reserved.
//

#import "LeftCell.h"
@interface LeftCell()
@property(nonatomic,weak)UIView *selectedView;
@end
@implementation LeftCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIView *selectedView = [[UIView alloc]init];
        selectedView.backgroundColor=[UIColor redColor];
        self.selectedView=selectedView;
        self.selectedBackgroundView=self.selectedView;
    }
    return self;
}
+(LeftCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID=@"leftCell";
    LeftCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell)
    {
        cell=[[LeftCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

-(void)setModel:(TitleModel *)model
{
    _model=model;
    self.textLabel.font=[UIFont systemFontOfSize:9];
    self.textLabel.text=model.title;
    self.textLabel.numberOfLines=0;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.selectedView.frame = CGRectMake(0,
                                         0,
                                         5,
                                         self.frame.size.height);
}

@end
