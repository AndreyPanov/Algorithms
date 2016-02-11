//
//  MergeSort.m
//  AlgorithmClubObjectiveC
//
//  Created by Панов Андрей on 11.02.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

#import "MergeSort.h"

@implementation MergeSort

+ (NSArray *)mergeSort:(NSArray *)array {
    
    if (array.count <= 1) return array;
    
    NSUInteger middleIndex = array.count / 2;
    NSArray *leftArray = [MergeSort mergeSort:[array subarrayWithRange:NSMakeRange(0, middleIndex)]];
    NSArray *rightArray = [MergeSort mergeSort:[array subarrayWithRange:NSMakeRange(middleIndex, array.count)]];
    
    return [MergeSort mergeWithLeftPile:leftArray rightPile:rightArray];
}

+ (NSArray *)mergeWithLeftPile:(NSArray *)leftPile rightPile:(NSArray *)rightPile {
    
    NSUInteger leftIndex = 0;
    NSUInteger rightIndex = 0;
    NSMutableArray *orderedArray = [[NSMutableArray alloc] initWithCapacity:leftPile.count + rightPile.count];
    
    while (leftIndex < leftPile.count && rightIndex < rightPile.count) {
        
        
    }
}

@end
