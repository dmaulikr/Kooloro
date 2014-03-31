//
//  OOEngine.m
//  Kooloro
//
//  Created by hugo mazet on 31/03/2014.
//  Copyright (c) 2014 Moutaarde. All rights reserved.
//

#import "OOEngine.h"


#define totalColor      5

//*********************************************************************************
//*********************************************************************************
//*********************************************************************************

#pragma mark -
#pragma mark CLASS EXTENSION
#pragma mark -

@interface OOEngine()

@property (nonatomic) double score;

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
    [self openLevel];
}

// ----------------------------------------------------------------------------------------------
// Stop Game
// ----------------------------------------------------------------------------------------------
- (void)stopGame
{
    [self.delegate OOEngine:self levelFaill:self.score];
}

// ----------------------------------------------------------------------------------------------
// Open Level
// ----------------------------------------------------------------------------------------------
- (void)openLevel
{
    NSDictionary *answer = [NSDictionary dictionary];
    NSArray *possibleResponse = [NSArray array];
    OOEngineColor levelColor;
    OOEngineColor levelText;
    OOEngineLevelType levelType = [self generateLevelType];
    
  
    [self generateLevelColor:&levelColor andLevelText:&levelText forLevelType:levelType];
    possibleResponse = [self generatePossibleResponseForLevelColor:levelColor levelText:levelText andLevelType:levelType];
    
    answer = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                      [NSNumber numberWithInt:levelType],@"levelType",
                      [NSNumber numberWithInt:levelColor],@"levelColor",
                      [NSNumber numberWithInt:levelText],@"levelText",
                      possibleResponse,@"possibleResponse",
                      nil];
    
    [self.delegate OOEngine:self levelOpen:answer];
}

// ----------------------------------------------------------------------------------------------
// Correction
// ----------------------------------------------------------------------------------------------
- (void)correct:(OOEngineColor)response forAnswer:(NSDictionary*)answer;
{
    switch ([[answer objectForKey:@"levelType"]integerValue])
    {
        case OOEngineLevelTypeMatch:
            [self.delegate OOEngine:self levelSuccess:self.score];
            break;
            
        case OOEngineLevelTypeColor:
            if ([[answer objectForKey:@"levelColor"]integerValue] == response)
                 [self.delegate OOEngine:self levelSuccess:self.score];
            else
                 [self.delegate OOEngine:self levelFaill:self.score];
            break;

        case OOEngineLevelTypeText:
            if ([[answer objectForKey:@"levelText"]integerValue] == response)
                [self.delegate OOEngine:self levelSuccess:self.score];
            else
                [self.delegate OOEngine:self levelFaill:self.score];
            break;

        default:
            [self.delegate OOEngine:self levelFaill:self.score];
            break;
    }
}


#pragma mark - Generate
// ----------------------------------------------------------------------------------------------
// Generate Type
// ----------------------------------------------------------------------------------------------
- (OOEngineLevelType)generateLevelType
{
    OOEngineLevelType Type = arc4random() % 2;
    return Type;
}

// ----------------------------------------------------------------------------------------------
// Generate Target
// ----------------------------------------------------------------------------------------------
- (void)generateLevelColor:(OOEngineColor *)color andLevelText:(OOEngineColor *)text forLevelType:(OOEngineLevelType)type
{
    *color = arc4random() % totalColor;
    *text = arc4random() % totalColor;
}

// ----------------------------------------------------------------------------------------------
// Generate Possible Response
// ----------------------------------------------------------------------------------------------
- (NSArray*)generatePossibleResponseForLevelColor:(OOEngineColor)color
                                             levelText:(OOEngineColor)text
                                          andLevelType:(OOEngineLevelType)levelType
{
    
    NSMutableArray *response = [NSMutableArray array];
    
    for (int i=0; i<4; i++)
    {
        [response addObject:[NSNumber numberWithInt:arc4random() % totalColor]];
    }
    
    NSUInteger indexColor = arc4random() % 4;
    NSUInteger indexText = arc4random() % 4;
    [response setObject:[NSNumber numberWithInt:color] atIndexedSubscript:indexColor];
        
    while (indexColor == indexText) {
        indexText = arc4random() % 4;
    }
    
    [response setObject:[NSNumber numberWithInt:text] atIndexedSubscript:indexText];
    
    return response;
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









