#import <UIKit/UIKit.h>
#import "CALayer+Anim.h"

@implementation CALayer (Anim)


/*
 *  摇动
 */
-(void)shake{
    
    CAKeyframeAnimation *kfa = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    
    CGFloat s = 5;
    
    kfa.values = @[@(-s),@(0),@(s),@(0),@(-s),@(0),@(s),@(0)];
    
    //时长
    kfa.duration = 0.3f;
    
    //重复
    kfa.repeatCount = 2;
    
    //移除
    kfa.removedOnCompletion = YES;
    
    [self addAnimation:kfa forKey:@"shake"];
}

- (void)flash:(float)duration repeat:(float)repeatCount{
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];//必须写opacity才行。
        animation.fromValue = [NSNumber numberWithFloat:1.0f];
        animation.toValue = [NSNumber numberWithFloat:0.0f];//这是透明度。
        animation.autoreverses = YES;
        animation.duration = duration;
        animation.repeatCount = repeatCount;
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;
        animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];///没有的话是均匀的动画。
        
    
         [self addAnimation:animation forKey:@"opacity"];
    

}

- (void)scale:(float)scaleValue repeat:(float)repeatCount{

    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue = [NSNumber numberWithFloat:1.0f];
    animation.toValue = [NSNumber numberWithFloat:scaleValue];
    animation.autoreverses = YES;
    animation.repeatCount = repeatCount;
    animation.duration = 0.1;//不设置时候的话，有一个默认的缩放时间.
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
     [self addAnimation:animation forKey:@"scale"];



}

- (void)shadowsFlash:(float)duration repeat:(float)repeatCount{

    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"shadowColor"];
    anim.fromValue  = (__bridge id _Nullable)([UIColor clearColor].CGColor);
    anim.toValue    = (__bridge id _Nullable)([UIColor redColor].CGColor);
    anim.duration   = duration;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    anim.repeatCount = repeatCount;
    anim.autoreverses = YES;
    [self addAnimation:anim forKey:@"shadow"];

}

- (void)colorFlash:(float)duration repeat:(float)repeatCount{


    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    anim.fromValue  = (__bridge id _Nullable)self.backgroundColor;
    anim.toValue    = (__bridge id _Nullable)([UIColor redColor].CGColor);
    anim.duration   = duration;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    anim.repeatCount = repeatCount;
    anim.autoreverses = YES;
    [self addAnimation:anim forKey:@"shadow"];

    

}

@end
