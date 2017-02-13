//
//  AlertView.h
//  A-C
//
//  Created by 刘成利 on 2017/2/13.
//  Copyright © 2017年 刘成利. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertView : NSObject

+ (void)showAlertView:(UIView*)onView withText:(NSString*) string during:(NSTimeInterval)time;

@end
