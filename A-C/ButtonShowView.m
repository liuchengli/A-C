//
//  ButtonShowView.m
//  A-C
//
//  Created by 刘成利 on 2017/2/14.
//  Copyright © 2017年 刘成利. All rights reserved.
//

#import "ButtonShowView.h"

#import "UIFont+Fonts.h"
#import "UIView+SetRect.h"
#import "POP.h"
#import "NSString+HexColors.h"

@interface ButtonShowView ()

@property (nonatomic, strong)  UIView  *blackView;
@property (nonatomic, strong)  UIView  *messageView;

@end


@implementation ButtonShowView
- (instancetype)init {
    
    if (self) {
        
        self = [super init];
        
        
    }
    
    return self;
}


- (void)showButtonViewOn:(UIView*)contentView{
    
    
    
    if (contentView) {
        
        [self createBlackView:contentView];
        [self createMessageView:contentView];
        
        [contentView addSubview:self];
        
  
       
    }
}


- (void)createBlackView:(UIView*)contentView {
    
    self.blackView                 = [[UIView alloc] initWithFrame:contentView.bounds];
    self.blackView.backgroundColor = [UIColor blackColor];
    self.blackView.alpha           = 0;
    [self addSubview:self.blackView];
    
    [UIView animateWithDuration:0.3f animations:^{
        
        self.blackView.alpha = 0.25f;
    }];
}

- (void)createMessageView:(UIView*)contentView {
    
    
    // 创建信息label
    NSString *text            = self.message;
    UILabel *textLabel        = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 210, 0)];
    textLabel.backgroundColor = [UIColor clearColor];
    textLabel.text            = text;
    textLabel.font            = [UIFont HeitiSCWithFontSize:15.f];
    textLabel.textColor       = [UIColor blackColor];
    textLabel.textAlignment   = NSTextAlignmentCenter;
    textLabel.numberOfLines   = 0;
    [textLabel sizeToFit];
    
    
    //模糊
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    UIVisualEffectView *effectViewWhite = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    effectViewWhite.frame = CGRectMake(0, 0, 280, textLabel.height+100 );
    effectViewWhite.alpha = 1.0;

    
    // 创建信息窗体view
    self.messageView                    = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 280, textLabel.height + 100)];
    self.messageView.layer.cornerRadius = 10.f;
    self.messageView.clipsToBounds      = YES;
    self.messageView.center             = contentView.middlePoint;
    textLabel.center                    = CGPointMake(self.messageView.middleX, 0);
    textLabel.top                       = 30;
    self.messageView.alpha              = 0.f;
    [self.messageView addSubview:effectViewWhite];
    [self.messageView addSubview:textLabel];
    [self addSubview:self.messageView];
    
    // 处理按钮
    // 如果有1个按钮
    if (self.buttonsTitleArray.count == 1) {
        
        
        // 添加一个模糊效果
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
        UIVisualEffectView *effectViewWhite = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        effectViewWhite.frame = CGRectMake(0, self.messageView.height-52, 280, self.messageView.height -48);
        effectViewWhite.alpha = 1.0;
        [self.messageView addSubview:effectViewWhite];
        
        
        UIColor *firstColor = [UIColor blackColor];
        if (self.buttonsColorArray[0]) {
            firstColor = self.buttonsColorArray[0];
        }
        
        UIButton  *firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
        firstButton.frame = CGRectMake(0, self.messageView.height - 48, self.messageView.width, 48);
        firstButton.tag                    = 10;
        firstButton.titleLabel.font        = [UIFont HeitiSCWithFontSize:16.f];
        [firstButton setTitle:self.buttonsTitleArray[0] forState:UIControlStateNormal];
        [firstButton setTitleColor:firstColor forState:UIControlStateNormal];
        [firstButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [firstButton addTarget:self action:@selector(messageButtonsEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self.messageView addSubview:firstButton];
    }
    
    // 如果有2个按钮
    if (self.buttonsTitleArray.count == 2) {
        
        
//        // 添加左右模糊效果
//        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
//        UIVisualEffectView *effectViewWhiteLeft = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
//        effectViewWhiteLeft.frame = CGRectMake(0, self.messageView.height -48, self.messageView.width/2-0.5, 48);
//        effectViewWhiteLeft.alpha = 1.0;
//        [self.messageView addSubview:effectViewWhiteLeft];
        
//        UIVisualEffectView *effectViewWhiteRight = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
//        effectViewWhiteRight.frame = CGRectMake(self.messageView.width/2-0.5, self.messageView.height -48, self.messageView.width/2-0.5, 48);
//        effectViewWhiteRight.alpha = 1.0;
//        [self.messageView addSubview:effectViewWhiteRight];
       
        
        
        
        UIColor *firstColor = [UIColor blackColor];
        if (self.buttonsColorArray[0]) {
            firstColor = self.buttonsColorArray[0];
        }
        
        UIColor *secondColor = [UIColor redColor];
        if (self.buttonsColorArray[1]) {
            secondColor = self.buttonsColorArray[1];
        }

        UIButton  *firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
        firstButton.frame = CGRectMake(0, self.messageView.height - 48, self.messageView.width/2-0.5, 48);
        firstButton.tag                    = 10;
        firstButton.titleLabel.font        = [UIFont HeitiSCWithFontSize:16.f];
        [firstButton setTitle:self.buttonsTitleArray[0] forState:UIControlStateNormal];
        [firstButton setTitleColor:firstColor forState:UIControlStateNormal];
        [firstButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [firstButton addTarget:self action:@selector(messageButtonsEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self.messageView addSubview:firstButton];
        
        UIButton  *secondButton = [UIButton buttonWithType:UIButtonTypeCustom];
        secondButton.frame = CGRectMake(self.messageView.width/2-0.5, self.messageView.height - 48, self.messageView.width/2-0.5, 48);
        secondButton.tag                    = 11;
        secondButton.titleLabel.font        = [UIFont HeitiSCWithFontSize:16.f];
        [secondButton setTitle:self.buttonsTitleArray[1] forState:UIControlStateNormal];
        [secondButton setTitleColor:secondColor  forState:UIControlStateNormal];
        [secondButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [secondButton addTarget:self action:@selector(messageButtonsEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self.messageView addSubview:secondButton];
    }
    
    // 执行动画
    POPBasicAnimation  *alpha = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    alpha.toValue             = @(1.f);
    alpha.duration            = 0.3f;
    [self.messageView pop_addAnimation:alpha forKey:nil];
    
    POPSpringAnimation *scale = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scale.fromValue           = [NSValue valueWithCGSize:CGSizeMake(1.75f, 1.75f)];
    scale.toValue             = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
    scale.dynamicsTension     = 1000;
    scale.dynamicsMass        = 1.3;
    scale.dynamicsFriction    = 10.3;
    scale.springSpeed         = 20;
    scale.springBounciness    = 15.64;
    scale.delegate            = self;
    [self.messageView.layer pop_addAnimation:scale forKey:nil];
}

- (void)removeViews {
    
    [UIView animateWithDuration:0.2f animations:^{
        
        self.blackView.alpha       = 0.f;
        self.messageView.alpha     = 0.f;
        self.messageView.transform = CGAffineTransformMakeScale(0.75f, 0.75f);
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];
}

- (void)messageButtonsEvent:(UIButton *)button {
    
    if (button.tag == 10) {
        self.eventBlock(0);
    }
   
    if (button.tag == 11) {
        self.eventBlock(1);
    }
    
    [self removeViews];
    
}



@end
