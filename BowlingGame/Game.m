//
//  Game.m
//  BowlingGame
//
//  Created by Fernando Canon on 02/02/14.
//  Copyright (c) 2014 Fernando Canon. All rights reserved.
//

#import "Game.h"

@implementation Game
@synthesize count;


- (id)init
{
    self = [super init];
    if (self) {
        count = 0;
        lastRoll =0;
    }
    return self;
}


-(void) rollWithPinCount:(int) pins
{
    rolls[lastRoll]=pins;
    lastRoll++;
}

-(NSInteger) score
{
    
    NSInteger currentScore=0;
    for (int i=0; i<=lastRoll; i++) {
        currentScore+=rolls[i];
    }
    return currentScore;
}


@end
