//
//  OOEngine.h
//  Kooloro
//
//  Created by hugo mazet on 31/03/2014.
//  Copyright (c) 2014 Moutaarde. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "OOTimeEngine.h"

typedef enum : NSUInteger {
    OOEngineLevelTypeText,
    OOEngineLevelTypeColor,
} OOEngineLevelType;

typedef enum : NSUInteger {
    OOEnginecolorRed,
    OOEnginecolorGreen,
    OOEnginecolorBlue,
    OOEnginecolorYellow,
    OOEnginecolorPurple,
    OOEnginecolorOrange,
    OOEnginecolorPink,
} OOEngineColor;

@class OOEngine;

@protocol OOEngineProtocol <NSObject>

- (void)OOEngine:(OOEngine*)engine levelOpen:(NSDictionary*)level;
- (void)OOEngine:(OOEngine*)engine levelSuccess:(double)score;
- (void)OOEngine:(OOEngine*)engine gameOver:(double)score;

@end

@interface OOEngine : NSObject <OOTimeEngineProtocol>

@property (nonatomic, strong) OOTimeEngine *timeEngine;
@property (nonatomic, weak) id<OOEngineProtocol> delegate;

- (instancetype)initWithTimeEngineFrame:(CGRect)frame;

- (void)startGame;
- (void)openLevel;
- (void)correct:(OOEngineColor)response forAnswer:(NSDictionary*)answer;

- (UIColor*)getColor:(OOEngineColor)color;
- (NSString*)getText:(OOEngineColor)color;

@end
