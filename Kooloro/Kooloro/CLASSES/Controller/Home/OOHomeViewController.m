//
//  OOHomeViewController.m
//  Kooloro
//
//  Created by hugo mazet on 30/03/2014.
//  Copyright (c) 2014 Moutaarde. All rights reserved.
//

#import "OOHomeViewController.h"

//*********************************************************************************
//*********************************************************************************
//*********************************************************************************

#pragma mark -
#pragma mark CLASS EXTENSION
#pragma mark -

@interface OOHomeViewController ()

@end

//*********************************************************************************
//*********************************************************************************
//*********************************************************************************

#pragma mark -
#pragma mark CLASS IMPLEMENTATION
#pragma mark -

@implementation OOHomeViewController

#pragma mark - Setup
// ----------------------------------------------------------------------------------------------
// View did load
// ----------------------------------------------------------------------------------------------
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupUI];
}

// ----------------------------------------------------------------------------------------------
// setupUI
// ----------------------------------------------------------------------------------------------
- (void)setupUI
{
    // BACK COLOR
    [self.view setBackgroundColor:[OOCoreColor whiteBack]];
    [self.gameTitleLabel setBackgroundColor:[UIColor clearColor]];
    [self.gamePlayButton setBackgroundColor:[OOCoreColor redBack]];
    [self.gameShareButton setBackgroundColor:[UIColor clearColor]];
    [self.gameScoreButton setBackgroundColor:[UIColor clearColor]];
    [self.gameTutoButton setBackgroundColor:[UIColor clearColor]];
    
    // TEXT COLOR
    [self.gameTitleLabel setTextColor:[OOCoreColor blackText]];
    [self.gamePlayButton setTitleColor:[OOCoreColor whiteText] forState:UIControlStateNormal];
    [self.gameShareButton setTitleColor:[OOCoreColor lightBlackText] forState:UIControlStateNormal];
    [self.gameScoreButton setTitleColor:[OOCoreColor lightBlackText] forState:UIControlStateNormal];
    [self.gameTutoButton setTitleColor:[OOCoreColor lightBlackText] forState:UIControlStateNormal];
    
    // TEXT FONT
    [self.gameTitleLabel setFont:[OOCoreFont GetFontMedium]];
    [self.gamePlayButton.titleLabel setFont:[OOCoreFont GetFontBig]];
    [self.gameShareButton.titleLabel setFont:[OOCoreFont GetFontSmall]];
    [self.gameScoreButton.titleLabel setFont:[OOCoreFont GetFontSmall]];
    [self.gameTutoButton.titleLabel setFont:[OOCoreFont GetFontSmall]];
    
    // TEXT
    [self.gamePlayButton setTitle:NSLocalizedString(@"GENERICS_play", @"") forState:UIControlStateNormal];
    [self.gameShareButton setTitle:NSLocalizedString(@"GENERICS_share", @"") forState:UIControlStateNormal];
    [self.gameScoreButton setTitle:NSLocalizedString(@"GENERICS_score", @"") forState:UIControlStateNormal];
    [self.gameTutoButton setTitle:NSLocalizedString(@"GENERICS_tuto", @"") forState:UIControlStateNormal];
    
    // CORNER + BORDER
    [self.gamePlayButton.layer setCornerRadius:75];
    
}

// ----------------------------------------------------------------------------------------------
// Memory warning
// ----------------------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
// ----------------------------------------------------------------------------------------------
// Prepare for segue
// ----------------------------------------------------------------------------------------------
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
