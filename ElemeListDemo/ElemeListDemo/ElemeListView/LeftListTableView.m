//
//  LeftListTableView.m
//  TestLocalNotification
//
//  Created by 陈世豪 on 16/8/12.
//  Copyright © 2016年 陈世豪. All rights reserved.
//

#import "LeftListTableView.h"
#import "LeftCell.h"
@interface LeftListTableView()<UITableViewDataSource,UITableViewDelegate>

@end
@implementation LeftListTableView


-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self=[super initWithFrame:frame style:style]) {
        self.dataSource=self;
        self.delegate=self;
    }
    return self;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LeftCell *cell=[LeftCell cellWithTableView:tableView];
    cell.model=self.dataArray[indexPath.row];

    
    
    return cell;
}
-(void)setSelectedIndex:(NSInteger)selectedIndex
{
    _selectedIndex=selectedIndex;
    [self selectRowAtIndexPath:[NSIndexPath indexPathForRow:selectedIndex inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.selectedDelegate respondsToSelector:@selector(leftListTableViewDidSelectedIndex:)])
    {
        [self.selectedDelegate leftListTableViewDidSelectedIndex:indexPath.row];
    }
}

@end
