//
//  MenuBaseView.m
//  TestLocalNotification
//
//  Created by 陈世豪 on 2017/4/26.
//  Copyright © 2017年 陈世豪. All rights reserved.
//

#import "MenuBaseView.h"
#import "LeftListTableView.h"
#import "ItemListTableView.h"
@interface MenuBaseView()<ItemListTableViewDelegate,LeftListTableViewDelegate>

@property (nonatomic,strong) LeftListTableView *leftTableView;

@property (nonatomic,strong) ItemListTableView *listItemView;


@property (nonatomic,assign)BOOL isDefaultWidth;

@end

@implementation MenuBaseView
-(instancetype)init
{
    if (self = [super init])
    {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.leftTableView];
        self.leftTableView.selectedDelegate = self;
        [self addSubview:self.listItemView];
        self.listItemView.listDelegate = self;
        self.isDefaultWidth = YES;

    }
    return self;
}
-(instancetype)initWithSectionArray:(NSArray <TitleModel *>*)sectionArray
{
    if (self = [super init])
    {
        _sectionArray = sectionArray;
        self.leftTableView.dataArray = sectionArray;
        self.listItemView.dataArray = sectionArray;
        [self reloadView:MenuViewReloadTypeAll];
        self.leftTableView.selectedIndex = 0;

    }
    return self;
}
-(void)setSectionArray:(NSArray<TitleModel *> *)sectionArray
{
    _sectionArray = sectionArray;
    self.leftTableView.dataArray = sectionArray;
    self.listItemView.dataArray = sectionArray;
    [self reloadView:MenuViewReloadTypeAll];
    self.leftTableView.selectedIndex = 0;


}

-(void)reloadView:(MenuViewReloadType)viewType
{
    if (viewType == MenuViewReloadTypeLeftView)
    {
        [self.leftTableView reloadData];
    }
    else if(viewType == MenuViewReloadTypeItemListView)
    {
        [self.listItemView reloadData];
    }
    else
    {
        [self.leftTableView reloadData];
        [self.listItemView reloadData];
    }
}
-(void)setLeftMenuWidth:(CGFloat)leftMenuWidth
{
    _leftMenuWidth = leftMenuWidth;
    self.isDefaultWidth = NO;
    [self setNeedsLayout];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    if (self.isDefaultWidth)
    {
        self.leftTableView.frame = CGRectMake(0,
                                              0,
                                              60,
                                              self.frame.size.height);
    }
    else
    {
        self.leftTableView.frame = CGRectMake(0,
                                              0,
                                              self.leftMenuWidth,
                                              self.frame.size.height);
    }
    
    
    self.listItemView.frame= CGRectMake(self.leftTableView.frame.size.width,
                                        0,
                                        self.frame.size.width-self.leftTableView.frame.size.width,
                                        self.frame.size.height);
    
}
#pragma mark - ITEMTABLEVIEWDELEGATE
-(void)scrollWithIndex:(NSInteger)index isLeftMakeScroll:(BOOL)isLeftMake
{
    if (!isLeftMake)
    {
        self.leftTableView.selectedIndex=index;
        
    }
}
#pragma mark - LeftDelegate
-(void)leftListTableViewDidSelectedIndex:(NSInteger)index
{
    self.listItemView.selectedIndex = index;
}
#pragma mark - initView
-(LeftListTableView *)leftTableView
{
    if (!_leftTableView)
    {
        _leftTableView=[[LeftListTableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        
    }
    return _leftTableView;
    
}
-(ItemListTableView *)listItemView
{
    if (!_listItemView) {
        _listItemView=[[ItemListTableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _listItemView.backgroundColor=[UIColor whiteColor];
    }
    return _listItemView;
}

@end
