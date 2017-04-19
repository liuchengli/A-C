//
//  LongPressButton.h
//  ASR
//
//  Created by 刘成利 on 2017/3/2.
//  Copyright © 2017年 刘成利. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    LongTouchBegin = 1000,  // 开始触摸
    LongTouchEnd,           // 结束触摸
    oneTapTouch,            // 单击
    doubleTapTouch,         // 双击
}TouchType;

typedef void (^EventAndTime) (TouchType TouchType,NSTimeInterval time);



/* 为正方形，取宽高的最大值为方形边长  */
@interface LongPressButton : UIView

// 开始和结束触摸事件回调
@property (nonatomic, copy)   EventAndTime eventBlock;

// 不需要loading圈请设为YES，默认带loading
@property (nonatomic, assign) BOOL         removeLoading;

- (void)finishAndRest;

@end
