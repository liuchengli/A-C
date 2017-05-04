//
//  WarnShakeLabelController.m
//  A-C
//
//  Created by 刘成利 on 2017/2/8.
//  Copyright © 2017年 刘成利. All rights reserved.
//

#import "Header.h"
#import "WarnShakeLabelController.h"
#import "CALayer+Anim.h"

#import "GCD.h"
#import "UIView+SetRect.h"
#import "WxHxD.h"
#import "UIFont+Fonts.h"
#import "NSString+HexColors.h"

@interface WarnShakeLabelController ()

@property (nonatomic, strong) UILabel   *wrongNotice;
@property (nonatomic, strong) UIView    *shakeView;
@property (nonatomic, strong) UIView    *redView;
@property (nonatomic, strong) UIView    *scaleView;
@property (nonatomic, strong) UIView    *redSideView;
@property (nonatomic, strong) UIView    *colorView;
@property (nonatomic, strong) GCDTimer      *timer;
//@property (nonatomic, strong) dispatch_source_t *timer;

@end

@implementation WarnShakeLabelController

- (void)setup {
    
    self.TitleVisualEffect = blackEffect;
    
    [super setup];
    
//    NSTimeInterval period = 3.0; //设置时间间隔
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
//    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), period * NSEC_PER_SEC, 0); //每秒执行
//    dispatch_source_set_event_handler(_timer, ^{
//        //在这里执行事件
//    });
//    dispatch_resume(_timer);
    
    
    
    // 左右抖动label
    {
        
    self.wrongNotice   = [[UILabel alloc]initWithFrame:CGRectMake(Width/2-150, 600*ScreenHeightRate, 300, 20)];
    self.wrongNotice.textColor     = [@"ff0000" hexColor];
    self.wrongNotice.text          = @"文字警告提示";
    self.wrongNotice.font          = [UIFont HeitiSCWithFontSize:18.f];
    self.wrongNotice.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.wrongNotice];
        
    }
    
    
    // view抖动
    {
        self.shakeView     = [[UIView alloc]initWithFrame:CGRectMake(Width/2-150, 100*ScreenHeightRate, 300, 50)];
        self.shakeView.layer.cornerRadius  = 5;
        self.shakeView.layer.masksToBounds = YES;
        self.shakeView.layer.borderWidth   = 1;
        self.shakeView.layer.borderColor   = [UIColor redColor].CGColor;
        
        UILabel *label   = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 50)];
        label.textColor     = [@"ff0000" hexColor];
        label.text          = @"抖动警告";
        label.font          = [UIFont HeitiSCWithFontSize:16.f];
        label.textAlignment = NSTextAlignmentCenter;
        
        [self.shakeView addSubview:label];
        [self.contentView addSubview:self.shakeView];
    
    
    }
    
    // 闪烁
    {
    
        self.redView     = [[UIView alloc]initWithFrame:CGRectMake(Width/2-150, 200*ScreenHeightRate, 300, 50)];
        self.redView.layer.cornerRadius  = 5;
        self.redView.layer.masksToBounds = YES;
        self.redView.layer.borderWidth   = 1;
        self.redView.layer.borderColor   = [UIColor redColor].CGColor;
        
        UILabel *label   = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 50)];
        label.textColor     = [UIColor redColor];
        label.text          = @"闪烁警告！";
        label.font          = [UIFont HeitiSCWithFontSize:17.f];
        label.textAlignment = NSTextAlignmentCenter;
        
        [self.redView addSubview:label];
        [self.contentView addSubview:self.redView];

    
    
    }
    
    
    // 放大
    {
    
        self.scaleView     = [[UIView alloc]initWithFrame:CGRectMake(Width/2-150, 300*ScreenHeightRate, 300, 50)];
        self.scaleView.layer.cornerRadius  = 5;
        self.scaleView.layer.masksToBounds = YES;
        self.scaleView.layer.borderWidth   = 1;
        self.scaleView.layer.borderColor   = [UIColor redColor].CGColor;
        
        UILabel *label   = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 50)];
        label.textColor     = [UIColor redColor];
        label.text          = @"放大警告！";
        label.font          = [UIFont HeitiSCWithFontSize:17.f];
        label.textAlignment = NSTextAlignmentCenter;
        
        [self.scaleView addSubview:label];
        [self.contentView addSubview:self.scaleView];
    
    }

    // 红边提示
    {
    
        self.redSideView     = [[UIView alloc]initWithFrame:CGRectMake(Width/2-150, 400*ScreenHeightRate, 300, 50)];
        self.redSideView.layer.cornerRadius  = 5;
//        self.redSideView.layer.masksToBounds = YES;
        self.redSideView.layer.borderWidth   = 1;
        self.redSideView.layer.borderColor   = [UIColor grayColor].CGColor;
        self.redSideView.layer.shadowColor   = [UIColor clearColor].CGColor;
        self.redSideView.layer.shadowOpacity = 1.f;
        self.redSideView.layer.shadowRadius  = 4;
        self.redSideView.layer.shadowOffset  = CGSizeZero;
        
        UILabel *label   = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 50)];
        label.textColor     = [UIColor grayColor];
        label.text          = @"红边闪烁警告！";
        label.font          = [UIFont HeitiSCWithFontSize:17.f];
        label.textAlignment = NSTextAlignmentCenter;
        
        [self.redSideView addSubview:label];
        [self.contentView addSubview:self.redSideView];
    
    }
    
    
    // 背景色警告
    {
        self.colorView     = [[UIView alloc]initWithFrame:CGRectMake(Width/2-150, 500*ScreenHeightRate, 300, 50)];
        self.colorView.layer.cornerRadius  = 5;
        self.colorView.layer.masksToBounds = YES;
        self.colorView.layer.borderWidth   = 1;
        
        UILabel *label   = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 50)];
        label.textColor     = [UIColor grayColor];
        label.text          = @"颜色闪烁警告！";
        label.font          = [UIFont HeitiSCWithFontSize:17.f];
        label.textAlignment = NSTextAlignmentCenter;
        
        [self.colorView addSubview:label];
        [self.contentView addSubview:self.colorView];
       
      
        
        
        
    
    }
    
    _timer = [[GCDTimer alloc] initInQueue:[GCDQueue mainQueue]];
    
    _md_get_weakSelf();
    [_timer event:^{
        
         [weakSelf showYourself];
        
    } timeIntervalWithSecs:3 delaySecs:0.5f];
    
    [_timer start];

    
}



// 展现效果
- (void)showYourself{

        [self.wrongNotice.layer shake];
        [self.shakeView.layer shake];
        [self.redView.layer flash:0.2 repeat:2];
        [self.scaleView.layer scale:1.15 repeat:2];
        [self.redSideView.layer shadowsFlash:0.2 repeat:2];
        [self.colorView.layer colorFlash:0.2 repeat:2];
    
    
}

- (void)dealloc{


    // 停止计时器
    [_timer destroy];

}

@end
