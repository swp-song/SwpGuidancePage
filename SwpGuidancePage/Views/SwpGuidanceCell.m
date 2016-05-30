//
//  SwpGuidanceCell.m
//  swp_song
//
//  Created by swp_song on 16/5/26.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "SwpGuidanceCell.h"

/*! ---------------------- Tool       ---------------------- !*/
#import "SwpGuidanceTools.h"            // 工具
/*! ---------------------- Tool       ---------------------- !*/

/*! ---------------------- Model      ---------------------- !*/
#import "SwpGuidanceModel.h"            // 数据模型
/*! ---------------------- Model      ---------------------- !*/

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

/*!
 *  @author swp_song
 *
 *  @brief  swpGuidanceCellWithCollectionView:cellForItemAtIndexPath:forCellWithReuseIdentifier: ( 快速 初始化 SwpGuidanceCell )
 *
 *  @param  collectionView
 *
 *  @param  indexPath
 *
 *  @param  identifier
 *
 *  @return SwpGuidanceModel
 */
+ (instancetype)swpGuidanceCellWithCollectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath forCellWithReuseIdentifier:(NSString *)identifier {
    
    SwpGuidanceCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    return cell;
}

/*!
 *  @author swp_song
 *
 *  @brief  initWithFrame:  ( Override initWithFrame )
 *
 *  @param  frame
 *
 *  @return SwpGuidanceCell
 */
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self setUI];
    }
    
    return self;
}

/*!
 *  @author swp_song
 *
 *  @brief  layoutSubviews  ( Override layoutSubviews )
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    self.swpGuidanceImageView.frame = self.bounds;
    [self setButtonDefineFrame];
}

/*!
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

/*!
 *  @author swp_song
 *
 *  @brief  setUI ( 设置 UI 控件 )
 */
- (void)setUI {
    [self.contentView addSubview:self.swpGuidanceImageView];
    [self.contentView addSubview:self.swpGuidanceButton];
}

/*!
 *  @author swp_song
 *
 *  @brief  setData:    ( 设置 数据 )
 *
 *  @param  swpGuidance
 */
- (void)setData:(SwpGuidanceModel *)swpGuidance {
    self.swpGuidanceImageView.image = [UIImage imageNamed:swpGuidance.swpGuidanceImageName];
    self.swpGuidanceButton.hidden   = swpGuidance.swpGuidanceCellIndex == swpGuidance.swpGuidanceDataSourceCount - 1 ? NO : YES;
}

/*!
 *  @author swp_song
 *
 *  @brief  clickButton: ( 按钮 绑定 方法 )
 *
 *  @param  button
 */
- (void)clickButton:(UIButton *)button {
    
    if ([self.delegate respondsToSelector:@selector(swpGuidanceCellClickButton:)]) {
        [self.delegate swpGuidanceCellClickButton:self];
    }
}


#pragma mark - Public Methods
/*!
 *  @author swp_song
 *
 *  @brief  setSwpGuidance: ( 设置 数据 )
 *
 *  @param  swpGuidance
 */
- (void)setSwpGuidance:(SwpGuidanceModel *)swpGuidance {
    _swpGuidance = swpGuidance;
    [self setData:_swpGuidance];
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
        _swpGuidanceButton.backgroundColor = [UIColor whiteColor];
        [SwpGuidanceTools setButton:_swpGuidanceButton setBackgroundColor:[UIColor whiteColor] setTitle:@"点击进入" setTitleColor:[UIColor blackColor] titleFontSize:15];
        [_swpGuidanceButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchDown];
    }
    return _swpGuidanceButton;
}

@end
