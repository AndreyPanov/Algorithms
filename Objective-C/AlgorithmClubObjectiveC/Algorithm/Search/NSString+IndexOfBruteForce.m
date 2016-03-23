//
//  NSString+IndexOfBruteForce.m
//  AlgorithmClubObjectiveC
//
//  Created by Панов Андрей on 18.02.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

#import "NSString+IndexOfBruteForce.h"

@implementation NSString (IndexOfBruteForce)

- (NSIndexPath *)indexOf:(NSString *)pattern {
    
    for (unsigned i = 0; i < self.length; i++) {
        
        NSUInteger j = i;
        BOOL found = YES;
        
        for (unsigned p = 0; p < pattern.length; p++) {
            
            if (j == self.length-1 || [self characterAtIndex:j] != [pattern characterAtIndex:p]) {
                
                found = NO;
                break;
            }
            else j++;
        }
        if (found)
            return [NSIndexPath indexPathWithIndex:i];
    }
    return nil;
}

@end
