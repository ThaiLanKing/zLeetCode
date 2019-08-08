//
//  ViewController.m
//  zLeetCodeSample
//
//  Created by ZhangYaoHua on 2019/8/1.
//  Copyright © 2019 ZYH. All rights reserved.
//

#import "ViewController.h"
#import "zLeetCodeManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSArray *testArr = @[@"abcabcbb",
//                         @"bbbb",
//                         @"pwwkew",
//                         @"abcdefghiabfblvlrlvrjislcsepopeprytyiopqmngytrexsawqlb"];
//    
//    for (NSString *testString in testArr) {
//        [zLeetCodeManager lengthOfLongestSubstring:testString];
//    }
//    
//    
//    {
//        NSArray *testArr = @[@"babad",
//                             @"cbbd",
//                             @"abcba",
//                             @"abcddcba",
//                             @"abcdcbef",
//                             @"m",
//                             @"abc"
//                             ];
//        for (NSString *testString in testArr) {
//            [zLeetCodeManager longestPalindrome:testString];
//            NSLog(@"======");
//        }
//    }
    
//    {
//        NSString *testStr = @"LEETCODEISHIRING";
//        NSString *result = [zLeetCodeManager convertedString:testStr toNumRows:3];
//        NSLog(@"%@ / 3 = %@", testStr, result);
//
//        result = [zLeetCodeManager convertedString:testStr toNumRows:4];
//        NSLog(@"%@ / 4 = %@", testStr, result);
//
//        NSLog(@"============");
//
//        result = [zLeetCodeManager convertedString:testStr toNumRows:1];
//        NSLog(@"%@ / 1 = %@", testStr, result);
//
//        result = [zLeetCodeManager convertedString:testStr toNumRows:2];
//        NSLog(@"%@ / 2 = %@", testStr, result);
//
//        result = [zLeetCodeManager convertedString:testStr toNumRows:testStr.length];
//        NSLog(@"%@ / %d = %@", testStr, (int)testStr.length, result);
//
//        result = [zLeetCodeManager convertedString:testStr toNumRows:testStr.length + 1];
//        NSLog(@"%@ / %d = %@", testStr, (int)testStr.length + 1, result);
//    }
    
//    {
//        NSArray *testArr = @[@1, @8, @6, @2, @5, @4, @8, @3, @7];
//        NSInteger maxArea = [zLeetCodeManager maxArea:testArr];
//        NSLog(@"maxArea : %d", (int)maxArea);
//    }
    
//    {
//        NSArray *testValues = @[@3, @4, @9, @58, @1994, @3999];
//        for (NSNumber *testValue in testValues) {
//            NSString *result = [zLeetCodeManager intToRoman:[testValue integerValue]];
//            NSLog(@"roman = %@", result);
//
//            NSInteger intValue = [zLeetCodeManager romanToInt:result];
//            NSLog(@"int = %d", (int)intValue);
//        }
//    }
    
    {
        NSArray *testStrings = @[@"flower", @"flow", @"flight"];
        NSString *result = [zLeetCodeManager longestCommonPrefix:testStrings];
        NSLog(@"longestCommonPrefix = %@", result);
        
        testStrings = @[@"dog", @"racecar", @"car"];
        result = [zLeetCodeManager longestCommonPrefix:testStrings];
        NSLog(@"longestCommonPrefix = %@", result);
        
        testStrings = @[@"fly", @"flying", @"flySky"];
        result = [zLeetCodeManager longestCommonPrefix:testStrings];
        NSLog(@"longestCommonPrefix = %@", result);
        
        testStrings = @[@"", @"flying", @"flySky"];
        result = [zLeetCodeManager longestCommonPrefix:testStrings];
        NSLog(@"longestCommonPrefix = %@", result);
    }
}


@end
