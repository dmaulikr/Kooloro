//
//  OOEngine.h
//  Kooloro
//
//  Created by hugo mazet on 31/03/2014.
//  Copyright (c) 2014 Moutaarde. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    OOEngineLevelTypeText,
    OOEngineLevelTypeColor,
    OOEngineLevelTypeMatch,
} OOEngineLevelType;

typedef enum : NSUInteger {
    OOEnginecolorRed,
    OOEnginecolorGreen,
    OOEnginecolorBlue,
    OOEnginecolorYellow,
    OOEnginecolorPurple
} OOEngineColor;

@class OOEngine;

@protocol OOEngineProtocol <NSObject>

- (void)OOEngine:(OOEngine*)engine levelOpen:(NSDictionary*)level;
- (void)OOEngine:(OOEngine*)engine levelSuccess:(double)score;
- (void)OOEngine:(OOEngine*)engine levelFaill:(double)score;

@end

@interface OOEngine : NSObject

@property (nonatomic, weak) id<OOEngineProtocol> delegate;

- (void)startGame;
- (void)openLevel;
- (void)correct:(OOEngineColor)response forAnswer:(NSDictionary*)answer;

- (UIColor*)getColor:(OOEngineColor)color;
- (NSString*)getText:(OOEngineColor)color;

@end
