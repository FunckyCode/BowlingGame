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
@end
