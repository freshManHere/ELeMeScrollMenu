//
//  ItemListTableView.h
//  TestLocalNotification
//
//  Created by 陈世豪 on 16/8/12.
//  Copyright © 2016年 陈世豪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TitleModel.h"
@class ItemListTableView;
@protocol ItemListTableViewDelegate <NSObject>


/**
 滚动的代理

 @param index 滚动到的index
 @param isLeftMake 是不是点击左边listView致使的滚动
 */
-(void)scrollWithIndex:(NSInteger)index isLeftMakeScroll:(BOOL)isLeftMake;
@end
@interface ItemListTableView : UITableView

/**
 数据源数组
 */
@property(nonatomic,strong)NSArray <TitleModel *>*dataArray;

@property(nonatomic,weak)id<ItemListTableViewDelegate>listDelegate;

/**
 选中的index 如果要主动选中，直接设置这个就好
 */
@property(nonatomic,assign)NSInteger selectedIndex;
@end
