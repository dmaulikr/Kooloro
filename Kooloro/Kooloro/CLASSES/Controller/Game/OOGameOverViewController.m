//
//  OOGameOverViewController.m
//  Kooloro
//
//  Created by hugo mazet on 30/03/2014.
//  Copyright (c) 2014 Moutaarde. All rights reserved.
//

#import "OOGameOverViewController.h"

//*********************************************************************************
//*********************************************************************************
//*********************************************************************************

#pragma mark -
#pragma mark CLASS EXTENSION
#pragma mark -

@interface OOGameOverViewController ()

@end

//*********************************************************************************
//*********************************************************************************
//*********************************************************************************

#pragma mark -
#pragma mark CLASS IMPLEMENTATION
#pragma mark -

@implementation OOGameOverViewController

// ----------------------------------------------------------------------------------------------
// View did load
// ----------------------------------------------------------------------------------------------
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupUI];
    
    [self.scoreLabel setText:self.score];
    
    [self updateBestScore];

}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [self.bestScoreLabel.layer removeAllAnimations];
}

// ----------------------------------------------------------------------------------------------
// Setup UI
// ----------------------------------------------------------------------------------------------
- (void)setupUI
{
    // BACK COLOR
    [self.view setBackgroundColor:[OOCoreColor whiteBack]];
    [self.playButton setBackgroundColor:[OOCoreColor redBack]];
    [self.homeButton setBackgroundColor:[OOCoreColor redBack]];
    
    // TEXT COLOR
    [self.gameOverTitle setTextColor:[OOCoreColor redText]];
    [self.yourScoreLabel setTextColor:[OOCoreColor lightBlackText]];
    [self.scoreLabel setTextColor:[OOCoreColor blackText]];
    [self.bestScoreLabel setTextColor:[OOCoreColor greenTile]];
    [self.playButton setTitleColor:[OOCoreColor whiteText] forState:UIControlStateNormal];
    [self.homeButton setTitleColor:[OOCoreColor whiteText] forState:UIControlStateNormal];
    
    // TEXT FONT
    [self.gameOverTitle setFont:[OOCoreFont GetFontBig]];
    [self.yourScoreLabel setFont:[OOCoreFont GetFontMedium]];
    [self.scoreLabel setFont:[OOCoreFont GetFontBigBold]];
    [self.bestScoreLabel setFont:[OOCoreFont GetFontMedium]];
    [self.playButton.titleLabel setFont:[OOCoreFont GetFontMedium]];
    [self.homeButton.titleLabel setFont:[OOCoreFont GetFontMedium]];
    
    
    // TEXT
    [self.scoreLabel setText:NSLocalizedString(@"GENERICS_score", @"votre score")];
    [self.scoreLabel setText:NSLocalizedString(@"GENERICS_newBest", @"nouveau meilleur score")];
    [self.playButton setTitle:NSLocalizedString(@"GENERICS_play", @"jouer") forState:UIControlStateNormal];
    [self.homeButton setTitle:NSLocalizedString(@"GENERICS_menu", @"menu") forState:UIControlStateNormal];
    
    // CORNER
    [self.playButton.layer setCornerRadius:OOCornerRadius];
    [self.homeButton.layer setCornerRadius:OOCornerRadius];

}

// ----------------------------------------------------------------------------------------------
// Update best score
// ----------------------------------------------------------------------------------------------
- (void)updateBestScore
{
    NSString *best = [STKeychain getPasswordForUsername:OOBestScoreKey andServiceName:OOApplicationBundleIdentifier error:nil];
    
    if (best.doubleValue < self.score.doubleValue)
    {
        [self.bestScoreLabel setHidden:NO];
        [self bestScoreAnimation];
        
        [STKeychain storeUsername:OOBestScoreKey
                      andPassword:self.score
                   forServiceName:OOApplicationBundleIdentifier
                   updateExisting:YES
                            error:nil];

    }
    else
    {
        [self.bestScoreLabel setHidden:YES];
    }
}

// ----------------------------------------------------------------------------------------------
// Best score animation
// ----------------------------------------------------------------------------------------------
- (void)bestScoreAnimation
{
    // animation
    CABasicAnimation *animation;
    animation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.delegate = self;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.autoreverses = YES;
    animation.repeatCount = HUGE_VALF;
    animation.duration = 0.7;
    animation.toValue = [NSNumber numberWithFloat:1.2];
    [self.bestScoreLabel.layer addAnimation:animation forKey:@"animateLayer"];
}


// ----------------------------------------------------------------------------------------------
// Memory warning
// ----------------------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)playGotPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)homeGotPressed:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
