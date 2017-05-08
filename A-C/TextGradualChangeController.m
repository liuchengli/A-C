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
    self.fadeInView.text      = @"夫君子之行，静以修身，俭以养德。非淡泊无以明志，非宁静无以致远。夫学须静也，才须学也。非学无以广才，非志无以成学。韬慢则不能励精，险躁则不能冶性。年与时驰，意与日去，遂成枯落，多不接世。悲守穷庐，将复何及？\n\n卿生于苏杭，我葬身北邙；\n卿说江南好风光，我却长眠在洛阳。\n卿喜舞霓裳，我厌做帝皇；\n卿说梅雨过潇湘，我却哀怨世道凉。\n\n卿生于苏杭，我葬身北邙；\n卿说挥军进咸阳，我便火烧宫阿房。\n卿喜着男装，我为楚霸王；\n卿说奈何弃娇娘，我便自刎绝乌江。\n\n卿生于苏杭，我葬身北邙；\n卿说家住水墨庄，我却骨枯已沦亡。\n卿喜点粉妆，我放逸情狂；\n卿说唇抹胭脂烫，我却长吻把命丧。\n\n卿生于苏杭，我葬身北邙；\n卿说蝴蝶影成双，我便断翼同翱翔。\n卿喜怒无常，我风流倜傥；\n卿说花败亦非伤，我便残红染泥香。";
    self.fadeInView.textFont  = [UIFont HeitiSCWithFontSize:14.f];
    [self.contentView addSubview:self.fadeInView];
}

- (void)fadeInAnimationDidEnd:(LazyFadeInView *)fadeInView {
    
    NSLog(@"%@ fade in animation completed.", fadeInView);
}
@end
