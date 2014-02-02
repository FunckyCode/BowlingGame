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
    NSInteger rolls [21];
    NSInteger lastRoll;
}

@property (nonatomic,readwrite) NSInteger count;

-(void) rollWithPinCount:(int) pins;
-(NSInteger) score;
@end
