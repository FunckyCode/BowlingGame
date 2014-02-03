//
//  Game.h
//  BowlingGame
//
//  Created by Fernando Canon on 02/02/14.
//  Copyright (c) 2014 Fernando Canon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Game : NSObject{

    NSInteger count;
    NSInteger rolls [22];
    NSInteger lastRoll;
}

@property (nonatomic,readwrite) NSInteger count;

-(void) rollWithPinCount:(NSInteger) pins;
-(NSInteger) score;
-(BOOL) isStrike:(NSInteger)pinValue;
@end
