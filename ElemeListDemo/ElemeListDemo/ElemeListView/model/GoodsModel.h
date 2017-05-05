//
//  GoodsModel.h
//  TestLocalNotification
//
//  Created by 陈世豪 on 16/8/12.
//  Copyright © 2016年 陈世豪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsModel : NSObject

@property(nonatomic,copy)NSString *title;

@property(nonatomic,assign)NSInteger price;

@property(nonatomic,assign,getter=isDeliverFree)BOOL deliverFree;

@property(nonatomic,assign)NSInteger sellCount;

@end
