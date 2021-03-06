//
//  OOGameOnViewController.h
//  Kooloro
//
//  Created by hugo mazet on 30/03/2014.
//  Copyright (c) 2014 Moutaarde. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OOEngine.h"
#import "KIRollingCounter.h"

@interface OOGameOnViewController : UIViewController <OOEngineProtocol>

@property (weak, nonatomic) IBOutlet UILabel *targetLabel;
@property (strong, nonatomic) KIRollingCounter *scoreCounter;

@property (weak, nonatomic) IBOutlet UIImageView *levelTypeImageView;
@property (weak, nonatomic) IBOutlet UIButton *I;
@property (weak, nonatomic) IBOutlet UIButton *II;
@property (weak, nonatomic) IBOutlet UIButton *III;
@property (weak, nonatomic) IBOutlet UIButton *IV;

@end
