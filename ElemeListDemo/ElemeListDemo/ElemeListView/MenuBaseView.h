//
//  MenuBaseView.h
//  TestLocalNotification
//
//  Created by 陈世豪 on 2017/4/26.
//  Copyright © 2017年 陈世豪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TitleModel.h"
typedef NS_ENUM(NSInteger,MenuViewReloadType)
{
    MenuViewReloadTypeLeftView,
    MenuViewReloadTypeItemListView,
    MenuViewReloadTypeAll
};
@class MenuBaseView;

@protocol MenuBaseViewDelegate <NSObject>

@end
@interface MenuBaseView : UIView

/**
 用一个数组初始化

 @param sectionArray 数据源数组
 */
-(instancetype)initWithSectionArray:(NSArray <TitleModel *>*)sectionArray;

/**
 数据源数组
 */
@property (nonatomic,strong) NSArray <TitleModel *>*sectionArray;

/**
 左边列表的宽度 默认为60
 */
@property (nonatomic,assign)CGFloat leftMenuWidth;


/**
 刷新列表

 @param viewType 列表类型（左，右，全）
 */
-(void)reloadView:(MenuViewReloadType)viewType;
@end
