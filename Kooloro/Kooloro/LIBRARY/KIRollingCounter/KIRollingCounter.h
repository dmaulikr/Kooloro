//
//  KIRollingCounter.h
//  Kiiune
//
//  Created by hugo mazet on 26/03/2014.
//  Copyright (c) 2014 hugo mazet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KIRollingCounter : UIView

@property (nonatomic, strong, setter = setCounterValue:, getter = getCounterValue) NSNumber *counterValue;

// INIT
- (id)initWithFrame:(CGRect)frame andStartValue:(NSNumber*)value;

// SETTER
- (void)setCounterFont:(UIFont*)font;
- (void)setCounterColor:(UIColor*)color;
- (void)setAnimationDuration:(CGFloat)duration;
- (void)setCounterValueAnimated:(NSNumber*)counterValue;

@end
