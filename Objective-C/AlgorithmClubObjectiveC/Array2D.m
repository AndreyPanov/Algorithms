//
//  Array2D.m
//  AlgorithmClubObjectiveC
//
//  Created by Панов Андрей on 16.03.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

#import "Array2D.h"

@interface Array2D()

@property (nonatomic) CGSize size;
@property (nonatomic, strong) NSMutableArray<NSMutableArray *> *array;

@end

@implementation Array2D

- (instancetype)initWithSize:(CGSize)size {
    
    self = [super init];
    if (self) {
        
        self.size = size;
        [self buildArray];
    }
    return self;
}

- (void)addElement:(id)element x:(NSInteger)x y:(NSInteger)y {
    
    NSMutableArray *row = [_array objectAtIndex:x];
    [row setObject:element atIndexedSubscript:y];
}

- (id)getElementAtX:(NSInteger)x y:(NSInteger)y {
    
    NSMutableArray *row = [_array objectAtIndex:x];
    
    return [row objectAtIndex:y];
}

- (void)buildArray {
    
    _array = [[NSMutableArray alloc] initWithCapacity:_size.height];
    for (unsigned x = 0; x < _size.height; x++) {
        NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:_size.width];
        for (unsigned y = 0; y < _size.height; y++) {
            [arr addObject:NSNull.null];
        }
        [_array addObject:arr];
    }
}

@end
