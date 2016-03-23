//
//  BinarySearch.h
//  AlgorithmClubObjectiveC
//
//  Created by Панов Андрей on 10.02.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BinarySearch : NSObject

+ (NSUInteger)getIndexWithSortedArray:(NSArray *)array element:(NSUInteger)element range:(NSRange)range;
+ (NSUInteger)getIndexWithSortedArray:(NSArray *)array element:(NSUInteger)element;

@end
