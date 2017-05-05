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

-(void)scrollWithIndex:(NSInteger)index isLeftMakeScroll:(BOOL)isLeftMake;
@end
@interface ItemListTableView : UITableView

@property(nonatomic,strong)NSArray <TitleModel *>*dataArray;

@property(nonatomic,weak)id<ItemListTableViewDelegate>listDelegate;

@property(nonatomic,assign)NSInteger selectedIndex;
@end
