//
//  OOTutoViewController.m
//  Kooloro
//
//  Created by hugo mazet on 30/03/2014.
//  Copyright (c) 2014 Moutaarde. All rights reserved.
//

#import "OOTutoViewController.h"

@interface OOTutoViewController ()

@end

@implementation OOTutoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[OOCoreColor whiteBack]];
    
    [self.view1 setBackgroundColor:[OOCoreColor redTile]];
    [self.view2 setBackgroundColor:[OOCoreColor blueTile]];
    [self.view3 setBackgroundColor:[OOCoreColor greenTile]];
    [self.view4 setBackgroundColor:[OOCoreColor yellowTile]];
    [self.view5 setBackgroundColor:[OOCoreColor purpleTile]];
    [self.view6 setBackgroundColor:[OOCoreColor pinkTile]];
    [self.view7 setBackgroundColor:[OOCoreColor orangeTile]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
