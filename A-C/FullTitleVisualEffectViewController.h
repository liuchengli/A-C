//
//  FullTitleVisualEffectViewController.h
//  Animations
//
//  Created by YouXianMing on 15/12/16.
//  Copyright © 2015年 YouXianMing. All rights reserved.
//

#import "CustomFullContentViewController.h"
typedef enum {
    blackEffect = 10000,        // 黑色模糊
    whiteEffect,                // 白色模糊
    lightEffect                 // 亮白模糊
}EffectType;

@interface FullTitleVisualEffectViewController : CustomFullContentViewController

@property (nonatomic, assign) EffectType TitleVisualEffect;

@end
