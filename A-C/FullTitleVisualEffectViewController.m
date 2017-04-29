//
//  FullTitleVisualEffectViewController.m
//  Animations
//
//  Created by YouXianMing on 15/12/16.
//  Copyright © 2015年 YouXianMing. All rights reserved.
//

#import "FullTitleVisualEffectViewController.h"
#import "UIView+SetRect.h"
#import "UIFont+Fonts.h"

@interface FullTitleVisualEffectViewController ()

@property (nonatomic, strong) UIVisualEffectView *effectView;
@property (nonatomic, strong) UIVisualEffectView *vibrancyEffectView;

@end

@implementation FullTitleVisualEffectViewController

- (void)buildTitleView {

    [super buildTitleView];
    
    
    UIVisualEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    switch (self.TitleVisualEffect) {
        case blackEffect:
            effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
            break;
        case whiteEffect:
            effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
            break;
        case lightEffect:
            effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
            break;
            
        default:
             effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
            break;
    }
    
    // 添加模糊效果
    self.effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    self.effectView.frame                  = self.titleView.bounds;
    self.effectView.userInteractionEnabled = YES;
    [self.titleView addSubview:self.effectView];
    
    // 需要与作用的effectView的效果一致
    _vibrancyEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIVibrancyEffect effectForBlurEffect:(UIBlurEffect *)self.effectView.effect]];
    _vibrancyEffectView.frame = self.effectView.bounds;
    [self.effectView.contentView addSubview:self.vibrancyEffectView];
    
    // Back button.
    UIImage  *image      = [UIImage imageNamed:@"backIcon"];
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 64)];
    backButton.center    = CGPointMake(20, self.titleView.middleY+10);
    [backButton setImage:image forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(popSelf) forControlEvents:UIControlEventTouchUpInside];
    
    // Title label.
    UILabel *headlinelabel      = [UILabel new];
    headlinelabel.font          = [UIFont HeitiSCWithFontSize:20.f];
    headlinelabel.textAlignment = NSTextAlignmentCenter;
    headlinelabel.textColor     = [UIColor colorWithRed:0.329  green:0.329  blue:0.329 alpha:1];
    headlinelabel.text          = self.title;
    [headlinelabel sizeToFit];
//    headlinelabel.center        = self.titleView.middlePoint;
    headlinelabel.center        = CGPointMake(Width/2, self.titleView.height/2+10);
    [_vibrancyEffectView.contentView addSubview:backButton];
    [_vibrancyEffectView.contentView addSubview:headlinelabel];
}

- (void)popSelf {
    
    [self popViewControllerAnimated:YES];
}

@end
