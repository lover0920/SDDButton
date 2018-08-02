//
//  SDTextButton.h
//  LizhiRun
//
//  Created by 孙号斌 on 2018/4/16.
//  Copyright © 2018年 SX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SDTextButtonConfig : NSObject
+ (instancetype)defaultConfig;
@property (nonatomic, strong) UIFont *upFont;
@property (nonatomic, strong) UIColor *upTextColor;
@property (nonatomic, assign) NSTextAlignment upAlignment;

@property (nonatomic, strong) UIFont *downFont;
@property (nonatomic, strong) UIColor *downTextColor;
@property (nonatomic, assign) NSTextAlignment downAlignment;

@property (nonatomic, assign) NSInteger interval;

@property (nonatomic, copy, readonly) SDTextButtonConfig *(^fontConfig)(UIFont *font);
@property (nonatomic, copy, readonly) SDTextButtonConfig *(^textColorConfig)(UIColor *textColor);
@property (nonatomic, copy, readonly) SDTextButtonConfig *(^alignmentConfig)(NSTextAlignment alignment);
@property (nonatomic, copy, readonly) SDTextButtonConfig *(^downFontConfig)(UIFont *font);
@property (nonatomic, copy, readonly) SDTextButtonConfig *(^downTextColorConfig)(UIColor *textColor);
@property (nonatomic, copy, readonly) SDTextButtonConfig *(^downAlignmentConfig)(NSTextAlignment alignment);

@property (nonatomic, copy, readonly) SDTextButtonConfig *(^intervalConfig)(CGFloat interval);

@end

@interface SDTextButton : UIButton
@property (nonatomic, copy) NSString *upText;
@property (nonatomic, copy) NSString *downText;
@property (nonatomic, assign) BOOL haveRed;

- (void)updateLabelAttribute:(void(^)(SDTextButtonConfig *config))config;
@end
