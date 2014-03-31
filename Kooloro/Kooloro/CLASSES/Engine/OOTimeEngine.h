//
//  HMProgressView.h
//
//  Created by hugo mazet on 07/03/2014.
//
//  Simple progress view with flexible height


#import <UIKit/UIKit.h>

@class OOTimeEngine;

@protocol OOTimeEngineProtocol <NSObject>

- (void)OOTimeEngineTimeEnd:(OOTimeEngine *)timeEngine;

@end

@interface OOTimeEngine : UIView

#pragma mark - Constructor
- (id) initWithFrame:(CGRect)frame andDuration:(CGFloat)duration;

#pragma  mark - Manage Animation
- (void) start;
- (double) stop;

#pragma  mark - Setter
@property (nonatomic, setter = setCorner:) BOOL isCorner;
@property (nonatomic, setter = setDuration:) CGFloat duration;
@property (nonatomic, strong, setter = setBarColor:) UIColor* barColor;
@property (nonatomic, strong, setter = setViewColor:) UIColor* viewColor;

#pragma mark - Delegate
@property (nonatomic, weak) id<OOTimeEngineProtocol> delegate;

@end