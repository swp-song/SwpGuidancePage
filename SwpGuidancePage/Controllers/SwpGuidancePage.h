//
//  SwpGuidancePage.h
//  swp_song
//
//  Created by swp_song on 16/5/26.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface SwpGuidancePage : UIViewController

/**
 *  @author swp_song
 *
 *  @brief  swpGuidancePageCheckAppVersion:appVersionSame:appVersionNotSame:    ( 验证 App 版本是否相同，Block 返回，是否保存版本号  )
 *
 *  @param  appVersionSame      appVersionSame
 *
 *  @param  appVersionNotSame   appVersionNotSame
 */
+ (void)swpGuidancePageCheckAppVersion:(void(^ _Nullable)(NSString *version))appVersionSame appVersionNotSame:(BOOL (^_Nullable)(NSString * appVersion, NSString *oldVersion))appVersionNotSame;

/**
 *  @author swp_song
 *
 *  @brief  swpGuidancePageShow:rootViewController:isSaveVersion:   ( 显示 SwpGuidancePage 判断版本，是否相同 )
 *
 *  @param  window          window
 *
 *  @param  viewController  viewController
 *
 *  @param  isSaveVersion   isSaveVersion
 *
 *  @return SwpGuidancePage
 */
- (instancetype)swpGuidancePageShow:(UIWindow *)window rootViewController:(UIViewController *)viewController isSaveVersion:(BOOL)isSaveVersion;


/**
 *  @author swp_song
 *
 *  @brief  swpGuidancePageShowChain    ( 显示 SwpGuidancePage 判断版本，是否相同 )
 */
- (SwpGuidancePage * _Nonnull (^)(UIWindow * _Nonnull, UIViewController * _Nonnull, BOOL))swpGuidancePageShowChain;

/**
 *  @author swp_song
 *
 *  @brief  datas   ( 设置数据源 )
 */
- (SwpGuidancePage * _Nonnull (^)(NSArray * _Nonnull))datas;

/**
 *  @author swp_song
 *
 *  @brief  swpGuidancePageControlHidden:   ( 隐藏分页， YES = 隐藏, 默认显示 )
 */
- (SwpGuidancePage * _Nonnull (^)(BOOL))swpGuidancePageControlHidden;

/**
 *  @author swp_song
 *
 *  @brief  swpGuidancePageGlideGesture ( 是否开启滑动关闭， YES = 开启， NO = 关闭， 默认关闭 )
 */
- (SwpGuidancePage * _Nonnull (^)(BOOL))swpGuidancePageGlideGesture;

/**
 *  @author swp_song
 *
 *  @brief  swpGuidancePageNumberOfPagesColor   ( 设置总页数的颜色 )
 */
- (SwpGuidancePage * _Nonnull (^)(UIColor *))swpGuidancePageNumberOfPagesColor;

/**
 *  @author swp_song
 *
 *  @brief  swpGuidancePageCurrentPageColor ( 设置分页数的颜色 )
 */
- (SwpGuidancePage * _Nonnull (^)(UIColor * _Nonnull))swpGuidancePageCurrentPageColor;

/**
 *  @author swp_song
 *
 *  @brief  swpGuidanceScrollLastPage:  ( SwpGuidancePage 回调方法，滚动到最后一页调用 )
 *
 *  @param  swpGuidanceScrollLastPage   swpGuidanceScrollLastPage
 */
- (void)swpGuidanceScrollLastPage:(void (^ _Nullable)(void))swpGuidanceScrollLastPage;

/**
 *  @author swp_song
 *
 *  @brief  swpGuidanceScrollLastPageChain  ( SwpGuidancePage 回调方法，滚动到最后一页调用 )
 */
- (SwpGuidancePage * _Nonnull (^)(void (^)(void)))swpGuidanceScrollLastPageChain;



@end
NS_ASSUME_NONNULL_END
