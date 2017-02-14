//
//  ButtonShowView.h
//  A-C
//
//  Created by 刘成利 on 2017/2/14.
//  Copyright © 2017年 刘成利. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^CallbackEvent) (NSInteger tag);

@interface ButtonShowView : UIView

// 最多支持两个按钮
@property (nonatomic, strong) NSArray         *buttonsTitleArray;
@property (nonatomic, strong) NSArray         *buttonsColorArray;
@property (nonatomic        ) NSString        *message;

//- (void)showButtonViewOn:(UIView*)contentView CallBack:(CallbackEvent)eventBlock;
- (void)showButtonViewOn:(UIView*)contentView;
/**
 *  事件回调
 */
@property (nonatomic, copy) CallbackEvent eventBlock;

@end
