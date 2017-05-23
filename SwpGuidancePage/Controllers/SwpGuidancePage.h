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


/*! 设置 SwpGuidancePage 是否 隐藏 默认 NO       !*/
@property (nonatomic, assign, getter = isSwpGuidancePageControlHidden) BOOL swpGuidancePageControlHidden;
/*! 设置 SwpGuidancePage 是否开启 YES            !*/
@property (nonatomic, assign, getter = isSwpGuidancePageGlideGesture)  BOOL swpGuidancePageGlideGesture;
/*! 设置 SwpGuidancePage 分页控件 总页数的颜色   !*/
@property (nullable, nonatomic, strong) UIColor *swpGuidancePageNumberOfPagesColor;
/*! 设置 SwpGuidancePage 分页控件 当前页数的颜色 !*/
@property (nullable, nonatomic, strong) UIColor *swpGuidancePageCurrentPageColor;
/*! 设置 SwpGuidancePage 按钮背景颜色            !*/
@property (nullable, nonatomic, strong) UIColor *swpGuidancePageButtonBackgroundColor;
/*! 设置 SwpGuidancePage 按钮文字颜色            !*/
@property (nullable, nonatomic, strong) UIColor  *swpGuidancePageButtonTextColor;
/*! 设置 SwpGuidancePage 按钮文字内容            !*/
@property (nullable, nonatomic, copy  ) NSString *swpGuidancePageButtonText;


/**!
 *  @ author swp_song
 *
 *  @ brief  swpGuidanceWithDataSource:  (  快速 初始化 SwpGuidancePage )
 *
 *  @ param  dataSource
 *
 *  @ return SwpGuidancePage
 */
+ (instancetype)swpGuidanceWithDataSource:(NSArray *)dataSource;

/**!
 *  @ author swp_song
 *
 *  @ brief  setSwpGuidancePageGlideGesture: ( 设置 开启 滑动 隐藏效果 )
 *
 *  @ param  swpGuidancePageGlideGesture
 */
- (void)setSwpGuidancePageGlideGesture:(BOOL)swpGuidancePageGlideGesture;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpGuidancePageCheckAppVersion:appVersionSame:appVersionNotSame: ( 验证 App 版本 是否相同  )
 *
 *  @ param  appVersionSame
 *
 *  @ param  appVersionNotSame
 */
+ (void)swpGuidancePageCheckAppVersion:(nullable void(^)(NSString *version))appVersionSame appVersionNotSame:(nullable BOOL(^)(NSString *appVersion, NSString *oldVersion))appVersionNotSame;


/**!
 *  @ author swp_song
 *
 *  @ brief  swpGuidanceLastCell: ( 滑动 最后一个 cell )
 *
 *  @ param  swpGuidanceLastCell
 */
- (void)swpGuidanceLastCell:(void (^)())swpGuidanceLastCell;

@end
NS_ASSUME_NONNULL_END
