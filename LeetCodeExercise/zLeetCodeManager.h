//
//  zLeetCodeManager.h
//  zLeetCodeSample
//
//  Created by ZhangYaoHua on 2019/8/2.
//  Copyright © 2019 ZYH. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface zLeetCodeManager : NSObject

+ (NSArray *)twoSum:(NSArray<NSNumber *> *)nums
             target:(NSInteger)target;

+ (NSInteger)lengthOfLongestSubstring:(NSString *)srcString;

+ (NSString *)longestPalindrome:(NSString *)srcString;

+ (NSString *)convertedString:(NSString *)srcString toNumRows:(NSInteger)numRows;

+ (NSInteger)maxArea:(NSArray *)heights;

+ (NSString *)intToRoman:(NSInteger)value;

+ (NSInteger)romanToInt:(NSString *)romanValue;

+ (NSString *)longestCommonPrefix:(NSArray<NSString *> *)strings;

+ (NSArray *)letterCombinations:(NSString *)digits;

@end

NS_ASSUME_NONNULL_END
