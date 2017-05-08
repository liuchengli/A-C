//
//  CellHeightChangeControllerViewController.m
//  A-C
//
//  Created by 刘成利 on 2017/5/2.
//  Copyright © 2017年 刘成利. All rights reserved.
//

#import "CellHeightChangeController.h"
#import "ClassModel.h"
#import "StudentInfoCell.h"
#import "ClassHeaderView.h"
#import "GCD.h"

static NSString *infoCellFlag = @"BaseTableViewCell";
static NSString *infoHeadFlag = @"ClassHeaderView";

@interface CellHeightChangeController () <UITableViewDataSource, UITableViewDelegate, CustomHeaderFooterViewDelegate>

@property (nonatomic, strong) NSMutableArray  *classModels;
@property (nonatomic, strong) UITableView     *tableView;

@property (nonatomic) BOOL                     sectionFirstLoad;
@property (nonatomic, weak)   ClassHeaderView *tmpHeadView;

@end

@implementation CellHeightChangeController


- (void)setup {
    
    [super setup];
    
    self.titleView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.7]; //导航栏背景色
    
    
    [self createDatas];
    
    [self createTableView];
    
    [self firstLoadDataAnimation];
}

#pragma mark - 数据源相关
- (void)createDatas {
    
    NSArray *datas = @[@{@"className" : @"嗯哼",
                         @"students"  : @[@{@"name" : @"刘成利",   @"age" : @(26)},
                                          @{@"name" : @"iOS",     @"age" : @(12)},
                                          @{@"name" : @"Java",   @"age" : @(23)},
                                          @{@"name" : @"Python",  @"age" : @(19)},
                                          @{@"name" : @"Android",   @"age" : @(19)},
                                          @{@"name" : @"Html",  @"age" : @(19)}]},
                       @{@"className" : @"哈哈",
                         @"students"  : @[@{@"name" : @"JS",    @"age" : @(34)},
                                          @{@"name" : @"CSS",    @"age" : @(31)},
                                          @{@"name" : @"H5",    @"age" : @(10)},
                                          @{@"name" : @"C++",   @"age" : @(39)}]},
                       @{@"className" : @"嘿嘿",
                         @"students"  : @[@{@"name" : @"C",    @"age" : @(34)},
                                          @{@"name" : @"Go",  @"age" : @(78)},
                                          @{@"name" : @"Ruby",   @"age" : @(43)},
                                          @{@"name" : @"Node.js",  @"age" : @(21)}]},
                       @{@"className" : @"吆呵",
                         @"students"  : @[@{@"name" : @"前端",  @"age" : @(98)},
                                          @{@"name" : @"后台", @"age" : @(21)},
                                          @{@"name" : @"运维",  @"age" : @(7)},
                                          @{@"name" : @"网管",    @"age" : @(67)}]},
                       @{@"className" : @"嘻嘻",
                         @"students"  : @[@{@"name" : @"大爷", @"age" : @(23)},
                                          @{@"name" : @"牛叉",  @"age" : @(45)},
                                          @{@"name" : @"妹子",    @"age" : @(89)},
                                          @{@"name" : @"哈哈",   @"age" : @(23)}]},];
    
    self.classModels = [[NSMutableArray alloc] init];
    for (int count = 0; count < datas.count; count++) {
        
        ClassModel *classModel = [[ClassModel alloc] initWithDictionary:datas[count]];
        classModel.expend      = NO;
        
        [self.classModels addObject:classModel];
    }
}

#pragma mark - tableView相关

- (void)createTableView {
    
    self.tableView = [[UITableView alloc] initWithFrame:self.contentView.bounds style:UITableViewStylePlain];
    self.tableView.delegate                       = self;
    self.tableView.dataSource                     = self;
    self.tableView.separatorStyle                 = UITableViewCellSeparatorStyleNone;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.showsVerticalScrollIndicator   = NO;
    
    [self.tableView registerClass:[StudentInfoCell class] forCellReuseIdentifier:infoCellFlag];
    [self.tableView registerClass:[ClassHeaderView class] forHeaderFooterViewReuseIdentifier:infoHeadFlag];
    
    [self.contentView addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    ClassModel *model = _classModels[section];
    
    if (model.expend == YES) {
        
        return [model.students count];
        
    } else {
        
        return 0;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (self.sectionFirstLoad == NO) {
        
        return 0;
        
    } else {
        
        return [_classModels count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:infoCellFlag];
    
    ClassModel   *classModel   = _classModels[indexPath.section];
    StudentModel *studentModel = classModel.students[indexPath.row];
    cell.data                  = studentModel;
    cell.indexPath             = indexPath;
    [cell loadContent];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    ClassHeaderView *titleView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:infoHeadFlag];
    titleView.delegate         = self;
    titleView.data             = _classModels[section];
    titleView.section          = section;
    [titleView loadContent];
    
    if (section == 0) {
        
        self.tmpHeadView = titleView;
    }
    
    ClassModel *model = _classModels[section];
    if (model.expend == YES) {
        
        [titleView extendStateAnimated:NO];
        
    } else {
        
        [titleView normalStateAnimated:NO];
    }
    
    return titleView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 30;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    StudentInfoCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell showSelectedAnimation];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)customHeaderFooterView:(CustomHeaderFooterView *)customHeaderFooterView event:(id)event {
    
    NSInteger section = customHeaderFooterView.section;
    ClassModel *model = _classModels[section];
    
    ClassHeaderView *classHeaderView = (ClassHeaderView *)customHeaderFooterView;
    
    if (model.expend == YES) {
        
        // 缩回去
        model.expend = NO;
        [classHeaderView normalStateAnimated:YES];
        
        NSMutableArray *indexPaths = [NSMutableArray array];
        for (int i = 0; i < model.students.count; i++) {
            
            [indexPaths addObject:[NSIndexPath indexPathForItem:i inSection:section]];
        }
        [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
        
    } else {
        
        // 显示出来
        model.expend = YES;
        [classHeaderView extendStateAnimated:YES];
        
        NSMutableArray *indexPaths = [NSMutableArray array];
        for (int i = 0; i < model.students.count; i++) {
            
            [indexPaths addObject:[NSIndexPath indexPathForItem:i inSection:section]];
        }
        [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)firstLoadDataAnimation {
    
    [GCDQueue executeInMainQueue:^{
        
        // Extend sections.
        self.sectionFirstLoad = YES;
        NSIndexSet *indexSet  = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, self.classModels.count)];
        [self.tableView insertSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
        
        [GCDQueue executeInMainQueue:^{
            
            // Extend cells.
            [self customHeaderFooterView:self.tmpHeadView event:nil];
            
        } afterDelaySecs:0.4f];
        
    } afterDelaySecs:0.3f];
}


@end
