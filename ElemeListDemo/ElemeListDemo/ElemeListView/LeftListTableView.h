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

/**
 点击代理

 @param index 点击的index
 */
-(void)leftListTableViewDidSelectedIndex:(NSInteger)index;

@end
@interface LeftListTableView : UITableView

/**
 数据源
 */
@property(nonatomic,strong)NSArray *dataArray;

/**
 选中的index
 */
@property(nonatomic,assign)NSInteger selectedIndex;

@property(nonatomic,weak)id<LeftListTableViewDelegate>selectedDelegate;
@end
