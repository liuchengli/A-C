//
//  BrokenLineController.m
//  A-C
//
//  Created by 刘成利 on 2017/2/9.
//  Copyright © 2017年 刘成利. All rights reserved.
//

#import "BrokenLineController.h"

@interface BrokenLineController ()

@property (nonatomic, strong) NSArray *dataArray;      // 折线数据

@end

@implementation BrokenLineController

- (void)setup {
    
    [super setup];
    
    
    self.dataArray      = [NSArray arrayWithObjects:@"0.3",@"1.2",@"0.7",@"1.8",@"2.2",@"1.8",@"1.5", nil];
    
    
    
}

@end
