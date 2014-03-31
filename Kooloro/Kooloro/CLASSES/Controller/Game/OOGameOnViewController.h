//
//  OOGameOnViewController.h
//  Kooloro
//
//  Created by hugo mazet on 30/03/2014.
//  Copyright (c) 2014 Moutaarde. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OOEngine.h"

@interface OOGameOnViewController : UIViewController <OOEngineProtocol>

@property (weak, nonatomic) IBOutlet UILabel *targetLabel;

@property (weak, nonatomic) IBOutlet UILabel *levelTypeLabel;
@property (weak, nonatomic) IBOutlet UIButton *I;
@property (weak, nonatomic) IBOutlet UIButton *II;
@property (weak, nonatomic) IBOutlet UIButton *III;
@property (weak, nonatomic) IBOutlet UIButton *IV;

@end
