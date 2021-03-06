//
//  lineView.h
//  kline
//
//  Created by 刘成利 on 2016/9/21.
//  Copyright © 2016年 刘成利. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "lineDataSource.h"


@class CAShapeLayer,KlineModel;


@interface lineView : UIView


- (instancetype)initWithFrame:(CGRect)frame Delegate:(id<lineDataSource>)delegate;


@property (nonatomic, weak)id <lineDataSource>delegate;

@property (nonatomic, assign)CGFloat x_scale;//x坐标缩放的比例

@property (nonatomic, assign,readonly)CGFloat heightPrice;
@property (nonatomic, assign,readonly)CGFloat lowerPrice;

//是显示十字光标 还是可以拉动..
@property (nonatomic, assign,getter=isShowTrackingCross)BOOL showTrackingCross;

- (void)reload;
//替换最后一个点
- (void)replacementLastPoint:(KlineModel *)model;








@end
