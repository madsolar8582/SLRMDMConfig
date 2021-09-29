/**
 * Copyright (©) 2021 Madison Solarana
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */

@import XCTest;
@import SLRMDMConfig;
#import <stdlib.h>

NS_ASSUME_NONNULL_BEGIN

@interface SLRMDMConfigTests : XCTestCase

@end

@implementation SLRMDMConfigTests

- (void)setUp
{
    [super setUp];
    [self resetDefaults];
}

- (void)tearDown
{
    [self resetDefaults];
    [super tearDown];
}

- (void)testRawConfiguration
{
    NSDictionary *testConfig = @{@"test" : @"test"};
    [self initializeMDMConfigWithDictionary:testConfig];
    XCTAssertEqualObjects(SLRMDMConfig.rawConfiguration, testConfig);
}

- (void)testObjectForKey
{
    NSString *uuid = [NSUUID UUID].UUIDString;
    [self initializeMDMConfigWithDictionary:@{@"test" : uuid}];
    XCTAssertEqualObjects([SLRMDMConfig objectForKey:@"test"], uuid);
}

- (void)testArrayForKey
{
    NSString *uuid = [NSUUID UUID].UUIDString;
    [self initializeMDMConfigWithDictionary:@{@"test" : @[uuid]}];
    XCTAssertEqualObjects([SLRMDMConfig arrayForKey:@"test"], @[uuid]);
}

- (void)testMutableArrayForKey
{
    NSString *uuid = [NSUUID UUID].UUIDString;
    [self initializeMDMConfigWithDictionary:@{@"test" : @[uuid]}];
    NSArray *result = [SLRMDMConfig mutableArrayForKey:@"test"];
    XCTAssertEqualObjects(result, @[uuid]);
    XCTAssertTrue([result isKindOfClass:[NSMutableArray class]]);
}

- (void)testDataForKey
{
    NSString *uuid = [NSUUID UUID].UUIDString;
    NSData *data = [uuid dataUsingEncoding:NSUTF8StringEncoding];
    [self initializeMDMConfigWithDictionary:@{@"test" : data}];
    XCTAssertEqualObjects([SLRMDMConfig dataForKey:@"test"], data);
}

- (void)testMutableDataForKey
{
    NSString *uuid = [NSUUID UUID].UUIDString;
    NSData *data = [uuid dataUsingEncoding:NSUTF8StringEncoding];
    [self initializeMDMConfigWithDictionary:@{@"test" : data}];
    NSData *result = [SLRMDMConfig mutableDataForKey:@"test"];
    XCTAssertEqualObjects(result, data);
    XCTAssertTrue([result isKindOfClass:[NSMutableData class]]);
}

- (void)testDateForKey
{
    NSDate *date = NSDate.now;
    [self initializeMDMConfigWithDictionary:@{@"test" : date}];
    XCTAssertEqualObjects([SLRMDMConfig dateForKey:@"test"], date);
}

- (void)testDictionaryForKey
{
    NSString *uuid = [NSUUID UUID].UUIDString;
    [self initializeMDMConfigWithDictionary:@{@"test" : @{@"example" : uuid}}];
    XCTAssertEqualObjects([SLRMDMConfig dictionaryForKey:@"test"], @{@"example" : uuid});
}

- (void)testMutableDictionaryForKey
{
    NSString *uuid = [NSUUID UUID].UUIDString;
    [self initializeMDMConfigWithDictionary:@{@"test" : @{@"example" : uuid}}];
    NSDictionary *result = [SLRMDMConfig mutableDictionaryForKey:@"test"];
    XCTAssertEqualObjects(result, @{@"example" : uuid});
    XCTAssertTrue([result isKindOfClass:[NSMutableDictionary class]]);
}

- (void)testNumberForKey
{
    NSNumber *num = @(arc4random_uniform(101));
    [self initializeMDMConfigWithDictionary:@{@"test" : num}];
    XCTAssertEqualObjects([SLRMDMConfig numberForKey:@"test"], num);
}

- (void)testStringForKey
{
    NSString *uuid = [NSUUID UUID].UUIDString;
    [self initializeMDMConfigWithDictionary:@{@"test" : uuid}];
    XCTAssertEqualObjects([SLRMDMConfig stringForKey:@"test"], uuid);
}

- (void)testMutableStringForKey
{
    NSString *uuid = [NSUUID UUID].UUIDString;
    [self initializeMDMConfigWithDictionary:@{@"test" : uuid}];
    NSString *result = [SLRMDMConfig mutableStringForKey:@"test"];
    XCTAssertEqualObjects(result, uuid);
    XCTAssertTrue([result isKindOfClass:[NSMutableString class]]);
}

- (void)testAttributedStringForKey
{
    NSString *uuid = [NSUUID UUID].UUIDString;
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:uuid];
    [self initializeMDMConfigWithDictionary:@{@"test" : uuid}];
    XCTAssertEqualObjects([SLRMDMConfig attributedStringForKey:@"test"], string);
}

- (void)testMutableAttributedStringForKey
{
    NSString *uuid = [NSUUID UUID].UUIDString;
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:uuid];
    [self initializeMDMConfigWithDictionary:@{@"test" : uuid}];
    NSAttributedString *result = [SLRMDMConfig mutableAttributedStringForKey:@"test"];
    XCTAssertEqualObjects(result, string);
    XCTAssertTrue([result isKindOfClass:[NSMutableAttributedString class]]);
}

- (void)testSetForKey
{
    NSString *uuid = [NSUUID UUID].UUIDString;
    [self initializeMDMConfigWithDictionary:@{@"test" : @[uuid]}];
    NSSet *set = [NSSet setWithObject:uuid];
    XCTAssertEqualObjects([SLRMDMConfig setForKey:@"test"], set);
}

- (void)testMutableSetForKey
{
    NSString *uuid = [NSUUID UUID].UUIDString;
    [self initializeMDMConfigWithDictionary:@{@"test" : @[uuid]}];
    NSSet *set = [NSSet setWithObject:uuid];
    NSSet *result = [SLRMDMConfig mutableSetForKey:@"test"];
    XCTAssertEqualObjects(result, set);
    XCTAssertTrue([result isKindOfClass:[NSMutableSet class]]);
}

- (void)testOrderedSetForKey
{
    NSString *uuid = [NSUUID UUID].UUIDString;
    [self initializeMDMConfigWithDictionary:@{@"test" : @[uuid]}];
    NSOrderedSet *set = [NSOrderedSet orderedSetWithObject:uuid];
    XCTAssertEqualObjects([SLRMDMConfig orderedSetForKey:@"test"], set);
}

- (void)testMutableOrderedSetForKey
{
    NSString *uuid = [NSUUID UUID].UUIDString;
    [self initializeMDMConfigWithDictionary:@{@"test" : @[uuid]}];
    NSOrderedSet *set = [NSOrderedSet orderedSetWithObject:uuid];
    NSMutableOrderedSet *result = [SLRMDMConfig mutableOrderedSetForKey:@"test"];
    XCTAssertEqualObjects(result, set);
    XCTAssertTrue([result isKindOfClass:[NSMutableOrderedSet class]]);
}

- (void)testURLForKey
{
    NSString *string = [NSString stringWithFormat:@"https://www.example/com/%@", [NSUUID UUID].UUIDString];
    [self initializeMDMConfigWithDictionary:@{@"test" : string}];
    XCTAssertEqualObjects([SLRMDMConfig URLForKey:@"test"], [NSURL URLWithString:string]);
}

- (void)testURLForKeyEmptyString
{
    [self initializeMDMConfigWithDictionary:@{@"test" : @""}];
    XCTAssertNil([SLRMDMConfig URLForKey:@"test"]);
}

- (void)testURLComponentsForKey
{
    NSString *string = [NSString stringWithFormat:@"https://www.example/com/%@", [NSUUID UUID].UUIDString];
    [self initializeMDMConfigWithDictionary:@{@"test" : string}];
    XCTAssertEqualObjects([SLRMDMConfig URLComponentsForKey:@"test"], [NSURLComponents componentsWithString:string]);
}

- (void)testURLComponentsForKeyEmptyString
{
    [self initializeMDMConfigWithDictionary:@{@"test" : @""}];
    XCTAssertNil([SLRMDMConfig URLComponentsForKey:@"test"]);
}

- (void)testBoolForKeyNumberValue
{
    [self initializeMDMConfigWithDictionary:@{@"test" : @YES}];
    XCTAssertTrue([SLRMDMConfig boolForKey:@"test"]);
}

- (void)testBoolForKeyStringValue
{
    [self initializeMDMConfigWithDictionary:@{@"test" : @"true"}];
    XCTAssertTrue([SLRMDMConfig boolForKey:@"test"]);
}

- (void)testCharForKey
{
    [self initializeMDMConfigWithDictionary:@{@"test" : @('z')}];
    XCTAssertEqual([SLRMDMConfig charForKey:@"test"], 'z');
}

- (void)testDecimalForKey
{
    NSDecimal decimal = @(1.5).decimalValue;
    [self initializeMDMConfigWithDictionary:@{@"test" : @1.5}];
    NSDecimal decimal2 = [SLRMDMConfig decimalForKey:@"test"];
    NSDecimal *expected = &decimal;
    NSDecimal *result = &decimal2;
    XCTAssertEqual(NSDecimalCompare(result, expected), NSOrderedSame);
}

- (void)testDecimalNumberForKey
{
    NSNumber *num = @(arc4random_uniform(101));
    [self initializeMDMConfigWithDictionary:@{@"test" : num}];
    XCTAssertEqualObjects([SLRMDMConfig decimalNumberForKey:@"test"], [NSDecimalNumber decimalNumberWithDecimal:num.decimalValue]);
}

- (void)testDoubleForKeyNumberValue
{
    NSNumber *num = @(0.5);
    [self initializeMDMConfigWithDictionary:@{@"test" : num}];
    XCTAssertEqualWithAccuracy([SLRMDMConfig doubleForKey:@"test"], 0.5, 0.01);
}

- (void)testDoubleForKeyStringValue
{
    [self initializeMDMConfigWithDictionary:@{@"test" : @"0.8"}];
    XCTAssertEqualWithAccuracy([SLRMDMConfig doubleForKey:@"test"], 0.8, 0.01);
}

- (void)testFloatForKeyNumberValue
{
    NSNumber *num = @(0.3);
    [self initializeMDMConfigWithDictionary:@{@"test" : num}];
    XCTAssertEqualWithAccuracy([SLRMDMConfig floatForKey:@"test"], 0.3, 0.01);
}

- (void)testFloatForKeyStringValue
{
    [self initializeMDMConfigWithDictionary:@{@"test" : @"0.7"}];
    XCTAssertEqualWithAccuracy([SLRMDMConfig floatForKey:@"test"], 0.7, 0.01);
}

- (void)testIntForKeyNumberValue
{
    NSNumber *num = @(arc4random_uniform(101));
    [self initializeMDMConfigWithDictionary:@{@"test" : num}];
    XCTAssertEqual([SLRMDMConfig intForKey:@"test"], num.intValue);
}

- (void)testIntForKeyStringValue
{
    NSString *string = [NSString stringWithFormat:@"%i", arc4random_uniform(101)];
    [self initializeMDMConfigWithDictionary:@{@"test" : string}];
    XCTAssertEqual([SLRMDMConfig intForKey:@"test"], string.intValue);
}

- (void)testIntegerForKeyNumberValue
{
    NSNumber *num = @(arc4random_uniform(101));
    [self initializeMDMConfigWithDictionary:@{@"test" : num}];
    XCTAssertEqual([SLRMDMConfig integerForKey:@"test"], num.integerValue);
}

- (void)testIntegerForKeyStringValue
{
    NSString *string = [NSString stringWithFormat:@"%i", arc4random_uniform(101)];
    [self initializeMDMConfigWithDictionary:@{@"test" : string}];
    XCTAssertEqual([SLRMDMConfig integerForKey:@"test"], string.integerValue);
}

- (void)testLongForKey
{
    NSNumber *num = @(arc4random_uniform(101));
    [self initializeMDMConfigWithDictionary:@{@"test" : num}];
    XCTAssertEqual([SLRMDMConfig longForKey:@"test"], num.longValue);
}

- (void)testLongLongForKeyNumberValue
{
    NSNumber *num = @(arc4random_uniform(101));
    [self initializeMDMConfigWithDictionary:@{@"test" : num}];
    XCTAssertEqual([SLRMDMConfig longLongForKey:@"test"], num.longLongValue);
}

- (void)testLongLongForKeyStringValue
{
    NSString *string = [NSString stringWithFormat:@"%i", arc4random_uniform(101)];
    [self initializeMDMConfigWithDictionary:@{@"test" : string}];
    XCTAssertEqual([SLRMDMConfig longLongForKey:@"test"], string.longLongValue);
}

- (void)testShortForKey
{
    NSNumber *num = @(arc4random_uniform(101));
    [self initializeMDMConfigWithDictionary:@{@"test" : num}];
    XCTAssertEqual([SLRMDMConfig shortForKey:@"test"], num.shortValue);
}

- (void)testUnsignedCharForKey
{
    [self initializeMDMConfigWithDictionary:@{@"test" : @('z')}];
    XCTAssertEqual([SLRMDMConfig unsignedCharForKey:@"test"], 'z');
}

- (void)testUnsignedIntForKey
{
    NSNumber *num = @(arc4random_uniform(101));
    [self initializeMDMConfigWithDictionary:@{@"test" : num}];
    XCTAssertEqual([SLRMDMConfig unsignedIntForKey:@"test"], num.unsignedIntValue);
}

- (void)testUnsignedIntegerForKey
{
    NSNumber *num = @(arc4random_uniform(101));
    [self initializeMDMConfigWithDictionary:@{@"test" : num}];
    XCTAssertEqual([SLRMDMConfig unsignedIntegerForKey:@"test"], num.unsignedIntegerValue);
}

- (void)testUnsignedLongForKey
{
    NSNumber *num = @(arc4random_uniform(101));
    [self initializeMDMConfigWithDictionary:@{@"test" : num}];
    XCTAssertEqual([SLRMDMConfig unsignedLongForKey:@"test"], num.unsignedLongValue);
}

- (void)testUnsignedLongLongForKey
{
    NSNumber *num = @(arc4random_uniform(101));
    [self initializeMDMConfigWithDictionary:@{@"test" : num}];
    XCTAssertEqual([SLRMDMConfig unsignedLongLongForKey:@"test"], num.unsignedLongLongValue);
}

- (void)testUnsignedShortForKey
{
    NSNumber *num = @(arc4random_uniform(101));
    [self initializeMDMConfigWithDictionary:@{@"test" : num}];
    XCTAssertEqual([SLRMDMConfig unsignedShortForKey:@"test"], num.unsignedShortValue);
}

#pragma mark - Helpers

/**
 * Resets the MDM config as well as the standard user defaults.
 */
- (void)resetDefaults
{
    [NSUserDefaults.standardUserDefaults removeObjectForKey:@"com.apple.configuration.managed"];
    [NSUserDefaults resetStandardUserDefaults];
}

/**
 * Sets the MDM configuration to the given dictionary.
 * @param dictionary The configuration to set as the MDM config.
 */
- (void)initializeMDMConfigWithDictionary:(NSDictionary<NSString *, id> *)dictionary
{
    [NSUserDefaults.standardUserDefaults setObject:dictionary forKey:@"com.apple.configuration.managed"];
}

@end

NS_ASSUME_NONNULL_END
