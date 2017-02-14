//
//  AlertController.m
//  A-C
//
//  Created by 刘成利 on 2017/2/13.
//  Copyright © 2017年 刘成利. All rights reserved.
//

#import "AlertController.h"
#import "UIFont+Fonts.h"
#import "UIView+SetRect.h"
#import "AlertView.h"
#import "ButtonShowView.h"

@interface AlertController ()

@end

@implementation AlertController

- (void)setup {
    
    [super setup];
    
    
    
    {
    
        UIButton *firstButton  = [[UIButton alloc] initWithFrame:CGRectMake(Width/2-50, 50, 100, 50)];
        firstButton.backgroundColor = [UIColor lightGrayColor];
        firstButton.titleLabel.font        = [UIFont HeitiSCWithFontSize:16.f];
        [firstButton setTitle:@"警告弹窗" forState:UIControlStateNormal];
        [firstButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [firstButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [firstButton addTarget:self action:@selector(ButtonsEvent1) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:firstButton];
    
    }
    
    
    
    {
        
        UIButton *firstButton  = [[UIButton alloc] initWithFrame:CGRectMake(Width/2-50, 150, 100, 50)];
        firstButton.backgroundColor = [UIColor lightGrayColor];
        firstButton.titleLabel.font        = [UIFont HeitiSCWithFontSize:16.f];
        [firstButton setTitle:@"按钮弹窗" forState:UIControlStateNormal];
        [firstButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [firstButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [firstButton addTarget:self action:@selector(ButtonsEvent2) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:firstButton];
        
    }

}


// 警告弹窗
- (void)ButtonsEvent1{

    
    [AlertView showAlertView:self.contentView withText:@"您的余额已不足，请及时充值！ 警告弹窗展示2秒后自动消失，请留意~" during:2];


}

// 按钮弹窗
- (void)ButtonsEvent2{
    
    ButtonShowView * buttonShow  = [ButtonShowView new];
    buttonShow.message           = @"欢迎体验iOS刘成利的弹窗~";
    buttonShow.buttonsTitleArray = @[@"确定"];
    buttonShow.buttonsColorArray = @[[UIColor blackColor],[UIColor blueColor]];
    [buttonShow showButtonViewOn:self.contentView];
    buttonShow.eventBlock = ^(NSInteger tag){
        
        // 处理按钮事件 0为左  1为右
    };
    
}
@end
