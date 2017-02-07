//
//  UIView+AnimationsListViewController.m
//  Animations
//
//  Created by YouXianMing on 16/3/25.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import "UIView+AnimationsListViewController.h"
#import "UIFont+Fonts.h"

@implementation UIView (AnimationsListViewController)

+ (UILabel *)animationsListViewControllerNormalHeadLabel {

    // Title label.
    UILabel *headlinelabel                      = [UILabel new];
    headlinelabel.font                          = [UIFont AvenirLightWithFontSize:20.f];
    headlinelabel.textAlignment                 = NSTextAlignmentCenter;
    headlinelabel.textColor                     = [UIColor colorWithRed:0.329  green:0.329  blue:0.329 alpha:1];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"Animations-Charts"];
    headlinelabel.attributedText                = attributedString;
    [headlinelabel sizeToFit];
    
    return headlinelabel;
}

+ (UILabel *)animationsListViewControllerHeadLabel {
    
    // Title label.
    UILabel *headlinelabel                      = [UILabel new];
    headlinelabel.font                          = [UIFont AvenirLightWithFontSize:20.f];
    headlinelabel.textAlignment                 = NSTextAlignmentCenter;
    NSString *showString                        = @"Animations-Charts";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:showString];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor clearColor] range:NSMakeRange(0, showString.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0.203  green:0.598  blue:0.859 alpha:1]
                             range:NSMakeRange(0, 1)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0.203  green:0.598  blue:0.859 alpha:1]
                             range:NSMakeRange(11, 1)];
    headlinelabel.attributedText                = attributedString;
    [headlinelabel sizeToFit];
    
    return headlinelabel;
}

@end
