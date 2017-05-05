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

-(instancetype)initWithSectionArray:(NSArray <TitleModel *>*)sectionArray;

@property (nonatomic,strong) NSArray <TitleModel *>*sectionArray;

@property (nonatomic,assign)CGFloat leftMenuWidth;

-(void)reloadView:(MenuViewReloadType)viewType;
@end
