//
//  TextGradualChange.m
//  A-C
//
//  Created by 刘成利 on 2017/5/8.
//  Copyright © 2017年 刘成利. All rights reserved.
//

#import "TextGradualChangeController.h"
#import "LazyFadeInView.h"
#import "UIFont+Fonts.h"
#import "UIView+SetRect.h"

@interface TextGradualChangeController () <LazyFadeInViewDelegate>

@property (strong, nonatomic) LazyFadeInView *fadeInView;

@end

@implementation TextGradualChangeController

- (void)setup {
    [super setup];
    self.backgroundView.backgroundColor = [UIColor blackColor];
    
    self.fadeInView           = [[LazyFadeInView alloc] initWithFrame:CGRectMake(20, 20, Width - 40, self.contentView.height - 40)];
    self.fadeInView.delegate  = self;
    self.fadeInView.textColor = [UIColor whiteColor];
    self.fadeInView.text      = @"夫君子之行，静以修身，俭以养德。非淡泊无以明志，非宁静无以致远。夫学须静也，才须学也。非学无以广才，非志无以成学。韬慢则不能励精，险躁则不能冶性。年与时驰，意与日去，遂成枯落，多不接世。悲守穷庐，将复何及？";
    self.fadeInView.textFont  = [UIFont HeitiSCWithFontSize:14.f];
    [self.contentView addSubview:self.fadeInView];
}

- (void)fadeInAnimationDidEnd:(LazyFadeInView *)fadeInView {
    
    NSLog(@"%@ fade in animation completed.", fadeInView);
}
@end
