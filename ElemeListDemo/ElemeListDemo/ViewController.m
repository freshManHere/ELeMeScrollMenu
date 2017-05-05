//
//  ViewController.m
//  ElemeListDemo
//
//  Created by 陈世豪 on 2017/5/5.
//  Copyright © 2017年 陈世豪. All rights reserved.
//

#import "ViewController.h"
#import "LeftListTableView.h"
#import "ItemListTableView.h"
#import "TitleModel.h"
#import "MenuBaseView.h"
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
@interface ViewController ()
@property(nonatomic,strong)NSMutableArray *goodsDataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"菜单";
    self.edgesForExtendedLayout=NO;
    [self getData];
}

-(void)getData
{
    MenuBaseView *menu = [[MenuBaseView alloc]init];
    menu.frame = CGRectMake(0,
                            0,
                            SCREENWIDTH,
                            SCREENHEIGHT-64);
    menu.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:menu];
    menu.sectionArray = self.goodsDataArray;
    //    [menu reloadView:MenuViewReloadTypeAll];
}
-(NSMutableArray *)goodsDataArray
{
    if (!_goodsDataArray) {
        _goodsDataArray=[NSMutableArray array];
        for (int i=0; i<7; i++) {
            TitleModel *tModel=[[TitleModel alloc]init];
            tModel.title=[NSString stringWithFormat:@"热销榜%d",i];
            ;
            NSMutableArray *goods=[NSMutableArray array];
            for (int i=0; i<10; i++) {
                GoodsModel *gModel=[[GoodsModel alloc]init];
                gModel.title=@"小龙虾";
                gModel.deliverFree=YES;
                gModel.price=100;
                gModel.sellCount=10;
                [goods addObject:gModel];
            }
            tModel.goodsArray=goods;
            [_goodsDataArray addObject:tModel];
            
        }
        
    }
    return _goodsDataArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
