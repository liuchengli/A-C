//
//  LongPressButtonController.m
//  A-C
//
//  Created by 刘成利 on 2017/4/19.
//  Copyright © 2017年 刘成利. All rights reserved.
//

#import "LongPressButtonController.h"
#import "LongPressButton.h"
#import "AlertView.h"

@interface LongPressButtonController ()

@property (nonatomic, strong) LongPressButton *longButton;    // 长按按钮


@end

@implementation LongPressButtonController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 长按按钮
    self.longButton = [[LongPressButton alloc]initWithFrame:CGRectMake(100, 300, 100, 100)];
    
    [self.view addSubview:self.longButton];
    
    __weak LongPressButtonController *weakSelf = self;
    self.longButton.eventBlock = ^(TouchType TouchType,NSTimeInterval time){
        
        switch (TouchType) {
            case LongTouchBegin:
                [weakSelf startEvent];
                break;
            case LongTouchEnd:
                [weakSelf endEvent];
                break;
            case oneTapTouch:
                [weakSelf oneClickEvent];
                break;
            case doubleTapTouch:
                [weakSelf doubelClickEvent];
                break;
                
                
            default:
                break;
        }
        
        
    };
    
    
    
}


// 单击
- (void)oneClickEvent{

      [AlertView showAlertView:self.contentView withText:@"单击" during:2];


}

// 双击击
- (void)doubelClickEvent{
    
    [AlertView showAlertView:self.contentView withText:@"双击" during:2];
    
}

// 开始长按
- (void)startEvent{
    
    
    
}

// 结束长按
- (void)endEvent{
    
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0/*延迟执行时间*/ * NSEC_PER_SEC));
    
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        
        [self.longButton finishAndRest];
        
    });
    
    
}

@end
