//
//  Stack.h
//  AlgorithmClubObjectiveC
//
//  Created by Панов Андрей on 07.02.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject

@property(nonatomic, readonly) NSUInteger count;

- (instancetype)initWithObjects:(NSArray *)objects;
- (BOOL)isEmpty;
- (id)pop;
- (void)push:(id)object;
- (id)peek;

@end
