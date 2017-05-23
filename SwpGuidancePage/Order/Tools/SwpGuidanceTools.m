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

/**!
 *  @ author swp_song
 *
 *  @ brief  swpGuidanceToolsCheckSwpGuidanceLastCell:index:checkSuccess:checkError: ( 验证 是否 最后一个 cell )
 *
 *  @ param  cellIndexPath
 *
 *  @ param  index
 *
 *  @ param  checkSuccess
 *
 *  @ param  checkError
 */
+ (void)swpGuidanceToolsCheckSwpGuidanceLastCell:(NSIndexPath *)cellIndexPath index:(NSInteger)index checkSuccess:(void(^)())checkSuccess checkError:(void(^)())checkError {
    
    if (cellIndexPath.item == index) {
        if (checkSuccess) checkSuccess();
    } else {
        if (checkError) checkError();
    }
}


/**!
 *  @ author swp_song
 *
 *  @ brief  swpGuidanceToolsCheckAppVersion:appVersionSame:appVersionNotSame: ( 验证 App 版本 是否相同  )
 *
 *  @ param  appVersionSame
 *
 *  @ param  appVersionNotSame
 */
+ (void)swpGuidanceToolsCheckAppVersion:(void(^)(NSString *version))appVersionSame appVersionNotSame:(BOOL (^)(NSString *appVersion, NSString *oldVersion))appVersionNotSame {
    
    static NSString * const kSwpVersion = @"kSwpVersion";
    
    
    NSString *oldVersion         = [[self class] swpGuidanceToolsGetAppVersion:kSwpVersion];
    
    // 取出系统当前 版本号
    NSString *appVersion         = [[self class] swpGuidanceToolsCurrentVersion];
    
    //  版本 不同
    if ([oldVersion compare:appVersion options:NSNumericSearch] == NSOrderedAscending || oldVersion == nil) {
        
        if (appVersionNotSame) {
            BOOL isSaveAppVersion =  appVersionNotSame(appVersion, oldVersion);
            if (isSaveAppVersion)  [[self class] swpGuidanceToolsSaveAppVersion:kSwpVersion];
        }
        
        return;
    }
    
    //  版本 相同
    if (appVersionSame) appVersionSame(appVersion);
    
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpGuidanceToolsSetButton:setBackgroundColor:setTitle:setTitleColor:titleFontSize:  ( 快速 设置 一个 button )
 *
 *  @ param  button
 *
 *  @ param  backgroundColor
 *
 *  @ param  title
 *
 *  @ param  titleColor
 *
 *  @ param  fontSize
 */
+ (void)swpGuidanceToolsSetButton:(UIButton *)button setBackgroundColor:(UIColor *)backgroundColor setTitle:(NSString *)title setTitleColor:(UIColor *)titleColor titleFontSize:(float)fontSize {
    button.backgroundColor     = backgroundColor;
    button.layer.cornerRadius  = 3;
    button.layer.masksToBounds = YES;
    button.titleLabel.font     = [UIFont systemFontOfSize:fontSize];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateHighlighted];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
}
    
#pragma mark - NSBundle

/**!
 *  @ author swp_song
 *
 *  @ brief  swpGuidanceToolsCurrentVersion ( 取出 当前 App 版本号 )
 *
 *  @ return NSString
 */
+ (NSString *)swpGuidanceToolsCurrentVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}


/**!
 *  @ author swp_song
 *
 *  @ brief  swpGuidanceToolsGetAppVersion: ( 取出 保存 版本号  )
 *
 *  @ param  key
 *
 *  @ return NSString
 */
+ (NSString *)swpGuidanceToolsGetAppVersion:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] stringForKey:key];
}


/**!
 *  @ author swp_song
 *
 *  @ brief  swpGuidanceToolsSaveAppVersion:    (  保存 版本号  )

 *  @ param  key
 */
+ (void)swpGuidanceToolsSaveAppVersion:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setObject:[[self class] swpGuidanceToolsCurrentVersion] forKey:key];
}




@end
