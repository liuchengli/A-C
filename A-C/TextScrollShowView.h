//
//  TextScrollShowView.h
//  AlertView
//
//  Created by 刘成利 on 2017/2/24.
//  Copyright © 2017年 刘成利. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextScrollShowView : UIView

@property (nonatomic, strong) NSString* textString;

- (void)showOnView:(UIView*)contentView;

@end
