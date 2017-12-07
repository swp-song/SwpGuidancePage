//
//  SwpGuidanceCell.h
//  swp_song
//
//  Created by swp_song on 16/5/26.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SwpGuidanceCell, SwpGuidanceModel;


NS_ASSUME_NONNULL_BEGIN

@protocol SwpGuidanceCellDelegate <NSObject>

@optional

/**
 *  @ author swp_song
 *
 *  @ brief  swpGuidanceCellClickButton: ( 点击 进入 App 按钮 调用 )
 *
 *  @ param  swpGuidanceCell
 */
- (void)swpGuidanceCellClickButton:(SwpGuidanceCell *)swpGuidanceCell;

@end

@interface SwpGuidanceCell : UICollectionViewCell

/**
 *  @author swp_song
 *
 *  @brief  swpGuidanceCellWithCollectionView:reuseIdentifier:forIndexPath: ( 快速初始化一个 Cell )
 *
 *  @param  collectionView  collectionView
 *
 *  @param  identifier      identifier
 *
 *  @param  indexPath       indexPath
 *
 *  @return UICollectionViewCell
 */
+ (instancetype)swpGuidanceCellWithCollectionView:(UICollectionView *)collectionView reuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;


/* Delegate            */
@property (nonatomic, weak) id<SwpGuidanceCellDelegate>delegate;
/* 显示 数据模型       */
@property (nonatomic, strong) SwpGuidanceModel *swpGuidance;
/* 设置 按钮 背景 颜色 */
@property (nonatomic, strong) UIColor  *swpGuidanceButtonBackgroundColor;
/* 设置 按钮 文字 颜色 */
@property (nonatomic, strong) UIColor  *swpGuidanceButtonTextColor;
/* 设置 按钮 文字      */
@property (nonatomic, copy  ) NSString *swpGuidanceButtonText;

/**
 *  @author swp_song
 *
 *  @brief  setSwpGuidance: ( 设置数据 )
 *
 *  @param  swpGuidance swpGuidance
 */
- (void)setSwpGuidance:(SwpGuidanceModel *)swpGuidance;

@end

NS_ASSUME_NONNULL_END
