//
//  PopView.h
//  testDemo
//
//  Created by admin on 16/3/29.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PoPDetialViewDelegate <NSObject>

@required
-(void)setButtonTitle:(NSString *)title BackgroundColor:(UIColor *)bgColor;

@end

@interface PopView : UIView

+ (void)setButtonWithBlock:(void (^)(id<PoPDetialViewDelegate> button))buttonBlock pushViewController:(void (^)())pushBlock;

@end
