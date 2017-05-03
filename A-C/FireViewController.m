//
//  FireViewController.m
//  A-C
//
//  Created by 刘成利 on 2017/5/3.
//  Copyright © 2017年 刘成利. All rights reserved.
//

#import "FireViewController.h"

@interface FireViewController ()

@property (nonatomic, strong) CAEmitterLayer *fireLayer;

@end

@implementation FireViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect viewBounds = self.view.layer.bounds;
    
    
    self.fireLayer	= [CAEmitterLayer layer];

    self.fireLayer.emitterPosition = CGPointMake(viewBounds.size.width/2.0, viewBounds.size.height - 60);
    self.fireLayer.emitterSize	= CGSizeMake(viewBounds.size.width/2.0, 0);
    self.fireLayer.emitterMode	= kCAEmitterLayerOutline;
    self.fireLayer.emitterShape	= kCAEmitterLayerLine;
    // with additive rendering the dense cell distribution will create "hot" areas
    self.fireLayer.renderMode		= kCAEmitterLayerAdditive;
    
    
    // Create the fire emitter cell
    CAEmitterCell* fire = [CAEmitterCell emitterCell];
    [fire setName:@"fire"];
    
    fire.birthRate			= 100;
    fire.emissionLongitude  = M_PI;
    fire.velocity			= -80;
    fire.velocityRange		= 30;
    fire.emissionRange		= 1.1;
    fire.yAcceleration		= -200;
    fire.scaleSpeed			= 0.3;
    fire.lifetime			= 50;
    fire.lifetimeRange		= (50.0 * 0.35);
    
    fire.color = [[UIColor colorWithRed:0.8 green:0.4 blue:0.2 alpha:0.1] CGColor];
    fire.contents = (id) [[UIImage imageNamed:@"DazFire"] CGImage];
    
    

    self.fireLayer.emitterCells	= [NSArray arrayWithObject:fire];
    [self.view.layer addSublayer:self.fireLayer];
    
    [self setFireAmount:0.9];
}



- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self controlFireHeight:event];
}


- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self controlFireHeight:event];
}


- (void) controlFireHeight:(UIEvent *)event
{
    UITouch *touch			= [[event allTouches] anyObject];
    CGPoint touchPoint		= [touch locationInView:self.view];
    float distanceToBottom	= self.view.bounds.size.height - touchPoint.y;
    float percentage		= distanceToBottom / self.view.bounds.size.height;
    percentage				= MAX(MIN(percentage, 1.0), 0.1);
    [self setFireAmount:2 *percentage];
}


- (void) setFireAmount:(float)zeroToOne
{
    // Update the fire properties
    [self.fireLayer setValue:[NSNumber numberWithInt:(zeroToOne * 500)]
                    forKeyPath:@"emitterCells.fire.birthRate"];
    [self.fireLayer setValue:[NSNumber numberWithFloat:zeroToOne]
                    forKeyPath:@"emitterCells.fire.lifetime"];
    [self.fireLayer setValue:[NSNumber numberWithFloat:(zeroToOne * 0.35)]
                    forKeyPath:@"emitterCells.fire.lifetimeRange"];
    self.fireLayer.emitterSize = CGSizeMake(50 * zeroToOne, 0);
   
}

@end
