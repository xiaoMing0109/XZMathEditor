//
//  XZMathEditorTests.m
//  XZMathEditorTests
//
//  Created by xiaoMing0109 on 03/10/2020.
//  Copyright (c) 2020 xiaoMing0109. All rights reserved.
//

@import XCTest;

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    NSString *string = @"{}kxkf^{}x";
    if ([string containsString:@"{}"]) {
        string = [string stringByReplacingOccurrencesOfString:@"{}" withString:@""];
    }
    NSLog(@"string:%@", string);
}

@end

