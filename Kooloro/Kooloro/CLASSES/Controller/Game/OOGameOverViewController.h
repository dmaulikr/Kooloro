//
//  OOGameOverViewController.h
//  Kooloro
//
//  Created by hugo mazet on 30/03/2014.
//  Copyright (c) 2014 Moutaarde. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OOGameOverViewController : UIViewController

@property (strong, nonatomic) NSString *score;
@property (weak, nonatomic) IBOutlet UILabel *gameOverTitle;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *yourScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *bestScoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *homeButton;

@end
