//
//  KLineViewController.m
//  A-C
//
//  Created by 刘成利 on 2017/4/21.
//  Copyright © 2017年 刘成利. All rights reserved.
//

#import "KLineViewController.h"

#import "KlineModel.h"
#import "KlineView.h"
//#import "lineView.h"

@interface KLineViewController ()<lineDataSource>


@property (nonatomic, strong)NSArray *KlineModels;
//@property (nonatomic, strong)lineView *line;
@property (nonatomic, assign)NSInteger index;

@end

@implementation KLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    KlineModel *model = [KlineModel new];
    
    __weak KLineViewController *selfWeak = self;
    [model GetModelArray:^(NSArray *dataArray) {
        __strong KLineViewController *strongSelf = selfWeak;
        strongSelf.KlineModels = dataArray;
    }];
    
    KlineView *kline = [[KlineView alloc] initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 300) Delegate:self];
    
    kline.ShowTrackingCross = YES;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        kline.ShowTrackingCross = NO;
    });
    
    [self.view addSubview:kline];
    
}



#pragma mark lineDataSource delegate
- (KlineModel *)LineView:(UIView *)view cellAtIndex:(NSInteger)index;{
    return [self.KlineModels objectAtIndex:index];
}


- (NSInteger)numberOfLineView:(UIView *)view{
    return self.KlineModels.count;
}



@end

