//
//  CellDynamicRollController.m
//  A-C
//
//  Created by 刘成利 on 2017/5/9.
//  Copyright © 2017年 刘成利. All rights reserved.
//

#import "CellDynamicRollController.h"
#import "RollCell.h"

#define cellID @"rollCellID"
@interface CellDynamicRollController () <UITableViewDataSource,UITableViewDelegate>

/**
 *  数据数组
 */
@property(nonatomic,strong) NSMutableArray * dataArray;

/**
 *  列表
 */
@property(nonatomic,strong) UITableView * tableView;

@end

@implementation CellDynamicRollController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self preData];
    [self createTableView];

}

//cell数据
- (void)preData
{
    _dataArray = [[NSMutableArray alloc]init];
    for (int i = 1; i < 19; i++)
    {
        UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i]];
        [_dataArray addObject:image];
    }
}

//创建tableView
- (void)createTableView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height) style:UITableViewStylePlain];
    _tableView.delegate       = self;
    _tableView.dataSource     = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.rowHeight      = 250;
    [self.contentView addSubview:_tableView];
    
    [_tableView registerClass:[RollCell class] forCellReuseIdentifier:cellID];
}

#pragma mark ---------tableView Delegate-----------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RollCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    return cell;
}

//在willDisplayCell里面处理数据能优化tableview的滑动流畅性
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    RollCell * myCell = (RollCell *)cell;
    
    [myCell setImg:_dataArray[indexPath.row]];
    
    [myCell cellOffset];
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return cellHeight;
//}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // visibleCells 获取界面上能显示出来了cell
    NSArray<RollCell *> *array = [self.tableView visibleCells];
    
    //enumerateObjectsUsingBlock 类似于for，但是比for更快
    [array enumerateObjectsUsingBlock:^(RollCell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [obj cellOffset];
        
    }];
    
}

@end
