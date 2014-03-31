//
//  OOGameOnViewController.m
//  Kooloro
//
//  Created by hugo mazet on 30/03/2014.
//  Copyright (c) 2014 Moutaarde. All rights reserved.
//

#import "OOGameOnViewController.h"

@interface OOGameOnViewController ()

@property (nonatomic, strong) OOEngine *gameEngine;
@property (nonatomic, strong) NSDictionary *level;

@end

@implementation OOGameOnViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.gameEngine  = [[OOEngine alloc]init];
    [self.gameEngine setDelegate:self];
    
    // button tag
    [self.I setTag:0];
    [self.II setTag:1];
    [self.III setTag:2];
    [self.IV setTag:3];
    
    [self setupUI];
}

- (void)setupUI
{
    // BACK COLOR
    [self.view setBackgroundColor:[OOCoreColor whiteBack]];
    self.I.backgroundColor =
    self.II.backgroundColor =
    self.III.backgroundColor =
    self.IV.backgroundColor = [UIColor clearColor];
    
    // TEXT FONT
    [self.targetLabel setFont:[OOCoreFont GetFontBig]];
    
    // CORNER + BORDER
    self.I.layer.cornerRadius =
    self.II.layer.cornerRadius =
    self.III.layer.cornerRadius =
    self.IV.layer.cornerRadius = OOMagicalNumber;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.gameEngine startGame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - IBAction

- (IBAction)buttonGotPressed:(id)sender
{
    UIButton *button = sender;
    [self.gameEngine correct:[[[self.level objectForKey:@"possibleResponse"] objectAtIndex:button.tag] integerValue] forAnswer:self.level];
}


#pragma mark - OOEngine Delegate

- (void)OOEngine:(OOEngine*)engine levelOpen:(NSDictionary*)level
{
    self.level = [NSDictionary dictionaryWithDictionary:level];
    
    
    OOEngineLevelType levelType = [[level objectForKey:@"levelType"]integerValue];
    
    switch (levelType) {
        case OOEngineLevelTypeMatch:
            [ self.levelTypeLabel setText:@"match"];
            break;
            
        case OOEngineLevelTypeColor:
            [ self.levelTypeLabel setText:@"color"];
            break;
            
        case OOEngineLevelTypeText:
            [ self.levelTypeLabel setText:@"text"];
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

- (void)OOEngine:(OOEngine*)engine levelSuccess:(double)score
{
    [self.gameEngine openLevel];
}

- (void)OOEngine:(OOEngine*)engine levelFaill:(double)score
{
    [self.targetLabel setTextColor:[OOCoreColor blackText]];
    [self.targetLabel setText:@"GAME OVER"];
}

@end








