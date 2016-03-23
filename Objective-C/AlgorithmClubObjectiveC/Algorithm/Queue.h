//
//  Queue.h
//  AlgorithmClubObjectiveC
//
//  Created by Панов Андрей on 07.02.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Queue : NSObject

@property (nonatomic, readonly) NSUInteger count;

- (instancetype)initWithObjects:(NSArray *)objects;
- (BOOL)isEmpty;

- (id)peek;
- (void)enqueue:(id)object;
-(id)dequeue;

@end
