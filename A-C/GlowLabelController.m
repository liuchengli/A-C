//
//  GlowLabelController.m
//  A-C
//
//  Created by 刘成利 on 2017/2/8.
//  Copyright © 2017年 刘成利. All rights reserved.
//

#import "Header.h"
#import "GlowLabelController.h"
#import "GlowLabel.h"

@interface GlowLabelController ()

@end

@implementation GlowLabelController

- (void)setup {
    
    [super setup];

   
    self.contentView.backgroundColor = [UIColor blackColor];
    [self  show];
    

}

- (void)show{

    GlowLabel *glowLabel    = [[GlowLabel alloc] initWithFrame:CGRectMake(0, 200, ScreenWidth, 40)];
    [self.contentView addSubview:glowLabel];
    
    glowLabel.text            = @"红红火火";
    glowLabel.textAlignment   = NSTextAlignmentCenter;
    glowLabel.backgroundColor = [UIColor clearColor];
    glowLabel.font            = [UIFont fontWithName:@"Heiti SC" size:40.f];
    glowLabel.textColor       = [[UIColor redColor] colorWithAlphaComponent:0.95f];
    
    glowLabel.glowSize       = 6;
    glowLabel.glowColor      = [UIColor cyanColor];
    
    glowLabel.innerGlowSize  = 3;
    glowLabel.innerGlowColor = [[UIColor blackColor] colorWithAlphaComponent:0.25f];
    
    
    
    GlowLabel *glowLabel2    = [[GlowLabel alloc] initWithFrame:CGRectMake(0, 300, ScreenWidth, 40)];
    [self.contentView addSubview:glowLabel2];
    
    glowLabel2.text            = @"iOS开发 LiuChengLi";
    glowLabel2.textAlignment   = NSTextAlignmentCenter;
    glowLabel2.backgroundColor = [UIColor clearColor];
    glowLabel2.font            = [UIFont fontWithName:@"Heiti SC" size:30.f];
    glowLabel2.textColor       = [[UIColor cyanColor] colorWithAlphaComponent:0.95f];
    
    glowLabel2.glowSize       = 6;
    glowLabel2.glowColor      = [UIColor cyanColor];
    
    glowLabel2.innerGlowSize  = 3;
    glowLabel2.innerGlowColor = [[UIColor blackColor] colorWithAlphaComponent:0.25f];


}

@end
