//
//  SDButton.m
//  TestButton
//
//  Created by 孙号斌 on 2017/1/6.
//  Copyright © 2017年 孙号斌. All rights reserved.
//

#import "SDButton.h"

#define ButtonWidth     self.bounds.size.width
#define ButtonHeight    self.bounds.size.height

@implementation SDButton
#pragma mark - 重写setter方法
- (void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = cornerRadius;
}


#pragma mark - 重新布局subview
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    switch (_style)
    {
        case SDButtonStyleNormal:
            [self layoutSubviewsWithStyleNormal];
            break;
        case SDButtonStyleTop:
            [self layoutSubviewsWithStyleTop];
            break;
        case SDButtonStyleLeft:
            [self layoutSubviewsWithStyleLeft];
            break;
        case SDButtonStyleRight:
            [self layoutSubviewsWithStyleRight];
            break;
        default:
            [self layoutSubviewsWithStyleNormal];
            break;
    }
}




- (void)layoutSubviewsWithStyleNormal
{
    CGRect titleFrame = self.titleLabel.frame;
    CGRect imageFrame = self.imageView.frame;
    
    CGFloat subviewsWidth = CGRectGetWidth(titleFrame) + CGRectGetWidth(imageFrame);
    if (subviewsWidth+_interval <= ButtonWidth)
    {
        imageFrame.origin.x -= _interval/2;
        titleFrame.origin.x += _interval/2;
    }
    else
    {
        imageFrame.origin.x = 0;
        titleFrame.origin.x = ButtonWidth - CGRectGetWidth(titleFrame);
    }
    
    self.titleLabel.frame = titleFrame;
    self.imageView.frame = imageFrame;
}
- (void)layoutSubviewsWithStyleTop
{
    CGRect titleFrame = self.titleLabel.frame;
    CGRect imageFrame = self.imageView.frame;

    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    CGFloat subviewsHeight = CGRectGetHeight(titleFrame) + CGRectGetHeight(imageFrame);
    if (subviewsHeight+_interval <= ButtonHeight)
    {
        imageFrame.origin.x = (ButtonWidth - CGRectGetWidth(imageFrame)) / 2;
        imageFrame.origin.y = (ButtonHeight - subviewsHeight - _interval) / 2;
        
        titleFrame.origin.x = 0;
        titleFrame.origin.y = imageFrame.origin.y + CGRectGetHeight(imageFrame) + _interval;
        titleFrame.size.width = ButtonWidth;
    }
    else
    {
        imageFrame.origin.x = (ButtonWidth - CGRectGetWidth(imageFrame)) / 2;
        imageFrame.origin.y = 0;
        
        titleFrame.origin.x = 0;
        titleFrame.origin.y = ButtonHeight - CGRectGetHeight(titleFrame);
        titleFrame.size.width = ButtonWidth;
    }
    self.titleLabel.frame = titleFrame;
    self.imageView.frame = imageFrame;
}
- (void)layoutSubviewsWithStyleLeft
{
    CGRect titleFrame = self.titleLabel.frame;
    CGRect imageFrame = self.imageView.frame;
    
    imageFrame.origin.x = 0;
    titleFrame.origin.x = CGRectGetWidth(imageFrame) + _interval;
    
    self.titleLabel.frame = titleFrame;
    self.imageView.frame = imageFrame;
}
- (void)layoutSubviewsWithStyleRight
{
    CGRect titleFrame = self.titleLabel.frame;
    CGRect imageFrame = self.imageView.frame;
    
    imageFrame.origin.x = ButtonWidth-CGRectGetWidth(imageFrame);
    titleFrame.origin.x = ButtonWidth-CGRectGetWidth(imageFrame)-CGRectGetWidth(titleFrame)-_interval;
    
    self.titleLabel.frame = titleFrame;
    self.imageView.frame = imageFrame;
}

@end


@implementation SDButton (SDInit)
+ (SDButton *)buttonWithFrame:(CGRect)frame
                        style:(SDButtonStyle)style
                     attTitle:(NSAttributedString *)attTitle
{
    SDButton *button = [[SDButton alloc]initWithFrame:frame];
    button.style = style;
    [button setAttributedTitle:attTitle forState:UIControlStateNormal];
    return button;
}

+ (SDButton *)buttonWithFrame:(CGRect)frame
                        style:(SDButtonStyle)style
                        title:(NSString *)title
                         font:(UIFont *)font
                   titleColor:(UIColor *)titleColor
{
    SDButton *button = [[SDButton alloc]initWithFrame:frame];
    button.style = style;
    button.titleLabel.font = font;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    return button;
}

+ (SDButton *)buttonWithFrame:(CGRect)frame
                        style:(SDButtonStyle)style
                        title:(NSString *)title
                         font:(UIFont *)font
                   titleColor:(UIColor *)titleColor
                    imageName:(NSString *)imageName
{
    SDButton *button = [[SDButton alloc]initWithFrame:frame];
    button.style = style;
    button.titleLabel.font = font;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageName]
            forState:UIControlStateNormal];
    return button;
}

+ (SDButton *)buttonWithFrame:(CGRect)frame
                        style:(SDButtonStyle)style
                        title:(NSString *)title
                         font:(UIFont *)font
                   titleColor:(UIColor *)titleColor
                backImageName:(NSString *)imageName
{
    SDButton *button = [[SDButton alloc]initWithFrame:frame];
    button.style = style;
    button.titleLabel.font = font;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:imageName]
                      forState:UIControlStateNormal];
    return button;
}
@end
