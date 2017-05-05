//
//  ItemListTableView.m
//  TestLocalNotification
//
//  Created by 陈世豪 on 16/8/12.
//  Copyright © 2016年 陈世豪. All rights reserved.
//

#import "ItemListTableView.h"
#import "GoodsTableViewCell.h"
typedef NS_ENUM(NSInteger,ScrollDirection){
    ScrollDirectionUp,
    ScrollDirectionDown
    
};
@interface ItemListTableView()<UITableViewDataSource,UITableViewDelegate>
{
    CGFloat oldOffset;
    BOOL isClickToScroll;
}
@property(nonatomic,assign)ScrollDirection scrollDirection;



@end
@implementation ItemListTableView


-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self=[super initWithFrame:frame style:style]) {
        self.dataSource=self;
        self.delegate=self;
    }
    return self;
}
-(void)setSelectedIndex:(NSInteger)selectedIndex
{
    _selectedIndex = selectedIndex;
    isClickToScroll = YES;
    [self scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:selectedIndex] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}
#pragma mark - scrollDelegate
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    isClickToScroll = NO;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.scrollDirection = (scrollView.contentOffset.y-oldOffset>0) ? ScrollDirectionUp : ScrollDirectionDown;

    oldOffset = scrollView.contentOffset.y;

    
   
}
#pragma mark - tableDelegate
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *titleView=[[UILabel alloc]init];
    titleView.font=[UIFont systemFontOfSize:10];
    [titleView sizeToFit];
    titleView.backgroundColor=[UIColor lightGrayColor];
    titleView.text=self.dataArray[section].title;
//    NSLog(@"%@---header",titleView.text);
    return titleView;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    TitleModel *model=self.dataArray[section];
    return model.goodsArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GoodsTableViewCell *cell=[GoodsTableViewCell cellWithTableView:tableView];
    cell.model=self.dataArray[indexPath.section].goodsArray[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(nonnull UIView *)view forSection:(NSInteger)section
{
    
    if (self.scrollDirection == ScrollDirectionUp)
    {
        NSInteger topCellSection=[tableView indexPathsForVisibleRows].firstObject.section;
//        NSLog(@"HEADERSCETION:%ld",topCellSection);
        
        if ([self.listDelegate respondsToSelector:@selector(scrollWithIndex:isLeftMakeScroll:)])
        {
            [self.listDelegate scrollWithIndex:topCellSection isLeftMakeScroll:isClickToScroll];
        }
    }
    
    
    
    
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    if (self.scrollDirection == ScrollDirectionDown)
    {
        NSInteger topCellSection=[tableView indexPathsForVisibleRows].firstObject.section;
//        NSLog(@"HEADERSCETION:%ld",topCellSection);
        
        if ([self.listDelegate respondsToSelector:@selector(scrollWithIndex:isLeftMakeScroll:)])
        {
            [self.listDelegate scrollWithIndex:topCellSection isLeftMakeScroll:isClickToScroll];
        }
    }
}

@end
