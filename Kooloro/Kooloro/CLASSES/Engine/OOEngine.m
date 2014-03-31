//
//  OOEngine.m
//  Kooloro
//
//  Created by hugo mazet on 31/03/2014.
//  Copyright (c) 2014 Moutaarde. All rights reserved.
//

#import "OOEngine.h"

typedef enum : NSUInteger {
    OOEngineLevelTypeMatch,
    OOEngineLevelTypeText,
    OOEngineLevelTypeColor,
} OOEngineLevelType;

typedef enum : NSUInteger {
    OOEnginecolorRed,
    OOEnginecolorGreen,
    OOEnginecolorBlue,
    OOEnginecolorYellow,
    OOEnginecolorPurple
} OOEngineColor;

#define totalColor      5

//*********************************************************************************
//*********************************************************************************
//*********************************************************************************

#pragma mark -
#pragma mark CLASS EXTENSION
#pragma mark -

@interface OOEngine()

@property (nonatomic) double score;

@property (nonatomic) OOEngineColor targetColor;
@property (nonatomic) OOEngineColor targetText;
@property (nonatomic, strong) NSMutableArray *possibleResponse;
@property (nonatomic, strong) NSMutableDictionary *theAnswer;

@end

//*********************************************************************************
//*********************************************************************************
//*********************************************************************************

#pragma mark -
#pragma mark CLASS IMPLEMENTATION
#pragma mark -

@implementation OOEngine

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.theAnswer = [NSMutableDictionary dictionary];
        self.possibleResponse = [NSMutableArray array];
    }
    return self;
}

#pragma mark - Manage Game
// ----------------------------------------------------------------------------------------------
// Start Game
// ----------------------------------------------------------------------------------------------
- (void)startGame
{
    self.score = 0;
    self.theAnswer = [NSMutableDictionary dictionary];
    self.possibleResponse = [NSMutableArray array];
    
    [self openLevel];
}

// ----------------------------------------------------------------------------------------------
// Open Level
// ----------------------------------------------------------------------------------------------
- (void)openLevel
{
    OOEngineLevelType type = [self generateLevelType];
    
    switch (type)
    {
        case OOEngineLevelTypeMatch:
            
            break;
            
        case OOEngineLevelTypeText:
            
            break;
            
        case OOEngineLevelTypeColor:
            
            break;
            
        default:
            break;
    }
    
    
    [self generateTarget];
    [self generateTarget];
    [self generatePossibleResponse:type];
    
    self.theAnswer = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                      [self getColor:self.targetColor],@"targetColor",
                      [self getText:self.targetText],@"targetText",
                      self.possibleResponse,@"possibleResponse",
                      nil];
    
    [self.delegate OOEngine:self levelOpen:self.theAnswer];
    
}

// ----------------------------------------------------------------------------------------------
// Game Over
// ----------------------------------------------------------------------------------------------
- (void)gameOver
{
    
}


#pragma mark - Generate
// ----------------------------------------------------------------------------------------------
// Generate Type
// ----------------------------------------------------------------------------------------------
- (OOEngineLevelType)generateLevelType
{
    OOEngineLevelType Type = arc4random() % 3;
    return Type;
}

// ----------------------------------------------------------------------------------------------
// Generate Target
// ----------------------------------------------------------------------------------------------
- (void)generateTarget
{
    self.targetColor = arc4random() % totalColor;
    self.targetText = arc4random() % totalColor;
}

// ----------------------------------------------------------------------------------------------
// Generate Possible Response
// ----------------------------------------------------------------------------------------------
- (void)generatePossibleResponse:(OOEngineLevelType)levelType
{
    for (int i=0; i<4; i++)
    {
        [self.possibleResponse addObject:[self getColor:arc4random() % totalColor]];
    }
    
    [self.possibleResponse setObject:[self getColor:self.targetColor] atIndexedSubscript:arc4random() % 4];
    [self.possibleResponse setObject:[self getColor:self.targetText] atIndexedSubscript:arc4random() % 4];
}

#pragma mark - Get color

// ----------------------------------------------------------------------------------------------
// Generate UICOLOR
// ----------------------------------------------------------------------------------------------
- (UIColor*)getColor:(OOEngineColor)color
{
    switch (color)
    {
        case OOEnginecolorRed:
            return [OOCoreColor redTile];
            break;
            
        case OOEnginecolorGreen:
            return [OOCoreColor greenTile];
            break;
            
        case OOEnginecolorBlue:
            return [OOCoreColor blueTile];
            break;
            
        case OOEnginecolorYellow:
            return [OOCoreColor yellowTile];
            break;
            
        case OOEnginecolorPurple:
        default:
            return [OOCoreColor purpleTile];
            break;
    }
    
}

// ----------------------------------------------------------------------------------------------
// Generate NSSTRING
// ----------------------------------------------------------------------------------------------
- (NSString*)getText:(OOEngineColor)color
{
    switch (color)
    {
        case OOEnginecolorRed:
            return NSLocalizedString(@"COLOR_red", @"red");
            break;
            
        case OOEnginecolorGreen:
            return NSLocalizedString(@"COLOR_green", @"green");
            break;
            
        case OOEnginecolorBlue:
            return NSLocalizedString(@"COLOR_blue", @"blue");
            break;
            
        case OOEnginecolorYellow:
            return NSLocalizedString(@"COLOR_yellow", @"yellow");
            break;
            
        case OOEnginecolorPurple:
        default:
            return NSLocalizedString(@"COLOR_purple", @"purple");
            break;
    }
    
}


@end









