//
//  RollCell.h
//  A-C
//
//  Created by 刘成利 on 2017/5/9.
//  Copyright © 2017年 刘成利. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RollCell : UITableViewCell

/**
 *  图片imgView
 */
@property (nonatomic, strong) UIImageView * pictureView;

/**
 *  标题label
 */
@property (nonatomic, strong) UILabel * titleLabel;

/**
 *  内容Label
 */
@property (nonatomic, strong) UILabel * littleLabel;

/**
 *  遮挡的View
 */
@property (nonatomic, strong) UIView * coverview;

//cell的位移
- (CGFloat)cellOffset;

//设置图片
- (void)setImg:(UIImage *)img;


@end
