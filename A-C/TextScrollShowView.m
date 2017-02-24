//
//  TextScrollShowView.m
//  AlertView
//
//  Created by 刘成利 on 2017/2/24.
//  Copyright © 2017年 刘成利. All rights reserved.
//

#import "TextScrollShowView.h"
#import "UIFont+Fonts.h"
#import "UIView+SetRect.h"
#import "POP.h"

@interface TextScrollShowView ()

@property (nonatomic, strong) UIView* backgroundView;

@end



@implementation TextScrollShowView

- (instancetype)init {
    
    if (self) {
        
        self = [super init];
//        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3f];
        
        
        
    }
    
    return self;
}


- (void)showOnView:(UIView*)contentView{

    if (!contentView){
    
        return;
    }
    
    self.backgroundView = [[UIView alloc] initWithFrame:CGRectMake(50, 100, Width-100, 400)];
    self.backgroundView.clipsToBounds      = YES;
    self.backgroundView.layer.cornerRadius = 10;
      // iOS8及以上支持此模糊
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    blurView.frame = self.backgroundView.bounds;
    blurView.alpha = 1;
   
    [self addSubview:self.backgroundView];
    [self.backgroundView addSubview:blurView];
    
 
   
    
    
    
    UILabel *titleLabel      = [[UILabel alloc] initWithFrame:CGRectMake(0, 8, self.backgroundView.width, 32)];
    titleLabel.text          = @"温馨提示";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font          = [UIFont HeitiSCWithFontSize:17];
    titleLabel.textColor     = [[UIColor redColor]colorWithAlphaComponent:0.75f];
    [self.backgroundView addSubview:titleLabel];
  
    
    
    UIScrollView *contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(20, titleLabel.bottom + 6, self.backgroundView.width - 40, self.backgroundView.height - titleLabel.height - 60)];
    contentScrollView.contentSize = CGSizeMake(contentScrollView.width, contentScrollView.height);
    contentScrollView.tag = 1000;
//    contentScrollView.showsVerticalScrollIndicator = NO;
    [self.backgroundView addSubview:contentScrollView];
    
    //内容文案
    
        
    NSMutableParagraphStyle *paragraphStyle1 = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle1 setLineSpacing:5];//调整行间距
    
    NSDictionary *attributes1 = @{ NSFontAttributeName:[UIFont HeitiSCWithFontSize:14.f], NSParagraphStyleAttributeName:paragraphStyle1, NSForegroundColorAttributeName:[UIColor blackColor]};
    NSAttributedString  *attributedString = [[NSAttributedString alloc]initWithString:self.textString attributes:attributes1];
    CGFloat height = [self attributeStringHeightWithWidth:contentScrollView.width andText:attributedString];
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, contentScrollView.width, height+20)];
    textLabel.backgroundColor = [UIColor clearColor];
    textLabel.attributedText =attributedString;
    textLabel.numberOfLines = 0;
    textLabel.font = [UIFont HeitiSCWithFontSize:14];
    textLabel.textColor = [[UIColor blackColor]colorWithAlphaComponent:0.7];
    [contentScrollView addSubview:textLabel];
    contentScrollView.contentSize = CGSizeMake(contentScrollView.width, textLabel.bottom);
    

    //我知道了按钮  ******此处可以替换为【叉号】********
    
    UIButton *but = [[UIButton alloc] initWithFrame:CGRectMake(0, self.backgroundView.height - 40 ,self.backgroundView.width , 40)];
    [but setTitle:@"我知道了" forState:UIControlStateNormal];
    [but setTitleColor:[[UIColor redColor] colorWithAlphaComponent:0.7] forState:UIControlStateNormal];
    but.titleLabel.font = [UIFont HeitiSCWithFontSize:18];
    [but addTarget:self action:@selector(closeAlertView) forControlEvents:UIControlEventTouchUpInside];
    [self.backgroundView addSubview:but];
    
    [contentView addSubview:self];
    
    
    
    POPSpringAnimation *scale = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scale.fromValue           = [NSValue valueWithCGSize:CGSizeMake(1.75f, 1.75f)];
    scale.toValue             = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
    scale.dynamicsTension     = 1000;
    scale.dynamicsMass        = 1.3;
    scale.dynamicsFriction    = 10.3;
    scale.springSpeed         = 20;
    scale.springBounciness    = 15.64;
    [self.backgroundView.layer pop_addAnimation:scale forKey:nil];

  


}



- (CGFloat)attributeStringHeightWithWidth:(CGFloat)width andText:(NSAttributedString *)string{
    
    CGFloat height = 0;
    
    if (string.length > 0) {
        
        CGSize rectSize = [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                             options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading |NSStringDrawingUsesLineFragmentOrigin
                                             context:nil].size;
        
        height = rectSize.height;
    }
    
    return height;
    
}

- (void)closeAlertView{


    [UIView animateWithDuration:0.1 animations:^{
        
        self.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];

}
@end
