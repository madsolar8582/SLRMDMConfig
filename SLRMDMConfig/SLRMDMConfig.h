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

#if __has_feature(modules)
@import Foundation;
#else
#import <Foundation/Foundation.h>
#endif

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SLRMDMConfig
 * Provides convenience methods for obtaining MDM configuration values.
 */
@interface SLRMDMConfig : NSObject

/**
 * The raw MDM payload pushed to the device.
 */
@property (nonatomic, copy, class, nullable, readonly) NSDictionary<NSString *, id> *rawConfiguration;

- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)new NS_UNAVAILABLE;

/**
 * Obtains the value for the specified key from the MDM payload pushed to the device.
 * @param key The key to query for.
 * @return The value for the specified key from the MDM payload or nil.
 */
+ (nullable id)objectForKey:(NSString *)key;

/**
 * Obtains the array value for the specified key from the MDM payload pushed to the device.
 * @param key The key to query for.
 * @return The array value for the specified key from the MDM payload or nil.
 */
+ (nullable NSArray<id> *)arrayForKey:(NSString *)key;

/**
 * Obtains the mutable array value for the specified key from the MDM payload pushed to the device.
 * @param key The key to query for.
 * @return The mutable array value for the specified key from the MDM payload or nil.
 */
+ (nullable NSMutableArray<id> *)mutableArrayForKey:(NSString *)key;

/**
 * Obtains the data value for the specified key from the MDM payload pushed to the device.
 * @param key The key to query for.
 * @return The data value for the specified key from the MDM payload or nil.
 */
+ (nullable NSData *)dataForKey:(NSString *)key;

/**
 * Obtains the mutable data value for the specified key from the MDM payload pushed to the device.
 * @param key The key to query for.
 * @return The mutable data value for the specified key from the MDM payload or nil.
 */
+ (nullable NSMutableData *)mutableDataForKey:(NSString *)key;

/**
 * Obtains the date value for the specified key from the MDM payload pushed to the device.
 * @param key The key to query for.
 * @return The date value for the specified key from the MDM payload or nil.
 */
+ (nullable NSDate *)dateForKey:(NSString *)key;

/**
 * Obtains the dictionary value for the specified key from the MDM payload pushed to the device.
 * @param key The key to query for.
 * @return The dictionary value for the specified key from the MDM payload or nil.
 */
+ (nullable NSDictionary<id, id> *)dictionaryForKey:(NSString *)key;

/**
 * Obtains the mutable dictionary value for the specified key from the MDM payload pushed to the device.
 * @param key The key to query for.
 * @return The mutable dictionary value for the specified key from the MDM payload or nil.
 */
+ (nullable NSMutableDictionary<id, id> *)mutableDictionaryForKey:(NSString *)key;

/**
 * Obtains the number value for the specified key from the MDM payload pushed to the device.
 * @param key The key to query for.
 * @return The number value for the specified key from the MDM payload or nil.
 */
+ (nullable NSNumber *)numberForKey:(NSString *)key;

/**
 * Obtains the string value for the specified key from the MDM payload pushed to the device.
 * @param key The key to query for.
 * @return The string value for the specified key from the MDM payload or nil.
 */
+ (nullable NSString *)stringForKey:(NSString *)key;

/**
 * Obtains the mutable string value for the specified key from the MDM payload pushed to the device.
 * @param key The key to query for.
 * @return The mutable string value for the specified key from the MDM payload or nil.
 */
+ (nullable NSMutableString *)mutableStringForKey:(NSString *)key;

/**
 * Obtains the attributed string value for the specified key from the MDM payload pushed to the device.
 * @param key The key to query for.
 * @return The attributed string value for the specified key from the MDM payload or nil.
 */
+ (nullable NSAttributedString *)attributedStringForKey:(NSString *)key;

/**
 * Obtains the mutable attributed string value for the specified key from the MDM payload pushed to the device.
 * @param key The key to query for.
 * @return The mutable attributed string value for the specified key from the MDM payload or nil.
 */
+ (nullable NSMutableAttributedString *)mutableAttributedStringForKey:(NSString *)key;

/**
 * Obtains the set value for the specified key from the MDM payload pushed to the device. The value in the payload must be an array.
 * @param key The key to query for.
 * @return The set value for the specified key from the MDM payload or nil.
 */
+ (nullable NSSet<id> *)setForKey:(NSString *)key;

/**
 * Obtains the mutable set value for the specified key from the MDM payload pushed to the device. The value in the payload must be an array.
 * @param key The key to query for.
 * @return The mutable set value for the specified key from the MDM payload or nil.
 */
+ (nullable NSMutableSet<id> *)mutableSetForKey:(NSString *)key;

/**
 * Obtains the ordered set value for the specified key from the MDM payload pushed to the device. The value in the payload must be an array.
 * @param key The key to query for.
 * @return The ordered set value for the specified key from the MDM payload or nil.
 */
+ (nullable NSOrderedSet<id> *)orderedSetForKey:(NSString *)key;

/**
 * Obtains the mutable ordered set value for the specified key from the MDM payload pushed to the device. The value in the payload must be an array.
 * @param key The key to query for.
 * @return The mutable ordered set value for the specified key from the MDM payload or nil.
 */
+ (nullable NSMutableOrderedSet<id> *)mutableOrderedSetForKey:(NSString *)key;

/**
 * Obtains the URL value for the specified key from the MDM payload pushed to the device. The value in the payload must be an string.
 * @param key The key to query for.
 * @return The URL value for the specified key from the MDM payload or nil.
 */
+ (nullable NSURL *)URLForKey:(NSString *)key;

/**
 * Obtains the URL component value for the specified key from the MDM payload pushed to the device. The value in the payload must be an string.
 * @param key The key to query for.
 * @return The URL component value for the specified key from the MDM payload or nil.
 */
+ (nullable NSURLComponents *)URLComponentsForKey:(NSString *)key;

/**
 * Obtains the boolean value for the specified key from the MDM payload pushed to the device. The value in the payload may be a string or a number.
 * @param key The key to query for.
 * @return The boolean value for the specified key from the MDM payload or false.
 */
+ (BOOL)boolForKey:(NSString *)key;

/**
 * Obtains the signed char value for the specified key from the MDM payload pushed to the device.
 * @param key The key to query for.
 * @return The signed char value for the specified key from the MDM payload or '0'.
 */
+ (char)charForKey:(NSString *)key;

/**
 * Obtains the decimal value for the specified key from the MDM payload pushed to the device.
 * @param key The key to query for.
 * @return The decimal value for the specified key from the MDM payload or the NSDecimal equivalent of zero.
 */
+ (NSDecimal)decimalForKey:(NSString *)key;

/**
 * Obtains the decimal number value for the specified key from the MDM payload pushed to the device.
 * @param key The key to query for.
 * @return The decimal nubmer value for the specified key from the MDM payload or the NSDecimalNumber equivalent of zero.
 */
+ (nullable NSDecimalNumber *)decimalNumberForKey:(NSString *)key;

/**
 * Obtains the double value for the specified key from the MDM payload pushed to the device. The value in the payload may be a string or a number.
 * @param key The key to query for.
 * @return The double value for the specified key from the MDM payload or 0.0.
 */
+ (double)doubleForKey:(NSString *)key;

/**
 * Obtains the float value for the specified key from the MDM payload pushed to the device. The value in the payload may be a string or a number.
 * @param key The key to query for.
 * @return The float value for the specified key from the MDM payload or 0.0.
 */
+ (float)floatForKey:(NSString *)key;

/**
 * Obtains the int value for the specified key from the MDM payload pushed to the device. The value in the payload may be a string or a number.
 * @param key The key to query for.
 * @return The int value for the specified key from the MDM payload or 0.
 */
+ (int)intForKey:(NSString *)key;

/**
 * Obtains the integer value for the specified key from the MDM payload pushed to the device. The value in the payload may be a string or a number.
 * @param key The key to query for.
 * @return The integer value for the specified key from the MDM payload or 0.
 */
+ (NSInteger)integerForKey:(NSString *)key;

/**
 * Obtains the long value for the specified key from the MDM payload pushed to the device.
 * @param key The key to query for.
 * @return The long value for the specified key from the MDM payload or 0.
 */
+ (long)longForKey:(NSString *)key;

/**
 * Obtains the long long value for the specified key from the MDM payload pushed to the device. The value in the payload may be a string or a number.
 * @param key The key to query for.
 * @return The long long value for the specified key from the MDM payload or 0.
 */
+ (long long)longLongForKey:(NSString *)key;

/**
 * Obtains the short value for the specified key from the MDM payload pushed to the device.
 * @param key The key to query for.
 * @return The short value for the specified key from the MDM payload or 0.
 */
+ (short)shortForKey:(NSString *)key;

/**
 * Obtains the unsigned char value for the specified key from the MDM payload pushed to the device.
 * @param key The key to query for.
 * @return The unsigned char value for the specified key from the MDM payload or '0'.
 */
+ (unsigned char)unsignedCharForKey:(NSString *)key;

/**
 * Obtains the unsigned int value for the specified key from the MDM payload pushed to the device.
 * @param key The key to query for.
 * @return The unsigned int value for the specified key from the MDM payload or 0.
 */
+ (unsigned int)unsignedIntForKey:(NSString *)key;

/**
 * Obtains the unsigned integer value for the specified key from the MDM payload pushed to the device.
 * @param key The key to query for.
 * @return The unsigned integer value for the specified key from the MDM payload or 0.
 */
+ (NSUInteger)unsignedIntegerForKey:(NSString *)key;

/**
 * Obtains the unsigned long value for the specified key from the MDM payload pushed to the device.
 * @param key The key to query for.
 * @return The unsigned long value for the specified key from the MDM payload or 0.
 */
+ (unsigned long)unsignedLongForKey:(NSString *)key;

/**
 * Obtains the unsigned long long value for the specified key from the MDM payload pushed to the device.
 * @param key The key to query for.
 * @return The unsigned long long value for the specified key from the MDM payload or 0.
 */
+ (unsigned long long)unsignedLongLongForKey:(NSString *)key;

/**
 * Obtains the unsigned short value for the specified key from the MDM payload pushed to the device.
 * @param key The key to query for.
 * @return The unsigned short value for the specified key from the MDM payload or 0.
 */
+ (unsigned short)unsignedShortForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
