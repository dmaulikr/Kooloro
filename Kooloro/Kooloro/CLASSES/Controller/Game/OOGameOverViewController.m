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
}

// ----------------------------------------------------------------------------------------------
// Setup UI
// ----------------------------------------------------------------------------------------------
- (void)setupUI
{
    // BACK COLOR
    [self.view setBackgroundColor:[OOCoreColor whiteBack]];
    [self.playButton setBackgroundColor:[OOCoreColor redBack]];
    
    // TEXT COLOR
    [self.gameOverTitle setTextColor:[OOCoreColor redText]];
    [self.yourScoreLabel setTextColor:[OOCoreColor lightBlackText]];
    [self.scoreLabel setTextColor:[OOCoreColor blackText]];
    [self.playButton setTitleColor:[OOCoreColor whiteText] forState:UIControlStateNormal];
    
    // TEXT FONT
    [self.gameOverTitle setFont:[OOCoreFont GetFontBig]];
    [self.yourScoreLabel setFont:[OOCoreFont GetFontMedium]];
    [self.scoreLabel setFont:[OOCoreFont GetFontBigBold]];
    [self.playButton.titleLabel setFont:[OOCoreFont GetFontMedium]];
    
    // CORER
    [self.playButton.layer setCornerRadius:OOMagicalNumber];
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

@end
