//
//  SwpGuidanceCell.m
//  swp_song
//
//  Created by swp_song on 16/5/26.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "SwpGuidanceCell.h"

/* ---------------------- Tool       ---------------------- */
#import "SwpGuidanceTools.h"            // 工具
/* ---------------------- Tool       ---------------------- */

/* ---------------------- Model      ---------------------- */
#import "SwpGuidanceModel.h"            // 数据模型
/* ---------------------- Model      ---------------------- */


@interface SwpGuidanceCell ()

#pragma mark - UI   Propertys
/*! ---------------------- UI   Property  ---------------------- !*/
/*! 显示引导页 imageView !*/
@property (nonatomic, strong) UIImageView *swpGuidanceImageView;
/*! 显示进入按钮 button  !*/
@property (nonatomic, strong) UIButton    *swpGuidanceButton;
/*! ---------------------- UI   Property  ---------------------- !*/


@end

@implementation SwpGuidanceCell

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
+ (instancetype)swpGuidanceCellWithCollectionView:(UICollectionView *)collectionView reuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath {
    
    return [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
}

/**
 *  @author swp_song
 *
 *  @brief  initWithFrame:  ( Override Init )
 *
 *  @param  frame   frame
 *
 *  @return UICollectionViewCell
 */
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self setUI];
        
        [SwpGuidanceTools swpGuidanceToolsSetButton:self.swpGuidanceButton setBackgroundColor:self.swpGuidanceButtonBackgroundColor setTitle:@"点击进入" setTitleColor:self.swpGuidanceButtonTextColor titleFontSize:15];
    }
    
    return self;
}

/**
 *  @author swp_song
 *
 *  @brief  layoutSubviews  ( Override layoutSubviews )
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    self.swpGuidanceImageView.frame = self.bounds;
    [self setButtonDefineFrame];
}

/**
 *  @author swp_song
 *
 *  @brief  setButtonDefineFrame ( 设置 按钮 frame )
 */
- (void)setButtonDefineFrame {
    _swpGuidanceButton.userInteractionEnabled = YES;
    CGFloat  buttonH          = 35;

    CGFloat  buttonX          = [[UIScreen mainScreen] bounds].size.width * 0.5;

    CGFloat  buttonY          = [[UIScreen mainScreen] bounds].size.height * 0.8 + buttonH;

    _swpGuidanceButton.center = CGPointMake(buttonX, buttonY);

    _swpGuidanceButton.bounds = (CGRect){CGPointZero, CGSizeMake(200, buttonH)};
}

/**
 *  @author swp_song
 *
 *  @brief  setUI ( 设置 UI 控件 )
 */
- (void)setUI {
    [self.contentView addSubview:self.swpGuidanceImageView];
    [self.contentView addSubview:self.swpGuidanceButton];
}

/**
 *  @author swp_song
 *
 *  @brief  setData:    ( 设置 数据 )
 *
 *  @param  swpGuidance swpGuidance
 */
- (void)setData:(SwpGuidanceModel *)swpGuidance {
    self.swpGuidanceImageView.image = [UIImage imageNamed:swpGuidance.swpGuidanceImageName];
    self.swpGuidanceButton.hidden   = swpGuidance.swpGuidanceCellIndex == swpGuidance.swpGuidanceDataSourceCount - 1 ? NO : YES;
}

/**
 *  @author swp_song
 *
 *  @brief  clickButton:    ( 按钮绑定方法 )
 *
 *  @param  button  button
 */
- (void)clickButton:(UIButton *)button {
    
    if ([self.delegate respondsToSelector:@selector(swpGuidanceCellClickButton:)]) {
        [self.delegate swpGuidanceCellClickButton:self];
    }
}


#pragma mark - Public Methods
/**
 *  @author swp_song
 *
 *  @brief  setSwpGuidance: ( 设置数据 )
 *
 *  @param  swpGuidance swpGuidance
 */
- (void)setSwpGuidance:(SwpGuidanceModel *)swpGuidance {
    _swpGuidance = swpGuidance;
    [self setData:_swpGuidance];
}

/**
 *  @author swp_song
 *
 *  @brief  swpGuidanceButtonBackgroundColor:   ( 设置按钮背景颜色 )
 *
 *  @param  swpGuidanceButtonBackgroundColor    swpGuidanceButtonBackgroundColor
 */
- (void)setSwpGuidanceButtonBackgroundColor:(UIColor *)swpGuidanceButtonBackgroundColor {
    _swpGuidanceButtonBackgroundColor      = swpGuidanceButtonBackgroundColor;
    self.swpGuidanceButton.backgroundColor = _swpGuidanceButtonBackgroundColor;
}

/**
 *  @author swp_song
 *
 *  @brief  swpGuidanceButtonTextColor: ( 设置按钮文字颜色 )
 *
 *  @param  swpGuidanceButtonTextColor  swpGuidanceButtonTextColor
 */
- (void)setSwpGuidanceButtonTextColor:(UIColor *)swpGuidanceButtonTextColor {
    _swpGuidanceButtonTextColor = swpGuidanceButtonTextColor;
    _swpGuidanceButtonTextColor = _swpGuidanceButtonTextColor == nil ? [UIColor blackColor] : _swpGuidanceButtonTextColor;
    [self.swpGuidanceButton setTitleColor:_swpGuidanceButtonTextColor forState:UIControlStateNormal];
    [self.swpGuidanceButton setTitleColor:_swpGuidanceButtonTextColor forState:UIControlStateHighlighted];
}

/**
 *  @author swp_song
 *
 *  @brief  swpGuidanceButtonText:  ( 设置按钮文字显示 )
 *
 *  @param  swpGuidanceButtonText   swpGuidanceButtonText
 */
- (void)setSwpGuidanceButtonText:(NSString *)swpGuidanceButtonText {
    _swpGuidanceButtonText = swpGuidanceButtonText;
    _swpGuidanceButtonText = _swpGuidanceButtonText == nil ? @"点击进入" : _swpGuidanceButtonText;
    [self.swpGuidanceButton setTitle:_swpGuidanceButtonText forState:UIControlStateNormal];
    [self.swpGuidanceButton setTitle:_swpGuidanceButtonText forState:UIControlStateHighlighted];
}

#pragma mark - Init Data Methods
- (UIImageView *)swpGuidanceImageView {
    
    if (!_swpGuidanceImageView) {
        _swpGuidanceImageView = [UIImageView new];
    }
    return _swpGuidanceImageView;
}

- (UIButton *)swpGuidanceButton {
    
    if (!_swpGuidanceButton) {
        _swpGuidanceButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_swpGuidanceButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchDown];
    }
    return _swpGuidanceButton;
}

@end
