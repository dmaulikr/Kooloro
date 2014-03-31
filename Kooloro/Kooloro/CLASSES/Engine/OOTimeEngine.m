
//  HMProgressView.m
//
//  Created by hugo mazet on 07/03/2014.
//

#import "OOTimeEngine.h"

#pragma mark - Class Extention
@interface OOTimeEngine ()


@property (nonatomic, strong) UIView *progressBar;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic) double tickCount;

@end

#pragma mark - Class Implementation
@implementation OOTimeEngine

// ----------------------------------------------------------------------------------------------
// Init
// ----------------------------------------------------------------------------------------------
- (id) initWithFrame:(CGRect)frame andDuration:(CGFloat)duration
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // build
        self.progressBar = [[UIView alloc]initWithFrame:CGRectMake(-frame.size.width, 0, frame.size.width, frame.size.height)];
        [self addSubview:self.progressBar];
        [self setClipsToBounds:YES];
        
        // defaults values
        [self setDuration:duration];
        [self setCorner:YES];
        [self setViewColor:[UIColor colorWithWhite:0.9 alpha:1]];
        [self setBarColor:[UIColor colorWithRed:139.0/255 green:167.0/255 blue:29.0/255 alpha:1]];
        
    }
    return self;
}

// ----------------------------------------------------------------------------------------------
// Corner
// ----------------------------------------------------------------------------------------------
- (void) setCorner:(BOOL)isCorner
{
    if (isCorner)
        [self.layer setCornerRadius:self.frame.size.height/2];
    else
        [self.layer setCornerRadius:0];
}

// ----------------------------------------------------------------------------------------------
// Back Color
// ----------------------------------------------------------------------------------------------
- (void) setViewColor:(UIColor *)viewColor
{
    [self setBackgroundColor:viewColor];
}

// ----------------------------------------------------------------------------------------------
// Bar Color
// ----------------------------------------------------------------------------------------------
- (void) setBarColor:(UIColor *)barColor
{
    [self.progressBar setBackgroundColor:barColor];
}

#pragma  mark - Manage Animation
// ----------------------------------------------------------------------------------------------
// START
// ----------------------------------------------------------------------------------------------
- (void) start
{
    // timer
    self.tickCount = 0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(loop:) userInfo:nil repeats:YES];

    // animation
    CABasicAnimation *animation;
    animation=[CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    animation.delegate = self;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.duration = self.duration;
    animation.fromValue = [NSNumber numberWithFloat:0];
    animation.toValue = [NSNumber numberWithFloat:self.progressBar.frame.size.width];
    [self.progressBar.layer addAnimation:animation forKey:@"animateLayer"];
}

// ----------------------------------------------------------------------------------------------
// STOP
// ----------------------------------------------------------------------------------------------
- (double)stop
{
    if (self.timer)
    {
        [self.timer invalidate];
        self.timer = nil;
    }
    [self.progressBar.layer removeAllAnimations];
    
    double score =  self.duration - self.tickCount;
    return score;
}

// ----------------------------------------------------------------------------------------------
// LOOP
// ----------------------------------------------------------------------------------------------
- (void)loop:(NSTimer*)timer
{
    self.tickCount ++;
}

// ----------------------------------------------------------------------------------------------
// Animation did stop
// ----------------------------------------------------------------------------------------------
- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag
{
    if (flag)
    {
        if (self.timer)
        {
            [self.timer invalidate];
            self.timer = nil;
        }
        [self.delegate OOTimeEngineTimeEnd:self];
    }
}

@end
