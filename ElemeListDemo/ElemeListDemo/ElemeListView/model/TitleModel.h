//
//  TitleModel.h
//  TestLocalNotification
//
//  Created by 陈世豪 on 16/8/12.
//  Copyright © 2016年 陈世豪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GoodsModel.h"
@interface TitleModel : NSObject

@property(nonatomic,copy)NSString *title;

@property(nonatomic,assign)BOOL deliverFree;

@property(nonatomic,strong)NSArray<GoodsModel *>*goodsArray;

@end
