//
//  SDTextButton.m
//  LizhiRun
//
//  Created by 孙号斌 on 2018/4/16.
//  Copyright © 2018年 SX. All rights reserved.
//

#import "SDTextButton.h"

@implementation SDTextButtonConfig
+ (instancetype)defaultConfig
{
    SDTextButtonConfig *config = [[SDTextButtonConfig alloc] init];
    config.upFont = UIFont(18);
    config.upTextColor = UIColorTitle1;
    config.upAlignment = NSTextAlignmentCenter;
    
    config.downFont = UIFont(12);
    config.downTextColor = UIColorTitle3;
    config.downAlignment = NSTextAlignmentCenter;
    config.interval = 4;
    return config;
}

#pragma mark - getter方法
- (SDTextButtonConfig *(^)(UIFont *))fontConfig
{
    return ^(UIFont *font){
        self.upFont = font;
        return self;
    };
}
- (SDTextButtonConfig *(^)(UIColor *))textColorConfig
{
    return ^(UIColor *color){
        self.upTextColor = color;
        return self;
    };
}
- (SDTextButtonConfig *(^)(NSTextAlignment))alignmentConfig
{
    return ^(NSTextAlignment alignment){
        self.upAlignment = alignment;
        return self;
    };
}
- (SDTextButtonConfig *(^)(UIFont *))downFontConfig
{
    return ^(UIFont *font){
        self.downFont = font;
        return self;
    };
}
- (SDTextButtonConfig *(^)(UIColor *))downTextColorConfig
{
    return ^(UIColor *color){
        self.downTextColor = color;
        return self;
    };
}
- (SDTextButtonConfig *(^)(NSTextAlignment))downAlignmentConfig
{
    return ^(NSTextAlignment alignment){
        self.downAlignment = alignment;
        return self;
    };
}
- (SDTextButtonConfig *(^)(CGFloat))intervalConfig
{
    return ^(CGFloat interval){
        self.interval = interval;
        return self;
    };
}

@end


@interface SDTextButton()
@property (nonatomic, strong) UILabel *upLabel;
@property (nonatomic, strong) UILabel *downLabel;
@property (nonatomic, strong) UIImageView *redView;

@property (nonatomic, strong) SDTextButtonConfig *config;
@end
@implementation SDTextButton
#pragma mark - 初始化方法
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}
- (void)createUI
{
    /*************** 初始化配置 ***************/
    _config = [SDTextButtonConfig defaultConfig];
    
    /*************** 初始化upLabel ***************/
    _upLabel = [UILabel lableWithFrame:CGRectMake(0, 0, self.width, 10)
                             textColor:self.config.upTextColor
                                  font:self.config.upFont
                             alignment:self.config.upAlignment];
    _upLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:_upLabel];
    
    /*************** 初始化downLabel ***************/
    _downLabel = [UILabel lableWithFrame:CGRectMake(0, 0, self.width, 10)
                               textColor:self.config.downTextColor
                                    font:self.config.downFont
                               alignment:self.config.downAlignment];
    _downLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:_downLabel];
    
    /*************** 初始化红点 ***************/
    _redView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 4, 4)];
    _redView.hidden = YES;
    _redView.userInteractionEnabled = YES;
    [self addSubview:_redView];
    //图片
    UIGraphicsBeginImageContextWithOptions(_redView.bounds.size, NO, [UIScreen mainScreen].scale);
    [[UIBezierPath bezierPathWithRoundedRect:_redView.bounds cornerRadius:2.0] addClip];
    [[UIImage imageWithColor:[UIColor redColor]] drawInRect:_redView.bounds];
    _redView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    /*************** 设置Label位置 ***************/
    [self setupLabelsFrame];
}
#pragma mark - setter方法
- (void)setUpText:(NSString *)upText
{
    _upText = upText;
    _upLabel.text = upText;
    
    CGFloat width = [NSString sizeOfString:upText attributes:@{NSFontAttributeName:self.config.upFont} width:self.width].width;
    _redView.frame = CGRectMake((self.width-width)/2+width+2, _upLabel.top-2, 4, 4);
}
- (void)setDownText:(NSString *)downText
{
    _downText = downText;
    _downLabel.text = downText;
}
- (void)setHaveRed:(BOOL)haveRed
{
    _haveRed = haveRed;
    if (haveRed)
        _redView.hidden = NO;
    else
        _redView.hidden = YES;
}
#pragma mark - 更新Label样式
- (void)updateLabelAttribute:(void(^)(SDTextButtonConfig *config))config
{
    if (config) {
        config(self.config);
    }
    /*************** 设置upLabel属性 ***************/
    _upLabel.font = self.config.upFont;
    _upLabel.textColor = self.config.upTextColor;
    _upLabel.textAlignment = self.config.upAlignment;
    
    /*************** 设置downLabel属性 ***************/
    _downLabel.font = self.config.downFont;
    _downLabel.textColor = self.config.downTextColor;
    _downLabel.textAlignment = self.config.downAlignment;
    
    /*************** 设置Label位置 ***************/
    [self setupLabelsFrame];
}
//设置Label位置
- (void)setupLabelsFrame
{
    /*************** 求Label的高 ***************/
    CGFloat upHeight = [NSString sizeOfString:@"000" attributes:@{NSFontAttributeName:self.config.upFont} width:self.width].height;
    
    CGFloat downHeight = [NSString sizeOfString:@"000" attributes:@{NSFontAttributeName:self.config.downFont} width:self.width].height;
    
    CGFloat up = (self.height - upHeight - downHeight - self.config.interval)/2;
    
    /*************** 设置Label的位置 ***************/
    _upLabel.top = up;
    _upLabel.height = upHeight;
    
    _downLabel.top = up + upHeight + self.config.interval;
    _downLabel.height = downHeight;
}

@end
