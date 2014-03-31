//
//  OOGameOnViewController.m
//  Kooloro
//
//  Created by hugo mazet on 30/03/2014.
//  Copyright (c) 2014 Moutaarde. All rights reserved.
//

#import "OOGameOnViewController.h"
#import "OOGameOverViewController.h"

//*********************************************************************************
//*********************************************************************************
//*********************************************************************************

#pragma mark -
#pragma mark CLASS EXTENSION
#pragma mark -

@interface OOGameOnViewController ()

@property (nonatomic, strong) OOEngine *gameEngine;
@property (nonatomic, strong) NSDictionary *level;

@end

//*********************************************************************************
//*********************************************************************************
//*********************************************************************************

#pragma mark -
#pragma mark CLASS IMPLEMENTATION
#pragma mark -

@implementation OOGameOnViewController

// ----------------------------------------------------------------------------------------------
// Init
// ----------------------------------------------------------------------------------------------
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

// ----------------------------------------------------------------------------------------------
// View did load
// ----------------------------------------------------------------------------------------------
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // game engine
    self.gameEngine  = [[OOEngine alloc]initWithTimeEngineFrame:CGRectMake(0, 0, 200, 8)];
    [self.gameEngine setDelegate:self];
    [self.gameEngine.timeEngine setCenter:self.view.center];
    [self.view addSubview:self.gameEngine.timeEngine];
    
    // button tag
    [self.I setTag:0];
    [self.II setTag:1];
    [self.III setTag:2];
    [self.IV setTag:3];
    
    [self setupUI];
}

// ----------------------------------------------------------------------------------------------
// Setup UI
// ----------------------------------------------------------------------------------------------
- (void)setupUI
{
    // BACK COLOR
    [self.view setBackgroundColor:[OOCoreColor whiteBack]];
    [self.levelTypeImageView setBackgroundColor:[OOCoreColor grayText]];
    [self.levelTypeImageView setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:1]];
    self.I.backgroundColor =
    self.II.backgroundColor =
    self.III.backgroundColor =
    self.IV.backgroundColor = [UIColor clearColor];
    
    // TEXT COLOR
    [self.scoreLabel setTextColor:[OOCoreColor blackText]];
    
    // TEXT FONT
    [self.scoreLabel setFont:[OOCoreFont GetFontBig]];
    [self.targetLabel setFont:[OOCoreFont GetFontBigBold]];
    
    // DEFAULT TEXT
    [self.scoreLabel setText:@"0"];
    [self.targetLabel setText:@""];
    
    // CORNER + BORDER
    [self.levelTypeImageView.layer setCornerRadius:OOCornerRadius];
    self.I.layer.cornerRadius =
    self.II.layer.cornerRadius =
    self.III.layer.cornerRadius =
    self.IV.layer.cornerRadius = OOCornerRadius;
    
}

// ----------------------------------------------------------------------------------------------
// View wil apear
// ----------------------------------------------------------------------------------------------
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // START GAME
    [self.scoreLabel setText:@"0"];
    [self.gameEngine startGame];
}

// ----------------------------------------------------------------------------------------------
// Memory warning
// ----------------------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - IBAction

// ----------------------------------------------------------------------------------------------
// Possible response got pressed
// ----------------------------------------------------------------------------------------------
- (IBAction)buttonGotPressed:(id)sender
{
    UIButton *button = sender;
    [self.gameEngine correct:[[[self.level objectForKey:@"possibleResponse"] objectAtIndex:button.tag] integerValue] forAnswer:self.level];
}


#pragma mark - OOEngine Delegate

// ----------------------------------------------------------------------------------------------
// New level open
// ----------------------------------------------------------------------------------------------
- (void)OOEngine:(OOEngine*)engine levelOpen:(NSDictionary*)level
{
    self.level = [NSDictionary dictionaryWithDictionary:level];
    
    
    OOEngineLevelType levelType = [[level objectForKey:@"levelType"]integerValue];
    
    switch (levelType)
    {
        case OOEngineLevelTypeColor:
            [self.levelTypeImageView setImage:[UIImage imageNamed:@"color.png"]];
            break;
            
        case OOEngineLevelTypeText:
            [ self.levelTypeImageView setImage:[UIImage imageNamed:@"text.png"]];
            break;
            
        default:
            break;
    }
    
    [self.targetLabel setTextColor:[self.gameEngine getColor:[[level objectForKey:@"levelColor"] integerValue]]];
    [self.targetLabel setText:[self.gameEngine getText:[[level objectForKey:@"levelText"] integerValue]]];
    
    [self.I setBackgroundColor:[self.gameEngine getColor:[[[level objectForKey:@"possibleResponse"] objectAtIndex:0] integerValue]]];
    [self.II setBackgroundColor:[self.gameEngine getColor:[[[level objectForKey:@"possibleResponse"] objectAtIndex:1] integerValue]]];
    [self.III setBackgroundColor:[self.gameEngine getColor:[[[level objectForKey:@"possibleResponse"] objectAtIndex:2] integerValue]]];
    [self.IV setBackgroundColor:[self.gameEngine getColor:[[[level objectForKey:@"possibleResponse"] objectAtIndex:3] integerValue]]];
}

// ----------------------------------------------------------------------------------------------
// Level success
// ----------------------------------------------------------------------------------------------
- (void)OOEngine:(OOEngine*)engine levelSuccess:(double)score
{
    [self.scoreLabel setText:[NSString stringWithFormat:@"%.0f",score]];
    // load next level
    [self.gameEngine openLevel];
}

// ----------------------------------------------------------------------------------------------
// Game Over
// ----------------------------------------------------------------------------------------------
- (void)OOEngine:(OOEngine*)engine gameOver:(double)score;
{
    [self.scoreLabel setText:[NSString stringWithFormat:@"%.0f",score]];
    [self performSegueWithIdentifier:@"SegueGameOver" sender:self];
}


#pragma mark - Navigation

// ----------------------------------------------------------------------------------------------
// Prepare for segue
// ----------------------------------------------------------------------------------------------
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"SegueGameOver"])
    {
        OOGameOverViewController *controller = segue.destinationViewController;
        controller.score = self.scoreLabel.text;
    }
}

@end


