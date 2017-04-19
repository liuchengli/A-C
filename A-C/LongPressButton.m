//
//  LongPressButton.m
//  ASR
//
//  Created by 刘成利 on 2017/3/2.
//  Copyright © 2017年 刘成利. All rights reserved.
//

#import "LongPressButton.h"

@interface LongPressButton ()



// 点击后的放大白圈
@property (nonatomic, strong) CAShapeLayer *clickCicrleLayer;


// 最后的旋转圈
@property (nonatomic, strong) CAShapeLayer *loadingLayer;

// 宽度的一般，控制贴边
@property (nonatomic, assign) CGFloat     halfWidth;

@end



@implementation LongPressButton

// 初始化
- (id)initWithFrame:(CGRect)frame
{
    // 获取最大宽高值为方形边长
    CGFloat square = CGRectGetWidth(frame) > CGRectGetHeight(frame) ? CGRectGetWidth(frame):CGRectGetHeight(frame);
    
    self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, square, square)];
    
    
    if (self)
    {
    
        [self setUp];
    
        
    }
    return self;
}
- (void)setUp{


    // 初始浅白色层
    CGFloat withValue = CGRectGetWidth(self.bounds);
    self.halfWidth    = withValue/2;
    

    // 1.放大白圈
    UIBezierPath *clickCicrlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, withValue, withValue)];
    self.clickCicrleLayer             = [CAShapeLayer layer];
    self.clickCicrleLayer.frame       = self.bounds;
    self.clickCicrleLayer.fillColor   = [[[UIColor blackColor]colorWithAlphaComponent:0.1] CGColor];
    self.clickCicrleLayer.path        = clickCicrlePath.CGPath;
    
    
    
    // 2. 麦克风图片
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(withValue/4, withValue/4, withValue/2, withValue/2)];
    image.image        = [UIImage imageNamed:@"mic"];
    
    
    [self.layer addSublayer:self.clickCicrleLayer];
    [self addSubview:image];
    
    // 3. 拖拽、长按、单击、双击手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(dragAction:)];
    [self addGestureRecognizer:pan];
    
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    longPressGesture.minimumPressDuration = 0.2;
    [self addGestureRecognizer:longPressGesture];
    
    UITapGestureRecognizer *oneTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(oneClick:)];
    oneTap.numberOfTapsRequired     = 1;
    oneTap.numberOfTouchesRequired  = 1;
    [self addGestureRecognizer:oneTap];
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubelClick:)];
    doubleTap.numberOfTapsRequired     = 2;
    doubleTap.numberOfTouchesRequired  = 1;
    [self addGestureRecognizer:doubleTap];
    
    [oneTap requireGestureRecognizerToFail:doubleTap];  

    
    
    // 4. 识别进度
    self.loadingLayer = [CAShapeLayer layer];
    self.loadingLayer.position = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    self.loadingLayer.fillColor = [UIColor clearColor].CGColor;
    self.loadingLayer.strokeColor = [UIColor whiteColor].CGColor;
    self.loadingLayer.lineWidth = 5;
    self.loadingLayer.opacity   = 0;
    
    CGFloat radius = self.bounds.size.height/2 - 3;
    UIBezierPath *loadingBezier = [UIBezierPath bezierPath];
    [loadingBezier addArcWithCenter:CGPointMake(0,0) radius:radius startAngle:M_PI/2 endAngle:M_PI/2+M_PI/2 clockwise:YES];
    self.loadingLayer.path = loadingBezier.CGPath;
    [self.layer addSublayer:self.loadingLayer];

    
}

// 响应事件
-(void)longPress: (UILongPressGestureRecognizer *)gesture {
    
    
    switch (gesture.state) {
            
        case UIGestureRecognizerStateBegan:
        {
            [self LongPressBegin]; // 开始长按
            NSLog(@"开始长按");
        }
            break;
            
        case UIGestureRecognizerStateEnded:
        {
            [self LongPressEnd];  // 结束长按
            NSLog(@"结束长按");
        }
            break;
            
            
        case UIGestureRecognizerStateChanged:
        {
          
            NSLog(@"长按改变");

        }
            break;
            
        case UIGestureRecognizerStateCancelled:
        {
            NSLog(@"长按取消");
        }
            break;
        default:
            break;
    }
    
    
}

#pragma mark  手势处理
// 单击事件
- (void)oneClick:(UITapGestureRecognizer *)sender{

    if (self.eventBlock)
    {
        self.eventBlock(oneTapTouch,0);
    }
       NSLog(@"单击事件");

}

// 双击事件
- (void)doubelClick:(UITapGestureRecognizer *)sender{

    if (self.eventBlock)
    {
        self.eventBlock(doubleTapTouch,0);
    }
    NSLog(@"双击事件");
}
// 开始长按
- (void)LongPressBegin{

    

    if (self.eventBlock)
    {
        self.eventBlock(LongTouchBegin,0);
    }

    
    if (self.loadingLayer) {
        [self.loadingLayer removeAnimationForKey:@"loadingAnimation"];
        self.loadingLayer.opacity = 0;
    }
    
    
    // 圆弧变大
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = 0.5; // 动画持续时间
    animation.repeatCount = LONG_MAX; // 重复次数
    animation.autoreverses = YES; // 动画结束时执行逆动画
    animation.fromValue = [NSNumber numberWithFloat:1]; // 开始时的倍率
    animation.toValue = [NSNumber numberWithFloat:1.8]; // 结束时的倍率
    [self.clickCicrleLayer addAnimation:animation forKey:@"scale-layer"];
    

}

// 结束长按
- (void)LongPressEnd{
    
    
    
    if (self.eventBlock)
    {
        self.eventBlock(LongTouchEnd,0);
    }
    
    [self.clickCicrleLayer removeAnimationForKey:@"scale-layer"];
    
    self.loadingLayer.opacity = 1;
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    basicAnimation.fromValue = @(0);
    basicAnimation.toValue = @(M_PI*2);
    basicAnimation.duration = 0.5;
    basicAnimation.repeatCount = LONG_MAX;
    [self.loadingLayer addAnimation:basicAnimation forKey:@"loadingAnimation"];

    
}



// 拖拽手势处理
- (void)dragAction:(UIPanGestureRecognizer *)sender
{
    //获取手势在屏幕上拖动的点
    CGPoint point=[sender translationInView:sender.self.view];
    //设置中心点
    sender.view.center=CGPointMake(sender.view.center.x+point.x, sender.view.center.y+point.y);
    //设置视图在父视图上拖拽的位置
    [sender setTranslation:CGPointZero inView:sender.self.view];//用来设置匀速运动
    
    NSLog(@"***拖拽事件响应= %f %f",point.x,point.y);
    
    // 处理滑动结束贴边
    if (sender.state == UIGestureRecognizerStateEnded){
        
        CGFloat screenWidth  = [UIScreen mainScreen].bounds.size.width;
        CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
        // 方形宽高相等
        CGFloat minX = self.halfWidth;
        CGFloat maxX = screenWidth-self.halfWidth;
        CGFloat minY = self.halfWidth;
        CGFloat maxY = screenHeight-self.halfWidth;
        
        CGFloat X = sender.view.center.x;
        CGFloat Y = sender.view.center.y;
        if (sender.view.center.x < minX) X = minX;
        if (sender.view.center.x > maxX) X = maxX;
        if (sender.view.center.y < minY) Y = minY;
        if (sender.view.center.y > maxY) Y = maxY;
        
        sender.view.center=CGPointMake(X, Y);
        //设置视图在父视图上拖拽的位置
        [sender setTranslation:CGPointZero inView:sender.self.view];//用来设置匀速运动

     NSLog(@"***结束拖拽***");
    }
    
    
    
}





// 停止loadiing,重置
- (void)finishAndRest{


    self.loadingLayer.opacity = 0;
    [self.loadingLayer removeAnimationForKey:@"loadingAnimation"];
    
    if(self.removeLoading == YES){
    
        [self.loadingLayer removeFromSuperlayer];
    }
   

}




@end
