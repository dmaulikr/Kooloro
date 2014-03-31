//
//  OOEngine.h
//  Kooloro
//
//  Created by hugo mazet on 31/03/2014.
//  Copyright (c) 2014 Moutaarde. All rights reserved.
//

#import <Foundation/Foundation.h>

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

@end
