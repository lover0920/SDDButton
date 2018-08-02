//
//  SDButton.h
//  TestButton
//
//  Created by 孙号斌 on 2017/1/6.
//  Copyright © 2017年 孙号斌. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SDButtonStyle) {
    SDButtonStyleNormal,    // 默认
    SDButtonStyleTop,       // 图标在上，文本在下(居中)
    SDButtonStyleLeft,
    SDButtonStyleRight,
};

@interface SDButton : UIButton
@property (nonatomic, assign) SDButtonStyle style;
@property (nonatomic, assign) CGFloat interval;     //图片和文字的间隔

@property (nonatomic, assign) CGFloat cornerRadius;

@end


@interface SDButton (SDInit)
+ (SDButton *)buttonWithFrame:(CGRect)frame
                        style:(SDButtonStyle)style
                     attTitle:(NSAttributedString *)attTitle;

+ (SDButton *)buttonWithFrame:(CGRect)frame
                        style:(SDButtonStyle)style
                        title:(NSString *)title
                         font:(UIFont *)font
                   titleColor:(UIColor *)titleColor;

+ (SDButton *)buttonWithFrame:(CGRect)frame
                        style:(SDButtonStyle)style
                        title:(NSString *)title
                         font:(UIFont *)font
                   titleColor:(UIColor *)titleColor
                    imageName:(NSString *)imageName;

+ (SDButton *)buttonWithFrame:(CGRect)frame
                        style:(SDButtonStyle)style
                        title:(NSString *)title
                         font:(UIFont *)font
                   titleColor:(UIColor *)titleColor
                backImageName:(NSString *)imageName;
@end
