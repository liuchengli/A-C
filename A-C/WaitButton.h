//
//  WaitButton.h
//
//  Created by 刘成利 on 16/10/10.
//  Copyright © 2016年 刘成利. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^finishBlock)();

@interface WaitButton : UIView

// 完成回调
@property (nonatomic,copy) finishBlock finishBlock;

@end
