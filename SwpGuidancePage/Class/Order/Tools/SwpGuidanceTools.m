//
//  SwpGuidanceTools.m
//  swp_song
//
//  Created by swp_song on 16/5/27.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "SwpGuidanceTools.h"

@import UIKit;

@implementation SwpGuidanceTools

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
+ (void)swpGuidanceToolsCheckSwpGuidanceLastCell:(NSIndexPath *)cellIndexPath index:(NSInteger)index checkSuccess:(void(^ )(void))checkSuccess checkError:(void(^)(void))checkError {
    
    if (cellIndexPath.item == index) {
        if (checkSuccess) checkSuccess();
    } else {
        if (checkError) checkError();
    }
}


/**
 *  @author swp_song
 *
 *  @brief  swpGuidanceToolsCheckAppVersion:appVersionSame:appVersionNotSame: ( 验证 App 版本是否相同  )
 *
 *  @param  appVersionSame      appVersionSame
 *
 *  @param  appVersionNotSame   appVersionNotSame
 */
+ (void)swpGuidanceToolsCheckAppVersion:(void(^)(NSString *version))appVersionSame appVersionNotSame:(BOOL (^)(NSString *appVersion, NSString *oldVersion))appVersionNotSame {
    
    static NSString * const kSwpVersion = @"kSwpVersion";
    
    //  取出缓存版本号
    NSString *cacheVersion  = [self.class swpGuidanceToolsGetAppVersion:kSwpVersion];
    
    // 取出系统当前版本号
    NSString *appVersion    = [self.class swpGuidanceToolsCurrentVersion];
    
    //  版本不同
    if ([cacheVersion compare:appVersion options:NSNumericSearch] == NSOrderedAscending || cacheVersion == nil) {
        
        if (appVersionNotSame) {
            BOOL isSaveAppVersion =  appVersionNotSame(appVersion, cacheVersion);
            if (isSaveAppVersion)  [self.class swpGuidanceToolsSaveAppVersion:kSwpVersion];
        }
        
        return;
    }
    
    //  版本相同
    if (appVersionSame) appVersionSame(appVersion);
    
}

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



/**
 *  @author swp_song
 *
 *  @brief  swpGuidanceToolsReadInfo    ( 读取 SwpGuidanceTools 信息资源文件 )
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swpGuidanceToolsReadInfo {
    return [NSDictionary dictionaryWithContentsOfFile:[NSBundle.mainBundle pathForResource:@"SwpGuidancePage.bundle/SwpGuidancePage.plist" ofType:nil]].copy;
}


/**
 *  @author swp_song
 *
 *  @brief  swpGuidanceToolsReadVersion ( 读取 SwpGuidanceTools 版本号 )
 *
 *  @return NSString
 */
+ (NSString *)swpGuidanceToolsReadVersion {
    return [self.class swpGuidanceToolsReadInfo][@"Version"];
}


    
#pragma mark - NSBundle

/**
 *  @author swp_song
 *
 *  @brief  swpGuidanceToolsCurrentVersion ( 取出 当前 App 版本号 )
 *
 *  @return NSString
 */
+ (NSString *)swpGuidanceToolsCurrentVersion {
    
#if DEBUG
    return [NSBundle.mainBundle objectForInfoDictionaryKey:@"CFBundleVersion"];
#else
    return [NSBundle.mainBundle objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
#endif
    
}


/**
 *  @author swp_song
 *
 *  @brief  swpGuidanceToolsGetAppVersion: ( 取出 保存 版本号  )
 *
 *  @param  key key
 *
 *  @return NSString
 */
+ (NSString *)swpGuidanceToolsGetAppVersion:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] stringForKey:key];
}


/**
 *  @author swp_song
 *
 *  @brief  swpGuidanceToolsSaveAppVersion:    (  保存 版本号  )
 *
 *  @param  key key
 */
+ (void)swpGuidanceToolsSaveAppVersion:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setObject:[[self class] swpGuidanceToolsCurrentVersion] forKey:key];
}




@end
