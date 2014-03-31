
//  HMProgressView.m
//
//  Created by hugo mazet on 07/03/2014.
//

#import "HMTimeBar.h"

#pragma mark - Class Extention
@interface HMTimeBar ()


@property (nonatomic, strong) UIView *progressBar;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic) double tickCount;

@end

#pragma mark - Class Implementation
@implementation HMTimeBar

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

- (void) setCorner:(BOOL)isCorner
{
    if (isCorner)
        [self.layer setCornerRadius:self.frame.size.height/2];
    else
        [self.layer setCornerRadius:0];
}

- (void) setViewColor:(UIColor *)viewColor
{
    [self setBackgroundColor:viewColor];
}

- (void) setBarColor:(UIColor *)barColor
{
    [self.progressBar setBackgroundColor:barColor];
}

#pragma  mark - Manage Animation
- (void) start
{
    [self stop];
    
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

- (void)loop:(NSTimer*)timer
{
    self.tickCount ++;
}

- (void) stop
{
    if (self.timer)
    {
        [self.timer invalidate];
        self.timer = nil;
    }
    [self.progressBar.layer removeAllAnimations];
}

- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag
{
    if (flag)
    {
        [self.delegate HMProgressBarTimeEnd:self];
    }
    else
    {
        [self.delegate HMProgressBarStoped:self score:self.duration - self.tickCount];
        
    }
    
    self.tickCount = 0;
    
}

@end
