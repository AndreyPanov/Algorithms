//
//  BoggleGame.m
//  AlgorithmClubObjectiveC
//
//  Created by Панов Андрей on 16.03.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

#import "BoggleGame.h"
#import "Array2D.h"

@interface BoggleGame()

@property (nonatomic, strong) NSString *wordFind;
@property (nonatomic) CGSize deskSize;
@property (nonatomic) Array2D *desk;
@property (nonatomic, strong) NSString *alphabet;
@end

@implementation BoggleGame

- (instancetype)initWithWord:(NSString *)word size:(CGSize)size {
    
    self = [super init];
    if (self) {
        
        _deskSize = size;
        _desk = [[Array2D alloc] initWithSize:size];
        _wordFind = word;
        _alphabet = @"abcdefghijklmnopqrstuvwxyz";
        [self configuteDesk];
    }
    return self;
}

- (void)start {
    
    
}

- (void)configuteDesk {
    
    for (unsigned x = 0; x < _deskSize.height; x++) {
        for (unsigned y = 0; y < _deskSize.height; y++) {
            unichar element = [_alphabet characterAtIndex: arc4random_uniform((unsigned int)_alphabet.length)];
            [_desk addElement: [NSString stringWithFormat:@"%c", element] x:x y:y];
            NSLog(@"%c", element);
        }
    }
}

- (void)findWord:(char)word countX:(NSInteger)x countY:(NSInteger)y {
    
    
}

@end
