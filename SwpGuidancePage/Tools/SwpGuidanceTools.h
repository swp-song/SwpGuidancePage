//
//  SwpGuidanceTools.h
//  swp_song
//
//  Created by swp_song on 16/5/27.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIButton, UIColor;

NS_ASSUME_NONNULL_BEGIN
@interface SwpGuidanceTools : NSObject

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
+ (void)swpGuidanceToolsCheckSwpGuidanceLastCell:(NSIndexPath *)cellIndexPath index:(NSInteger)index checkSuccess:(nullable void(^)())checkSuccess checkError:(nullable void(^)())checkError;
/*!
 *  @author swp_song
 *
 *  @brief  swpGuidanceToolsCheckAppVersion:appVersionSame:appVersionNotSame: ( 验证 App 版本 是否相同  )
 *
 *  @param  appVersionSame
 *
 *  @param  appVersionNotSame
 */
+ (void)swpGuidanceToolsCheckAppVersion:(nullable void(^)(NSString *version))appVersionSame appVersionNotSame:(nullable void(^)(NSString *appVersion, NSString *oldVersion))appVersionNotSame;

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
+ (void)setButton:(UIButton *)button setBackgroundColor:(UIColor *)backgroundColor setTitle:(NSString *)title setTitleColor:(UIColor *)titleColor titleFontSize:(float)fontSize;

@end
NS_ASSUME_NONNULL_END
