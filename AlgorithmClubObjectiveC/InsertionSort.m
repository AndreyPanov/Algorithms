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

+ (NSArray *)insertionSort:(NSMutableArray *)unsortedDataArray ascending:(BOOL)ascending {
    unsigned j;
    for (unsigned i=1; i<unsortedDataArray.count;i++) {
        
        j=i;
        while(j>0 && ([InsertionSort comparisonValue1:[[unsortedDataArray objectAtIndex:(j-1)] intValue] value2:[[unsortedDataArray objectAtIndex:j] intValue] ascending:ascending])) {
            
            [unsortedDataArray exchangeObjectAtIndex:j withObjectAtIndex:(j-1)];
            j--;
        }
    }
    return unsortedDataArray;
}

+(BOOL)comparisonValue1:(NSUInteger)value1 value2:(NSUInteger)value2 ascending:(BOOL)ascending {
    
    if (ascending && (value1 > value2)) return YES;
    else if (!ascending && (value1 < value2)) return YES;
    else return NO;
}

@end
