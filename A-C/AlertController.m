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
#import "TextScrollShowView.h"

@interface AlertController ()

@end

@implementation AlertController

- (void)setup {
    
    [super setup];
    
    
    
    {
    
        
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 150, self.contentView.width-100, self.contentView.height-150)];
        image.image        = [UIImage imageNamed:@"启动页"];
        [self.contentView addSubview:image];
    
    }
    
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
    
    
    {
        
        UIButton *firstButton  = [[UIButton alloc] initWithFrame:CGRectMake(Width/2-50, self.view.height-150, 100, 50)];
        firstButton.backgroundColor = [UIColor lightGrayColor];
        firstButton.titleLabel.font        = [UIFont HeitiSCWithFontSize:16.f];
        [firstButton setTitle:@"文本滚动弹窗" forState:UIControlStateNormal];
        [firstButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [firstButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [firstButton addTarget:self action:@selector(ButtonsEvent3) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:firstButton];
        
    }


}


// 警告弹窗
- (void)ButtonsEvent1{

    
    [AlertView showAlertView:self.contentView withText:@"您的余额已不足，请及时充值！ 警告弹窗展示2秒后自动消失，请留意~" during:2];


}

// 按钮弹窗
- (void)ButtonsEvent2{
    
  
    
  
    ButtonShowView * buttonShow  = [[ButtonShowView alloc]initWithFrame:self.contentView.bounds];
    buttonShow.message           = @"欢迎体验iOS刘成利的弹窗~有何指正之处速速交流";
    buttonShow.buttonsTitleArray = @[@"取消",@"确定"];
    buttonShow.buttonsColorArray = @[[UIColor blueColor],[UIColor redColor]];
    [buttonShow showButtonViewOn:self.contentView];
    buttonShow.eventBlock = ^(NSInteger tag){
        
        // 处理按钮事件 0为左  1为右
    };
    
}


// 上下滑动文字提示
- (void)ButtonsEvent3{
    
    TextScrollShowView * showView = [[TextScrollShowView alloc]initWithFrame:self.view.bounds];
    showView.textString           = @"    本APP在模拟投资阶段仅为对用户的投资知识、投资经验、投资目标、风险偏好，以及对使用本公司提供的证券投资人工智能产品和服务（以下简称“公司产品和服务”）的适当性进行充分、准确的了解，目的是按照有关法律法规，为用户提供更好的投资者保障措施和适当的产品及服务；用户应为其提供的所有相关信息的真实性、准确性和完整性负责。用户只要在经过模拟阶段后，本公司才能采取基于用户数据的算法来对用户使用公司产品和服务的适应性、适当性、适合性进行评测，只有经过评测通过的用户才可以正式使用本APP提供的公司产品和服务。本公司将对获取的用户信息、用户风险承受能力评测结果等信息和资料严格保密，防止该等信息和资料被泄露或被不当利用。";
    
    [showView showOnView:self.view];
    
    
    
    
}

@end
