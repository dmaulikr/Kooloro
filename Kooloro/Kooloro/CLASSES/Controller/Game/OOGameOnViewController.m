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
    
    self.I.backgroundColor =
    self.II.backgroundColor =
    self.III.backgroundColor =
    self.IV.backgroundColor = [UIColor clearColor];
    
    self.gameEngine  = [[OOEngine alloc]init];
    [self.gameEngine setDelegate:self];
    
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
    
    switch (button.tag)
    {
        case 1:
            
            break;
            
        case 2:
           
            break;
            
        case 3:
            
            break;
            
        case 4:
            
            break;
            
        default:
            break;
    }
}


#pragma mark - OOEngine

#pragma mark - OOEngine Delegate

- (void)OOEngine:(OOEngine*)engine levelOpen:(NSDictionary*)level
{
    [self.targetLabel setTextColor:[level objectForKey:@"targetColor"]];
    [self.targetLabel setText:[level objectForKey:@"targetText"]];
    
    [self.I setBackgroundColor:[[level objectForKey:@"possibleResponse"] objectAtIndex:0]];
    [self.II setBackgroundColor:[[level objectForKey:@"possibleResponse"] objectAtIndex:1]];
    [self.III setBackgroundColor:[[level objectForKey:@"possibleResponse"] objectAtIndex:2]];
    [self.IV setBackgroundColor:[[level objectForKey:@"possibleResponse"] objectAtIndex:3]];
}

- (void)OOEngine:(OOEngine*)engine levelSuccess:(double)score
{
}

- (void)OOEngine:(OOEngine*)engine levelFaill:(double)score
{
    
}

@end








