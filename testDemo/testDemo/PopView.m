//
//  PopView.m
//  testDemo
//
//  Created by admin on 16/3/29.
//  Copyright © 2016年 admin. All rights reserved.
//
#define iPhoneW [UIScreen mainScreen].bounds.size.width
#define iPhoneH [UIScreen mainScreen].bounds.size.height
#define DetailViewMargin 20
#define DetailViewH iPhoneH * 0.4


#import "PopView.h"

#pragma mark - PopDetialView

@interface PopDetialView : UIView<PoPDetialViewDelegate>

@property (strong, nonatomic) UIButton *button;
@property (nonatomic) UIColor *color;
@end

@implementation PopDetialView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        _button = [UIButton buttonWithType:UIButtonTypeSystem];
        [self addSubview: _button];
    };
    return self;
}

- (void)setButtonTitle:(NSString *)title BackgroundColor:(UIColor *)bgColor {
    [_button setTitle:title forState:UIControlStateNormal];
    [_button setBackgroundColor:bgColor];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat ButtonWH = 50;
    CGFloat ButtonCenterX = (self.frame.size.width - ButtonWH)/2;
    CGFloat ButtonCenterY = (self.frame.size.height - ButtonWH)/2;
    _button.frame = CGRectMake(ButtonCenterX, ButtonCenterY, ButtonWH, ButtonWH);

}

@end


#pragma mark - PopView

@interface PopView ()
@property (strong, nonatomic) PopDetialView *detialView;
@property (copy, nonatomic) void (^pushBlock)();
@end

@implementation PopView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        _detialView = [[PopDetialView alloc]init];
        _detialView.layer.cornerRadius = 15;
        _detialView.clipsToBounds = YES;
        _detialView.backgroundColor = [UIColor whiteColor];
        [_detialView.button addTarget:self action:@selector(clickPushButton) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview: _detialView];
    };
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _detialView.frame = CGRectMake(0, 0, iPhoneW - DetailViewMargin, DetailViewH);
    _detialView.center = self.center;
    
}

+ (void)setButtonWithBlock:(void (^)(id<PoPDetialViewDelegate>))buttonBlock pushViewController:(void (^)())pushBlock {
    PopView *pop = [[PopView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:pop];
    [pop setButtonWithBlock:buttonBlock pushViewController:pushBlock];
}

- (void)setButtonWithBlock:(void (^)(id<PoPDetialViewDelegate>))buttonBlock pushViewController:(void (^)())pushBlock {
    self.pushBlock = pushBlock;
    buttonBlock(self.detialView);
}

- (void)clickPushButton {
    self.pushBlock();
    [self dismiss];
}

- (void)dismiss {
    [self removeFromSuperview];
}

@end
