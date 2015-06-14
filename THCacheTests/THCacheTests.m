//
//  THCacheTests.m
//  THCacheTests
//
//  Created by Hannes Tribus on 12/06/15.
//  Copyright (c) 2015 3Bus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "THCache.h"

@interface THCacheTests : XCTestCase

@end

@implementation THCacheTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    //[THCacher removeItemsFromCacheWithKey:@"testStringStorageKey"error:nil];
    [THCacher removeItemsFromCacheWithKey:@"testNSArrayStorageKey"error:nil];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testStringStorage {
    XCTAssertNil([THCacher restoreItemsFromCacheWithKey:@"testStringStorageKey"], "Found NSString object before storing it");
    XCTAssertTrue([THCacher storeItemsToCache:@"ItemToStore" withKey:@"testStringStorageKey"], "Could not store NSString object");
    XCTAssertTrue([@"ItemToStore" isEqualToString:(NSString *)[THCacher restoreItemsFromCacheWithKey:@"testStringStorageKey"]], "Found different NSString object then stored");
    
    NSError *err;
    XCTAssertTrue([THCacher removeItemsFromCacheWithKey:@"testStringStorageKey"error:&err], @"NSString object existed and was deleted");
    XCTAssertNil(err,"Error Deleting NSString object");
}

- (void)testNSArrayStorage {
    NSArray *array;
    XCTAssertNil([array initArrayFromCacheWithKey:@"testNSArrayStorageKey"], "Found NSArray object before storing it");
    NSArray *array2 = @[@"ItemToStore", @"ItemToStore"];
    XCTAssertTrue([array2 storeArrayToCacheWithKey:@"testNSArrayStorageKey"], "Could not store NSArray object");
    array = [[NSArray alloc] initArrayFromCacheWithKey:@"testNSArrayStorageKey"];
    XCTAssertTrue([array2 isEqualToArray:array], "Found different NSArray object then stored");
    
    NSError *err;
    XCTAssertTrue([array removeArrayFromCacheWithKey:@"testNSArrayStorageKey"error:&err], @"NSArray object existed and was deleted");
    XCTAssertNil(err,"Error Deleting NSArray object");
}

- (void)testNSDataStorage {
    NSData *data;
    XCTAssertNil([data initDataFromCacheWithKey:@"testNSDataStorageKey"], "Found NSData object before storing it");
    data = [@"ItemToStore" dataUsingEncoding:NSUTF8StringEncoding];
    XCTAssertTrue([data storeDataToCacheWithKey:@"testNSDataStorageKey"], "Could not store NSData object");
    XCTAssertTrue([[@"ItemToStore" dataUsingEncoding:NSUTF8StringEncoding]isEqualToData:[data initDataFromCacheWithKey:@"testNSDataStorageKey"]], "Found different NSData object then stored");
    
    NSError *err;
    XCTAssertTrue([data removeDataFromCacheWithKey:@"testNSDataStorageKey"error:&err], @"NSData object existed and was deleted");
    XCTAssertNil(err,"Error Deleting NSData object");
}

- (void)testNSDictionaryStorage {
    NSDictionary *dictionary;
    XCTAssertNil([dictionary initDictionaryFromCacheWithKey:@"testNSDictionaryStorageKey"], "Found NSDictionary object before storing it");
    NSDictionary *dictionary2 = @{@"Key1" : @"ItemToStore", @"Key2" : @"ItemToStore"};
    XCTAssertTrue([dictionary2 storeDictionaryToCacheWithKey:@"testNSDictionaryStorageKey"], "Could not store NSDictionary object");
    dictionary = [[NSDictionary alloc] initDictionaryFromCacheWithKey:@"testNSDictionaryStorageKey"];
    XCTAssertTrue([dictionary2 isEqualToDictionary:dictionary], "Found different NSDictionary object then stored");
    
    NSError *err;
    XCTAssertTrue([dictionary removeDictionaryFromCacheWithKey:@"testNSDictionaryStorageKey"error:&err], @"NSDictionary object existed and was deleted");
    XCTAssertNil(err,"Error Deleting NSDictionary object");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
