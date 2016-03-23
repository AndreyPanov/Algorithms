//
//  Stack.m
//  AlgorithmClubObjectiveC
//
//  Created by Панов Андрей on 07.02.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

#import "Stack.h"

@interface Stack()

@property (nonatomic, readwrite) NSUInteger count;
@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation Stack


- (instancetype)initWithObjects:(NSArray *)objects {
    
    self = [super init];
    if (self) {
        
        self.array = [[NSMutableArray alloc] initWithArray:objects];
    }
    return self;
}

- (id)pop {
    if ([self isEmpty]) return nil;
    
    id object = [self.array.lastObject copy];
    [self.array removeLastObject];
    return object;
}

- (void)push:(id)object {
    [self.array addObject:object];
}

- (id)peek {
    
    return self.array.lastObject;
}

- (BOOL)isEmpty {
    
    return self.array.count == 0;
}

- (NSUInteger)count {
    
    return self.array.count;
}


@end
