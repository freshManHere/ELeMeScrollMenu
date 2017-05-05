//
//  LeftListTableView.h
//  TestLocalNotification
//
//  Created by 陈世豪 on 16/8/12.
//  Copyright © 2016年 陈世豪. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LeftListTableView;
@protocol LeftListTableViewDelegate<NSObject>

-(void)leftListTableViewDidSelectedIndex:(NSInteger)index;

@end
@interface LeftListTableView : UITableView

@property(nonatomic,strong)NSArray *dataArray;

@property(nonatomic,assign)NSInteger selectedIndex;

@property(nonatomic,weak)id<LeftListTableViewDelegate>selectedDelegate;
@end
