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

#import "SLRMDMConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface SLRMDMConfig ()

/**
 * The configuration payload from the MDM managing the device.
 */
@property (nonatomic, copy, class, nullable, readonly) NSDictionary<NSString *, id> *config;

@end

@implementation SLRMDMConfig

#pragma mark - Object Life Cycle

- (instancetype)init __attribute__((noreturn))
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"-init is not available on SLRMDMConfig" userInfo:nil];
}

+ (instancetype)new __attribute__((noreturn))
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"+new is not available on SLRMDMConfig" userInfo:nil];
}

#pragma mark - Public API

+ (nullable NSDictionary<NSString *, id> *)rawConfiguration
{
    return [self.config copy];
}

+ (nullable id)objectForKey:(NSString *)key
{
    NSParameterAssert(key != nil);
    return self.config[key];
}

+ (nullable NSArray<id> *)arrayForKey:(NSString *)key
{
    id array = [self objectForKey:key];
    return [array isKindOfClass:[NSArray class]] ? (NSArray<id> *)array : nil;
}

+ (nullable NSMutableArray<id> *)mutableArrayForKey:(NSString *)key
{
    return [[self arrayForKey:key] mutableCopy];
}

+ (nullable NSData *)dataForKey:(NSString *)key;

{
    id data = [self objectForKey:key];
    return [data isKindOfClass:[NSData class]] ? (NSData *)data : nil;
}

+ (nullable NSMutableData *)mutableDataForKey:(NSString *)key
{
    return [[self dataForKey:key] mutableCopy];
}

+ (nullable NSDate *)dateForKey:(NSString *)key
{
    id date = [self objectForKey:key];
    return [date isKindOfClass:[NSDate class]] ? (NSDate *)date : nil;
}

+ (nullable NSDictionary<id, id> *)dictionaryForKey:(NSString *)key
{
    id dictionary = [self objectForKey:key];
    return [dictionary isKindOfClass:[NSDictionary class]] ? (NSDictionary<id, id> *)dictionary : nil;
}

+ (nullable NSMutableDictionary<id, id> *)mutableDictionaryForKey:(NSString *)key
{
    return [[self dictionaryForKey:key] mutableCopy];
}

+ (nullable NSNumber *)numberForKey:(NSString *)key
{
    id number = [self objectForKey:key];
    return [number isKindOfClass:[NSNumber class]] ? (NSNumber *)number : nil;
}

+ (nullable NSString *)stringForKey:(NSString *)key
{
    id string = [self objectForKey:key];
    return [string isKindOfClass:[NSString class]] ? (NSString *)string : nil;
}

+ (nullable NSMutableString *)mutableStringForKey:(NSString *)key
{
    return [[self stringForKey:key] mutableCopy];
}

+ (nullable NSAttributedString *)attributedStringForKey:(NSString *)key
{
    NSString *string = [self stringForKey:key];
    return string != nil ? [[NSAttributedString alloc] initWithString:string] : nil;
}

+ (nullable NSMutableAttributedString *)mutableAttributedStringForKey:(NSString *)key
{
    return [[self attributedStringForKey:key] mutableCopy];
}

+ (nullable NSSet<id> *)setForKey:(NSString *)key
{
    NSArray *array = [self arrayForKey:key];
    return array != nil ? [NSSet setWithArray:array] : nil;
}

+ (nullable NSMutableSet<id> *)mutableSetForKey:(NSString *)key
{
    return [[self setForKey:key] mutableCopy];
}

+ (nullable NSOrderedSet<id> *)orderedSetForKey:(NSString *)key
{
    NSArray *array = [self arrayForKey:key];
    return array != nil ? [NSOrderedSet orderedSetWithArray:array] : nil;
}

+ (nullable NSMutableOrderedSet<id> *)mutableOrderedSetForKey:(NSString *)key
{
    return [[self orderedSetForKey:key] mutableCopy];
}

+ (nullable NSURL *)URLForKey:(NSString *)key
{
    NSString *urlString = [self stringForKey:key];
    if (!urlString.length) {
        return nil;
    }
    
    return [NSURL URLWithString:(NSString *_Nonnull)urlString];
}

+ (nullable NSURLComponents *)URLComponentsForKey:(NSString *)key
{
    NSString *urlString = [self stringForKey:key];
    if (!urlString.length) {
        return nil;
    }
    
    return [NSURLComponents componentsWithString:(NSString *_Nonnull)urlString];
}

+ (BOOL)boolForKey:(NSString *)key
{
    id boolObject = [self objectForKey:key];
    return ([boolObject isKindOfClass:[NSNumber class]] || [boolObject isKindOfClass:[NSString class]]) ? [boolObject boolValue] : false;
}

+ (char)charForKey:(NSString *)key
{
    return [self numberForKey:key].charValue;
}

+ (NSDecimal)decimalForKey:(NSString *)key
{
    return [self numberForKey:key].decimalValue;
}

+ (nullable NSDecimalNumber *)decimalNumberForKey:(NSString *)key
{
    return [NSDecimalNumber decimalNumberWithDecimal:[self decimalForKey:key]];
}

+ (double)doubleForKey:(NSString *)key
{
    id doubleObject = [self objectForKey:key];
    return ([doubleObject isKindOfClass:[NSNumber class]] || [doubleObject isKindOfClass:[NSString class]]) ? [doubleObject doubleValue] : 0.0;
}

+ (float)floatForKey:(NSString *)key
{
    id floatObject = [self objectForKey:key];
    return ([floatObject isKindOfClass:[NSNumber class]] || [floatObject isKindOfClass:[NSString class]]) ? [floatObject floatValue] : 0.0;
}

+ (int)intForKey:(NSString *)key
{
    id intObject = [self objectForKey:key];
    return ([intObject isKindOfClass:[NSNumber class]] || [intObject isKindOfClass:[NSString class]]) ? [intObject intValue] : 0;
}

+ (NSInteger)integerForKey:(NSString *)key
{
    id integerObject = [self objectForKey:key];
    return ([integerObject isKindOfClass:[NSNumber class]] || [integerObject isKindOfClass:[NSString class]]) ? [integerObject integerValue] : 0;
}

+ (long)longForKey:(NSString *)key
{
    return [self numberForKey:key].longValue;
}

+ (long long)longLongForKey:(NSString *)key
{
    id longObject = [self objectForKey:key];
    return ([longObject isKindOfClass:[NSNumber class]] || [longObject isKindOfClass:[NSString class]]) ? [longObject longLongValue] : 0;
}

+ (short)shortForKey:(NSString *)key
{
    return [self numberForKey:key].shortValue;
}

+ (unsigned char)unsignedCharForKey:(NSString *)key
{
    return [self numberForKey:key].unsignedCharValue;
}

+ (unsigned int)unsignedIntForKey:(NSString *)key
{
    return [self numberForKey:key].unsignedIntValue;
}

+ (NSUInteger)unsignedIntegerForKey:(NSString *)key
{
    return [self numberForKey:key].unsignedIntegerValue;
}

+ (unsigned long)unsignedLongForKey:(NSString *)key
{
    return [self numberForKey:key].unsignedLongValue;
}

+ (unsigned long long)unsignedLongLongForKey:(NSString *)key
{
    return [self numberForKey:key].unsignedLongLongValue;
}

+ (unsigned short)unsignedShortForKey:(NSString *)key
{
    return [self numberForKey:key].unsignedShortValue;
}

#pragma mark - Private API

+ (nullable NSDictionary<NSString *, id> *)config
{
    return [NSUserDefaults.standardUserDefaults dictionaryForKey:@"com.apple.configuration.managed"];
}

@end

NS_ASSUME_NONNULL_END
