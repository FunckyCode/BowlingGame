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


-(void) rollWithPinCount:(NSInteger) pins
{
    if (lastRoll == 21) {
        return;
    }
    
    rolls[lastRoll++]=pins;
    if ([self isStrike:pins] && lastRoll <19) {
        lastRoll++;
    }
}

-(NSInteger) score
{
    NSInteger currentScore=0;
    NSInteger rollPoints=0;
    
    for (int turn=0; turn<lastRoll; turn+=2) {
        
   
        rollPoints=rolls[turn]+rolls[turn+1];
        
        if ([self isStrike:rolls[turn]]) { // strike
            
            if([self isLastRoll:turn]){
                rollPoints+=rolls[turn+1];
                turn--;
              
            }else
                 rollPoints+=rolls[turn+2]+rolls[turn+3];
        }
        else if ([self areRollPointSpare:rollPoints]){ // spare
            if ([self isLastRoll:turn]) {
                rollPoints+=rolls[turn+1];
                turn--;
            }else
                rollPoints+=rolls[turn+2];
                
        }
        currentScore+=rollPoints;
    }
    return currentScore;
}

-(BOOL) isStrike:(NSInteger)pinValue{

    return pinValue==10?YES:NO;
}

-(BOOL) areRollPointSpare:(NSInteger)pins
{
    return [self isStrike:pins];
}

-(BOOL) isLastRoll:(int) currentRoll{

    return currentRoll >= 18;
}

@end
