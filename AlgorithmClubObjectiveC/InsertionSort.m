//
//  InsertionSort.m
//  AlgorithmClubObjectiveC
//
//  Created by Панов Андрей on 09.02.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

#import "InsertionSort.h"

@interface InsertionSort()

+(BOOL)comparisonValue1:(NSUInteger)value1 value2:(NSUInteger)value2 ascending:(BOOL)ascending;

@end

@implementation InsertionSort

+ (NSArray *)insertionSort:(NSMutableArray *)unsortedArray ascending:(BOOL)ascending {
    
    unsigned j;
    for (unsigned i = 1; i < unsortedArray.count; i++) {
        
        j = i;
        while (j > 0 && [InsertionSort comparisonValue1:[unsortedArray[j-1] integerValue] value2:[unsortedArray[j] integerValue] ascending:ascending]) {
            
            [unsortedArray exchangeObjectAtIndex:j withObjectAtIndex:(j-1)];
            j--;
        }
    }
    return unsortedArray;
}

+(BOOL)comparisonValue1:(NSUInteger)value1 value2:(NSUInteger)value2 ascending:(BOOL)ascending {
    
    if (ascending && (value1 > value2)) return YES;
    else if (!ascending && (value1 < value2)) return YES;
    else return NO;
}

@end
