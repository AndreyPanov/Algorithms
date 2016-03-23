//
//  Queue.m
//  AlgorithmClubObjectiveC
//
//  Created by Панов Андрей on 07.02.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

#import "Queue.h"

@interface Queue()

@property (nonatomic, readwrite) NSUInteger count;
@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation Queue

- (instancetype)initWithObjects:(NSArray *)objects {
    
    self = [super init];
    if (self) {
        self.array = [[NSMutableArray alloc] initWithArray:objects];
    }
    return self;
}

- (BOOL)isEmpty {
    
    return self.array.count == 0;
}

- (NSUInteger)count {
    
    return self.array.count;
}

- (id)peek {
    
    return self.array.firstObject;
}

- (void)enqueue:(id)object {
    
    [self.array addObject:object];
}

-(id)dequeue {
    
    if ([self isEmpty]) return nil;
    
    id object = [self.array.firstObject copy];
    [self.array removeObject:self.array.firstObject];
    return object;
}

@end
