//
//  GetKlinData.h
//  kline
//
//  Created by 刘成利 on 2016/8/21.
//  Copyright © 2017年 刘成利. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GetKlineData;

@protocol GetKlineDataDelegate <NSObject>

- (void)GetDatasFromGetKline:(GetKlineData *)obj Array:(NSArray *)array;

@end

@interface GetKlineData : NSObject

@property (weak, nonatomic)id <GetKlineDataDelegate>delegate;

- (void)GetDataAddDelegate:(id<GetKlineDataDelegate>)delegate;

@end
