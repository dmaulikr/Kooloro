//
//  HMProgressView.h
//
//  Created by hugo mazet on 07/03/2014.
//
//  Simple progress view with flexible height


#import <UIKit/UIKit.h>

@class HMTimeBar;

@protocol HMTimeBarProtocol <NSObject>

- (void)HMProgressBarTimeEnd:(HMTimeBar *)timeBar;
- (void)HMProgressBarStoped:(HMTimeBar *)timeBar score:(double)score;

@end

@interface HMTimeBar : UIView

#pragma mark - Constructor
- (id) initWithFrame:(CGRect)frame andDuration:(CGFloat)duration;

#pragma  mark - Manage Animation
- (void) start;
- (void) stop;

#pragma  mark - Setter
@property (nonatomic, setter = setCorner:) BOOL isCorner;
@property (nonatomic, setter = setDuration:) CGFloat duration;
@property (nonatomic, strong, setter = setBarColor:) UIColor* barColor;
@property (nonatomic, strong, setter = setViewColor:) UIColor* viewColor;

#pragma mark - Delegate
@property (nonatomic, weak) id<HMTimeBarProtocol> delegate;

@end