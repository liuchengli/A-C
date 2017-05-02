//
//  ViewInsidePopController.m
//  A-C
//
//  Created by 刘成利 on 2017/4/06.
//  Copyright © 2017年 刘成利. All rights reserved.
//

#import "ViewInsidePopController.h"

@interface ViewInsidePopController ()

@property (nonatomic, strong) UIView  *buttomView;   // 底部白色view
@property (nonatomic, strong) UIView  *topView;      // 弹出的view

@property (nonatomic, assign) BOOL  isShowTopView;   // 标记是否弹出


@end

@implementation ViewInsidePopController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    self.view.backgroundColor = [UIColor blackColor];
    self.titleView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3]; //导航栏背景色
    
    
    self.buttomView = [[UIView alloc]initWithFrame:self.view.bounds];
    self.buttomView.backgroundColor = [UIColor cyanColor];
    [self.backgroundView addSubview:self.buttomView];
    
    {
        
        UILabel *label   = [[UILabel alloc]initWithFrame:CGRectMake(0, 200, self.contentView.frame.size.width, 50)];
        label.textColor     = [UIColor whiteColor];
        label.text          = @"请点屏幕看效果！";
        label.textAlignment = NSTextAlignmentCenter;
        [self.buttomView addSubview:label];
        
    }

    
    // 半黑透明
    UIView * maskView = [[UIView alloc]initWithFrame:self.view.bounds];
    maskView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    maskView.alpha = 0;
    maskView.tag   = 1000;
    [self.buttomView addSubview:maskView];

    
    
    // 初始化 弹出窗口
    self.topView = [[UIView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height /2.0)];
    
    self.topView.backgroundColor = [UIColor whiteColor];
    
    //加个阴影
    self.topView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.topView.layer.shadowOffset = CGSizeMake(0.5, 0.5);
    self.topView.layer.shadowOpacity = 0.8;
    self.topView.layer.shadowRadius = 5;

    
    //关闭btn
    UIButton * closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    closeBtn.frame = CGRectMake(15, 0, 50, 40);
    [closeBtn setTitle:@"关闭" forState:UIControlStateNormal];
    [closeBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [self.topView addSubview:closeBtn];
    
    
    

}

// 展现
- (void)show{
    
    self.isShowTopView = YES;
    self.titleView.hidden = YES;
    
    
    UIWindow  *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self.topView];
    
    CGRect frame = self.topView.frame;
    frame.origin.y = self.view.frame.size.height/2.0;
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        [self.backgroundView.layer setTransform:[self firstTransform]];
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            [self.backgroundView.layer setTransform:[self secondTransform]];
            //显示maskView
            UIView *maskView = [self.view viewWithTag:1000];
            [maskView setAlpha:0.5f];
            //popView上升
            self.topView.frame = frame;
            
        } completion:^(BOOL finished) {
            
        }];
        
    }];



}

- (CATransform3D)firstTransform{
    CATransform3D t1 = CATransform3DIdentity;
    t1.m34 = 1.0/-900;
    //带点缩小的效果
    t1 = CATransform3DScale(t1, 0.95, 0.95, 1);
    //绕x轴旋转
    t1 = CATransform3DRotate(t1, 15.0 * M_PI/180.0, 1, 0, 0);
    return t1;
    
}

- (CATransform3D)secondTransform{
    
    CATransform3D t2 = CATransform3DIdentity;
    t2.m34 = [self firstTransform].m34;
    //向上移
    t2 = CATransform3DTranslate(t2, 0, self.view.frame.size.height * (-0.08), 0);
    //第二次缩小
    t2 = CATransform3DScale(t2, 0.8, 0.8, 1);
    return t2;
}


// 关闭
- (void)close{

        
        CGRect frame = self.topView.frame;
        frame.origin.y += self.view.frame.size.height/2.0;
        
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            //maskView隐藏
            UIView *maskView = [self.view viewWithTag:1000];
            [maskView setAlpha:0.0f];
            //popView下降
            self.topView.frame = frame;
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                //变为初始值
                [self.backgroundView.layer setTransform:CATransform3DIdentity];
                
            } completion:^(BOOL finished) {
                
                //移除
                [self.topView removeFromSuperview];
                self.isShowTopView = NO;
                self.titleView.hidden = NO;
              
            }];
            
        }];
        
        
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            //和上个动画同时进行 感觉更丝滑
            [self.backgroundView.layer setTransform:[self firstTransform]];
            
        } completion:^(BOOL finished) {
            
            
            
        }];
        
        
    


}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    if (self.isShowTopView == NO) {
        
        [self show];
    }
    
    
}

@end
