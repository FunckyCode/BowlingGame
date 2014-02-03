//
//  BowlingGameTests.m
//  BowlingGameTests
//
//  Created by Fernando Canon on 02/02/14.
//  Copyright (c) 2014 Fernando Canon. All rights reserved.
//

#import <XCTest/XCTest.h>


//SUT
#import "Game.h"

@interface BowlingGameTests : XCTestCase{

    Game *gameModel;
}
@end

@implementation BowlingGameTests

- (void)setUp
{
    gameModel =[[Game alloc] init];
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    gameModel=nil;
    [super tearDown];
}

-(void) testGameInit
{
    XCTAssertTrue(gameModel, "Failure alloc Game");
    
}

- (void) testGameScore {

    int pins=1;
    int n=20;
    [self rollPins:pins times:n];
    XCTAssertEqual([gameModel score], n, "score is not correct on gamemodel");
}

- (void)testAllOnes {
    
    [self rollPins:1 times:20];
    XCTAssertEqual([gameModel score], 20, "Fail Testing all ones");
}

- (void)rollPins:(int)pins times:(int)n {
    for (int i = 0; i < n; ++i)
        [gameModel rollWithPinCount:pins];
}

- (void) testOneSpare {
    [gameModel rollWithPinCount:5];
    [gameModel rollWithPinCount:5];
    [gameModel rollWithPinCount:3];
    [self rollPins:0 times:17];
    XCTAssertEqual([gameModel score], 16, "Fail Testing all ones");
    
}

-(void)testOneStrike {
    
    [gameModel rollWithPinCount:10]; // strike
    [gameModel rollWithPinCount:3];
    [gameModel rollWithPinCount:4];
    [self rollPins:0 times:16];
    XCTAssertEqual([gameModel score], 24, "One Strike should be 24");
}

-(void) testStrike{
    [gameModel rollWithPinCount:10];
    [gameModel rollWithPinCount:5];
    [gameModel rollWithPinCount:1];
    
    XCTAssertEqual([gameModel score],22,"Should not return a value until next roll");
}

-(void) testLastRollWithStroke{
    [self rollPins:1 times:18];
    [gameModel rollWithPinCount:10];
    [gameModel rollWithPinCount:2];
    [gameModel rollWithPinCount:2];
    
    XCTAssertEqual([gameModel score],36,"Should not return a value until next roll");
}

-(void) testPerfectGame{
    
     [self rollPins:10 times:21];
    
    XCTAssertEqual([gameModel score],300,"Should not return a value until next roll");
}

-(void) testLastRollWithNonSpecial{
    [self rollPins:1 times:18];
    [gameModel rollWithPinCount:2];
    [gameModel rollWithPinCount:2];


    XCTAssertEqual([gameModel score],22,"Should not return a value until next roll");
}

-(void) testIsStrikeMethod{
    XCTAssertTrue([gameModel isStrike:10], "Should be true");
    ;
}
@end
