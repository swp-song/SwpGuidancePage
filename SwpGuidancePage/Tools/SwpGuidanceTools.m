//
//  SwpGuidanceTools.m
//  swp_song
//
//  Created by swp_song on 16/5/27.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "SwpGuidanceTools.h"

#import <UIKit/UIKit.h>


@implementation SwpGuidanceTools

/*!
 *  @author swp_song
 *
 *  @brief  swpGuidanceToolsCheckSwpGuidanceLastCell:index:checkSuccess:checkError: ( 验证 是否 最后一个 cell )
 *
 *  @param  cellIndexPath
 *
 *  @param  index
 *
 *  @param  checkSuccess
 *
 *  @param  checkError
 */
+ (void)swpGuidanceToolsCheckSwpGuidanceLastCell:(NSIndexPath *)cellIndexPath index:(NSInteger)index checkSuccess:(void(^)())checkSuccess checkError:(void(^)())checkError {
    
    if (cellIndexPath.item == index) {
        if (checkSuccess) checkSuccess();
    } else {
        if (checkError) checkError();
    }
}


/*!
 *  @author swp_song
 *
 *  @brief  swpGuidanceToolsCheckAppVersion:appVersionSame:appVersionNotSame: ( 验证 App 版本 是否相同  )
 *
 *  @param  appVersionSame
 *
 *  @param  appVersionNotSame
 */
+ (void)swpGuidanceToolsCheckAppVersion:(void(^)(NSString *version))appVersionSame appVersionNotSame:(void(^)(NSString *appVersion, NSString *oldVersion))appVersionNotSame {
    static NSString * const kAppVersion = @"CFBundleVersion";
    // 取出 存储 UD 里的版本号
    NSUserDefaults *defaults   = [NSUserDefaults standardUserDefaults];
    NSString       *oldVersion = [defaults stringForKey:kAppVersion];
    
    // 取出系统当前 版本号
    NSString       *appVersion = [NSBundle mainBundle].infoDictionary[kAppVersion];
    if ([appVersion isEqualToString:oldVersion] && oldVersion != nil) {
        // 版本 相同
        if (appVersionSame) appVersionSame(appVersion);
    } else {
        // 版本 不同
        [defaults setObject:appVersion forKey:kAppVersion];
        [defaults synchronize];
        if (appVersionNotSame) appVersionNotSame(appVersion, oldVersion);
    }
}

/*!
 *  @author swp_song
 *
 *  @brief  setButton:setBackgroundColor:setTitle:setTitleColor:titleFontSize:  ( 快速 设置 一个 button )
 *
 *  @param  button
 *
 *  @param  backgroundColor
 *
 *  @param  title
 *
 *  @param  titleColor
 *
 *  @param  fontSize
 */
+ (void)setButton:(UIButton *)button setBackgroundColor:(UIColor *)backgroundColor setTitle:(NSString *)title setTitleColor:(UIColor *)titleColor titleFontSize:(float)fontSize {
    button.backgroundColor     = backgroundColor;
    button.layer.cornerRadius  = 3;
    button.layer.masksToBounds = YES;
    button.titleLabel.font     = [UIFont systemFontOfSize:fontSize];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateHighlighted];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
}


@end
