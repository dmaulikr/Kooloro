//
//  KIRollingCounter.m
//  Kiiune
//
//  Created by hugo mazet on 26/03/2014.
//  Copyright (c) 2014 hugo mazet. All rights reserved.
//

#import "KIRollingCounter.h"


typedef enum : NSUInteger {
    KIRollingUP,
    KIRollingDown,
} KIRolling;

//*********************************************************************************
//*********************************************************************************
//*********************************************************************************

#pragma mark -
#pragma mark CLASS EXTENSION
#pragma mark -

@interface KIRollingCounter()

@property (nonatomic, strong) UILabel *labelFocusIn;
@property (nonatomic, strong) UILabel *labelFocusOut;
@property (nonatomic) CGFloat animationDuration;
@property (nonatomic) BOOL isAnimating;


@end

//*********************************************************************************
//*********************************************************************************
//*********************************************************************************

#pragma mark -
#pragma mark CLASS INTERFACE
#pragma mark -

@implementation KIRollingCounter

// ----------------------------------------------------------------------------------------------
// init
// ----------------------------------------------------------------------------------------------
- (id)initWithFrame:(CGRect)frame andStartValue:(NSNumber*)value
{
    self = [super initWithFrame:frame];
    if (self)
    {
        CGRect labelFrame = frame;
        
        labelFrame.origin.x = labelFrame.origin.y = 0.;
        self.labelFocusIn = [[UILabel alloc]initWithFrame:labelFrame];
        [self.labelFocusIn setTextAlignment:NSTextAlignmentCenter];
        
        labelFrame.origin.y = frame.size.height;
        self.labelFocusOut = [[UILabel alloc]initWithFrame:labelFrame];
        [self.labelFocusOut setTextAlignment:NSTextAlignmentCenter];
        
        self.counterValue = value;
        self.labelFocusIn.text = self.labelFocusOut.text = [NSString stringWithFormat:@"%@",self.counterValue];
        
        self.animationDuration = 0.3;
        
        [self setClipsToBounds:YES];
        [self addSubview:self.labelFocusIn];
        [self addSubview:self.labelFocusOut];
        
    }
    return self;
}

// ----------------------------------------------------------------------------------------------
// Ste Text Font
// ----------------------------------------------------------------------------------------------
- (void)setCounterFont:(UIFont*)font
{
    self.labelFocusIn.font = self.labelFocusOut.font = font;
}

// ----------------------------------------------------------------------------------------------
// Set Text Color
// ----------------------------------------------------------------------------------------------
- (void)setCounterColor:(UIColor*)color
{
    self.labelFocusIn.textColor = self.labelFocusOut.textColor = color;
}

// ----------------------------------------------------------------------------------------------
// Set Animation duration
// ----------------------------------------------------------------------------------------------
- (void)setAnimationDuration:(CGFloat)duration
{
    _animationDuration = duration;
}

// ----------------------------------------------------------------------------------------------
// Set Value
// ---------------------------------------------------------------------------------------------
- (void)setCounterValue:(NSNumber *)currentValue
{
    _counterValue = currentValue;
    [self.labelFocusIn setText:[NSString stringWithFormat:@"%@",currentValue]];
}

// ----------------------------------------------------------------------------------------------
// Set Value Animated
// ----------------------------------------------------------------------------------------------
- (void)setCounterValueAnimated:(NSNumber*)counterValue
{
    
    if (self.isAnimating)
        return;
    
    self.isAnimating = YES;
    
    [self.labelFocusOut setText:[NSString stringWithFormat:@"%@",counterValue]];
    _counterValue = counterValue;
    
    [self runAnimationWithDirection:KIRollingUP];
    
    
}

// ----------------------------------------------------------------------------------------------
// Run Animation
// ----------------------------------------------------------------------------------------------
- (void)runAnimationWithDirection:(KIRolling)direction
{
    CGRect frameIN = self.labelFocusIn.frame;
    CGRect frameOUT;
    
    
    CGRect frameOutTop = frameIN;
    frameOutTop.origin.y = -frameIN.size.height;
    
    CGRect frameOutBot = frameIN;
    frameOutBot.origin.y = frameIN.size.height;
    
    
    // LABEL OUT STRAT POINT
    switch (direction)
    {
        case KIRollingUP:
            frameOUT = frameOutTop;
            [self.labelFocusOut setFrame:frameOutBot];
            break;
            
        default:
            frameOUT = frameOutBot;
            [self.labelFocusOut setFrame:frameOutTop];
            break;
    }
    
    
    // ANIMATION
    [UIView animateWithDuration:self.animationDuration animations:^{
        
        [self.labelFocusIn setFrame:frameOUT];
        [self.labelFocusOut setFrame:frameIN];
        
        
    } completion:^(BOOL finished){
        
        self.labelFocusIn.text = self.labelFocusOut.text;
        [self.labelFocusIn setFrame:frameIN];
        [self.labelFocusOut setFrame:frameOUT];
        self.isAnimating = NO;
        
    }];
}

@end













