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

/**
 *  @author swp_song
 *
 *  @brief  swpGuidanceToolsCheckSwpGuidanceLastCell:index:checkSuccess:checkError: ( 验证是否，最后一个 Cell )
 *
 *  @param  cellIndexPath       cellIndexPath
 *
 *  @param  index               index
 *
 *  @param  checkSuccess        checkSuccess
 *
 *  @param  checkError          checkError
 */
+ (void)swpGuidanceToolsCheckSwpGuidanceLastCell:(NSIndexPath *)cellIndexPath index:(NSInteger)index checkSuccess:(void(^ _Nullable)(void))checkSuccess checkError:(void(^ _Nullable)(void))checkError;

/**
 *  @author swp_song
 *
 *  @brief  swpGuidanceToolsCheckAppVersion:appVersionSame:appVersionNotSame: ( 验证 App 版本是否相同  )
 *
 *  @param  appVersionSame      appVersionSame
 *
 *  @param  appVersionNotSame   appVersionNotSame
 */
+ (void)swpGuidanceToolsCheckAppVersion:(void(^ _Nullable)(NSString *version))appVersionSame appVersionNotSame:(BOOL (^ _Nullable)(NSString *appVersion, NSString *oldVersion))appVersionNotSame;

/**
 *  @author swp_song
 *
 *  @brief  swpGuidanceToolsSetButton:setBackgroundColor:setTitle:setTitleColor:titleFontSize:  ( 快速设置一个 button )
 *
 *  @param  button          button
 *
 *  @param  backgroundColor backgroundColor
 *
 *  @param  title           title
 *
 *  @param  titleColor      titleColor
 *
 *  @param  fontSize        fontSize
 */
+ (void)swpGuidanceToolsSetButton:(UIButton *)button setBackgroundColor:(UIColor *)backgroundColor setTitle:(NSString *)title setTitleColor:(UIColor *)titleColor titleFontSize:(float)fontSize;

@end
NS_ASSUME_NONNULL_END
