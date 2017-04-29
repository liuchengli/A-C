
#import <QuartzCore/QuartzCore.h>

@interface CALayer (Anim)

/*
 *  左右摇动动画
 */
-(void)shake;

/*
 *  闪烁动画
 */
- (void)flash:(float)duration repeat:(float)repeatCount;

/*
 *  微放大动画
 */
- (void)scale:(float)scaleValue repeat:(float)repeatCount;


/*
 * 阴影闪烁
 */
- (void)shadowsFlash:(float)duration repeat:(float)repeatCount;
@end
