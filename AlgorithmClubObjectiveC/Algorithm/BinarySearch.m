//
//  BinarySearch.m
//  AlgorithmClubObjectiveC
//
//  Created by Панов Андрей on 10.02.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

#import "BinarySearch.h"

@implementation BinarySearch

+ (NSUInteger)getIndexWithSortedArray:(NSArray *)array element:(NSUInteger)element range:(NSRange)range {
    
    if (range.location > range.length) return 0;
    
    NSUInteger midIndex = range.location + (range.length - range.location) / 2;
    
    if ([array[midIndex] integerValue] > element) {
        
        return [BinarySearch getIndexWithSortedArray:array element:element range:NSMakeRange(range.location, midIndex)];
    }
    else if ([array[midIndex] integerValue] > element) {
        
        return [BinarySearch getIndexWithSortedArray:array element:element range:NSMakeRange(midIndex, range.length)];
    }
    else return midIndex;
    
    return 0;
}

+ (NSUInteger)getIndexWithSortedArray:(NSArray *)array element:(NSUInteger)element {
    
    NSRange range = NSMakeRange(0, array.count);
    
    while (range.location < range.length) {
        
        NSUInteger midIndex = range.location + (range.length - range.location) / 2;
        if ([array[midIndex] integerValue] == element) return midIndex;
        else if ([array[midIndex] integerValue] > element) {
            
            range.length = midIndex;
        }
        else if ([array[midIndex] integerValue] < element) {
            
            range.location = midIndex;
        }
    }
    return 0;
}

@end
