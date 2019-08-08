//
//  zLeetCodeManager.m
//  zLeetCodeSample
//
//  Created by ZhangYaoHua on 2019/8/2.
//  Copyright © 2019 ZYH. All rights reserved.
//

#import "zLeetCodeManager.h"

@implementation zLeetCodeManager

+ (NSArray *)twoSum:(NSArray<NSNumber *> *)nums
             target:(NSInteger)target
{
    NSInteger numCount = nums.count;
    if (numCount < 2) {
        return nil;
    }
    
    for (NSInteger indexA = 0; indexA < numCount - 1; ++indexA) {
        NSInteger valueA = [nums[indexA] integerValue];
        //        if (valueA >= target) {
        //            continue;
        //        }
        
        for (NSInteger indexB = indexA + 1; indexB < numCount; ++indexB) {
            NSInteger valueB = [nums[indexB] integerValue];
            //            if (valueB >= target) {
            //                continue;
            //            }
            
            if (valueA + valueB == target) {
                NSLog(@"valueA = %d, valueB = %d", (int)valueA, (int)valueB);
                return @[@(indexA), @(indexB)];
            }
        }
    }
    
    return nil;
}

+ (NSInteger)lengthOfLongestSubstring:(NSString *)srcString
{
    NSInteger maxLength = 0;
    NSString *longestSubString = nil;
    NSString *tempSubString = @"";
    for (int i = 0; i < srcString.length; ++i) {
        NSString *alphabet = [srcString substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [tempSubString rangeOfString:alphabet];
        if (range.location != NSNotFound) {
            if (maxLength < tempSubString.length) {
                maxLength = tempSubString.length;
                longestSubString = tempSubString;
            }
            tempSubString = [tempSubString substringFromIndex:range.location + 1];
            tempSubString = [tempSubString stringByAppendingString:alphabet];
        }
        else {
            tempSubString = [tempSubString stringByAppendingString:alphabet];
        }
    }
    NSLog(@"longestSubString : %@, maxLength = %d", longestSubString, (int)maxLength);
    return maxLength;
}

#pragma mark - 最大回文字串

+ (NSString *)longestPalindrome:(NSString *)srcString
{
    NSInteger maxLength = 0;
    NSString *longestSubString = nil;
    NSInteger srcLength = srcString.length;
    if (srcLength == 1) {
        longestSubString = srcString;
        maxLength = 1;
        NSLog(@"longestSubString : %@, length : %d", longestSubString, (int)maxLength);
        return longestSubString;
    }
    
    NSInteger testPalindromStringLength = srcLength;
    do {
        for (int i = 0; i <= srcLength - testPalindromStringLength; ++i) {
            NSString *testPalindromString = [srcString substringWithRange:NSMakeRange(i, testPalindromStringLength)];
            
            NSLog(@"testPalindromString : %@", testPalindromString);
            
            if ([[self class] isPalindromeString:testPalindromString]) {
                longestSubString = testPalindromString;
                maxLength = testPalindromStringLength;
                NSLog(@"longestSubString : %@, length : %d", longestSubString, (int)maxLength);
                return longestSubString;
            }
        }
        --testPalindromStringLength;
    } while (testPalindromStringLength > 0);
    
    maxLength = longestSubString.length;
    NSLog(@"longestSubString : %@, length : %d", longestSubString, (int)maxLength);
    
    return longestSubString;
}

+ (BOOL)isPalindromeString:(NSString *)srcString
{
    NSInteger srcLength = srcString.length;
    if (srcLength == 0) {
        return NO;
    }
    if (srcLength == 1) {
        return YES;
    }
    NSString *headString = nil;
    NSString *tailString = nil;
    if (srcLength % 2 == 0) {
        headString = [srcString substringToIndex:srcLength/2];
        tailString = [srcString substringFromIndex:srcLength/2];
    }
    else {
        headString = [srcString substringToIndex:srcLength/2];
        tailString = [srcString substringFromIndex:srcLength/2 + 1];
    }
    
    NSString *reversedHeadString = [[self class] reversedStringFromString:headString];
    return [reversedHeadString isEqualToString:tailString];
}

+ (NSString *)reversedStringFromString:(NSString *)srcString
{
    NSRange reverseRange = NSMakeRange(0, srcString.length);
    return [[self class] reversedStringFromString:srcString withRange:reverseRange];
}

+ (NSString *)reversedStringFromString:(NSString *)srcString
                             withRange:(NSRange)reverseRange
{
    __block NSString *resultStr = @"";
    [srcString enumerateSubstringsInRange:reverseRange options:NSStringEnumerationByComposedCharacterSequences | NSStringEnumerationReverse usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        resultStr = [resultStr stringByAppendingString:substring];
    }];
    return resultStr;
}

#pragma mark -

+ (NSString *)convertedString:(NSString *)srcString toNumRows:(NSInteger)numRows
{
    if (numRows <= 1) {
        return srcString;
    }
    
    NSMutableArray *rowArr = [NSMutableArray arrayWithCapacity:numRows];
    for (int i = 0; i < numRows; ++i) {
        NSMutableArray *tempArr = [NSMutableArray arrayWithCapacity:0];
        [rowArr addObject:tempArr];
    }
    
    NSInteger srcLength = srcString.length;
    __block NSInteger arrLocation = 0;
    __block NSInteger arrDicrection = -1;
    [srcString enumerateSubstringsInRange:NSMakeRange(0, srcLength) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        [rowArr[arrLocation] addObject:substring];
        if (arrLocation == numRows - 1 ||
            arrLocation == 0) {
            arrDicrection = -arrDicrection;
        }
        
#ifdef DEBUG //测试
        
        if (arrDicrection < 0 && arrLocation > 0 && arrLocation < numRows - 1) {
            [rowArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if (idx != arrLocation) {
                    [obj addObject:@" "];
                }
            }];
        }
        
#endif
        
        arrLocation += arrDicrection;
    }];
    
#ifdef DEBUG //测试

    NSLog(@"=============");
    [rowArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *result = @"";
        for (NSString *test in obj) {
            result = [result stringByAppendingString:test];
        }
        NSLog(@"%@\n", result);
    }];
    NSLog(@"=============");
#endif
    
    NSString *result = @"";
    for (NSArray *tempArr in rowArr) {
        for (NSString *subStr in tempArr) {
#ifdef DEBUG //测试
            
            if ([subStr isEqualToString:@" "]) {
                continue;
            }
            
#endif
            result = [result stringByAppendingString:subStr];
        }
    }
    return result;
}

//#pragma mark - 判断一个整数是不是回文数
//
//+ (BOOL)isPalindromeIntegral:(NSInteger)srcValue
//{
//    if (srcValue < 0) {
//        return NO;
//    }
//
//    NSMutableArray *numArr = [NSMutableArray arrayWithCapacity:0];
//    while (srcValue / pow(10, numArr.count + 1) != 0) {
//
//    }
//}

//+ (NSInteger)maxArea:(NSArray *)heights
//{
//    NSInteger maxArea = 0;
//    for (NSInteger i = 0; i < heights.count - 1; ++i) {
//        NSInteger height = [heights[i] integerValue];
//        NSInteger tempArea = 0;
//        for (NSInteger j = heights.count - 1; j > i; --j) {
//            NSInteger otherHeight = [heights[j] integerValue];
//            if (otherHeight >= height) {
//                tempArea = (j - i) * height;
//                NSLog(@"tempArea : %d", (int)tempArea);
//                maxArea = MAX(maxArea, tempArea);
//                break;
//            }
//        }
//    }
//
//    for (NSInteger i = heights.count - 1; i > 0; --i) {
//        NSInteger height = [heights[i] integerValue];
//        NSInteger tempArea = 0;
//        for (NSInteger j = 0; j < heights.count - 1; ++j) {
//            NSInteger otherHeight = [heights[j] integerValue];
//            if (otherHeight >= height) {
//                tempArea = (i - j) * height;
//                NSLog(@"tempArea : %d", (int)tempArea);
//                maxArea = MAX(maxArea, tempArea);
//                break;
//            }
//        }
//    }
//
//    return maxArea;
//}

+ (NSInteger)maxArea:(NSArray *)heights
{
    if (heights.count < 2) {
        return 0;
    }
    NSInteger maxArea = 0;
    
    NSInteger i = 0;
    NSInteger j = heights.count - 1;
    
    do {
        NSInteger heightLeft = [heights[i] integerValue];
        NSInteger heightRight = [heights[j] integerValue];
        NSInteger tempArea = (j - i) * MIN(heightLeft, heightRight);
        maxArea = MAX(maxArea, tempArea);
        if (heightLeft < heightRight) {
            ++i;
        }
        else {
            --j;
        }
    } while (j > i);
    
    return maxArea;
}

#pragma mark -

+ (NSString *)intToRoman:(NSInteger)value
{
    if (value < 1 || value > 3999) {
        return nil;
    }
    
    static NSString * const CommonValueKey = @"CommonValueKey";
    static NSString * const CommonRomanKey = @"CommonRomanKey";
    
    NSArray *romanRules = @[@{CommonValueKey : @1, CommonRomanKey : @"I"},
                            @{CommonValueKey : @4, CommonRomanKey : @"IV"},
                            @{CommonValueKey : @5, CommonRomanKey : @"V"},
                            @{CommonValueKey : @9, CommonRomanKey : @"IX"},
                            @{CommonValueKey : @10, CommonRomanKey : @"X"},
                            @{CommonValueKey : @40, CommonRomanKey : @"XL"},
                            @{CommonValueKey : @50, CommonRomanKey : @"L"},
                            @{CommonValueKey : @90, CommonRomanKey : @"XC"},
                            @{CommonValueKey : @100, CommonRomanKey : @"C"},
                            @{CommonValueKey : @400, CommonRomanKey : @"CD"},
                            @{CommonValueKey : @500, CommonRomanKey : @"D"},
                            @{CommonValueKey : @900, CommonRomanKey : @"CM"},
                            @{CommonValueKey : @1000, CommonRomanKey : @"M"},];
    __block NSInteger tempValue = value;
    __block NSString *result = @"";
    [romanRules enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSInteger ruleValue = [obj[CommonValueKey] integerValue];
        if (tempValue >= ruleValue) {
            NSInteger count = tempValue/ruleValue;
            while (count > 0) {
                result = [result stringByAppendingString:obj[CommonRomanKey]];
                --count;
            }
            tempValue = tempValue % ruleValue;
        }
    }];
    return result;
}

//+ (NSInteger)romanToInt:(NSString *)romanValue
//{
//    NSArray *romanValues = @[@"CM", @"CD", @"XC", @"XL", @"IX", @"IV",
//                             @"M", @"D", @"C", @"L", @"X", @"V", @"I"];
//    NSArray *intValues = @[@900, @400, @90, @40, @9, @4,
//                           @1000, @500, @100, @50, @10, @5, @1];
//
//    __block NSString *tempRomanValue = romanValue;
//    __block NSInteger result = 0;
//    while (tempRomanValue.length > 0) {
//
//        [romanValues enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            NSRange range = [tempRomanValue rangeOfString:obj];
//            if (range.location != NSNotFound) {
//                NSInteger intValue = [intValues[idx] integerValue];
//                result += intValue;
//                tempRomanValue = [tempRomanValue stringByReplacingCharactersInRange:range withString:@""];
//            }
//        }];
//
//    }
//    return result;
//}

+ (NSInteger)romanToInt:(NSString *)romanValue
{
    NSDictionary *romanRules = @{@"I" : @1,
                                 @"IV" : @4,
                                 @"V" : @5,
                                 @"IX" : @9,
                                 @"X" : @10,
                                 @"XL" : @40,
                                 @"L" : @50,
                                 @"XC" : @90,
                                 @"C" : @100,
                                 @"CD" : @400,
                                 @"D" : @500,
                                 @"CM" : @900,
                                 @"M" : @1000};
    
    __block NSInteger result = 0;
    
    for (int i = 0; i < romanValue.length; ++i) {
        NSString *curRomanValue = [romanValue substringWithRange:NSMakeRange(i, 1)];
        NSInteger curValue = [romanRules[curRomanValue] integerValue];
        if (i + 1 < romanValue.length) {
            NSString *nextRomanValue = [romanValue substringWithRange:NSMakeRange(i+1, 1)];
            NSInteger nextValue = [romanRules[nextRomanValue] integerValue];
            if (curValue >= nextValue) {
                result += curValue;
            }
            else {
                result -= curValue;
            }
        }
        else {
            result += curValue;
        }
    }
    return result;
}

#pragma mark -

+ (NSString *)longestCommonPrefix:(NSArray<NSString *> *)strings
{
    if (strings.count < 2) {
        return @"";
    }
    
    NSString *commonPrefix = [strings firstObject];
    if (commonPrefix.length == 0) {
        return @"";
    }
    for (int i = 1; i < strings.count; ++i) {
        NSString *testString = strings[i];
//        NSLog(@"testString = %@", testString);
//        NSLog(@"commonPrefix = %@", commonPrefix);
        if (![testString hasPrefix:commonPrefix]) {
            NSInteger newCommonLength = commonPrefix.length - 1;
            if (newCommonLength > 0) {
                commonPrefix = [commonPrefix substringToIndex:newCommonLength];
                --i;
            }
            else {
                commonPrefix = @"";
                break;
            }
        }
    }
    return commonPrefix;
}

@end
