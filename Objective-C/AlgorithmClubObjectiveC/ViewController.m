//
//  ViewController.m
//  AlgorithmClubObjectiveC
//
//  Created by Панов Андрей on 07.02.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

#import "ViewController.h"

#import "Stack.h"
#import "Queue.h"
#import "InsertionSort.h"
#import "BinarySearch.h"
#import "MergeSort.h"
#import "BoggleGame.h"
#import "NSString+IndexOfBruteForce.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self runStack];
    [self runQueue];
    [self runInsertionSort];
    [self runBinarySearch];
    [self runMergeSort];
    [self runIndexOfBrute];
    [self runBoggleGame];
}

- (void)runStack {
    
    Stack *stack = [[Stack alloc] initWithObjects:@[@"Cat", @"Dog", @"Bear", @"Bird"]];
    NSLog(@"Count %li", (long)stack.count);
    NSLog(@"%@", [stack peek]);
    NSLog(@"Count %li", (long)stack.count);
    NSLog(@"%@", [stack pop]);
    NSLog(@"Count %li", (long)stack.count);
    [stack push:@"Human"];
    NSLog(@"Count %li", (long)stack.count);
    
    NSLog(@"while");
    while (!stack.isEmpty) {
        NSLog(@"%@", [stack pop]);
    }
    NSLog(@"---------------------------------------");
}

- (void)runQueue {
    
    Queue *queue = [[Queue alloc] initWithObjects:@[@"Cat", @"Dog", @"Bear", @"Bird"]];
    NSLog(@"Count %li", (long)queue.count);
    NSLog(@"%@", [queue peek]);
    NSLog(@"%@", [queue dequeue]);
    NSLog(@"Count %li", (long)queue.count);
    [queue enqueue:@"Human"];
    NSLog(@"Count %li", (long)queue.count);
    
    NSLog(@"while");
    while (!queue.isEmpty) {
        NSLog(@"%@", [queue dequeue]);
    }
    NSLog(@"---------------------------------------");
}

- (void)runInsertionSort {
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:4], [NSNumber numberWithInt:5], [NSNumber numberWithInt:7], [NSNumber numberWithInt:4235], nil];
    NSLog(@"Ascending %@", [InsertionSort insertionSort:array ascending:YES]);
    NSLog(@"NOT Ascending %@", [InsertionSort insertionSort:array ascending:NO]);
    NSLog(@"---------------------------------------");
}

- (void)runBinarySearch {
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:4], [NSNumber numberWithInt:5], [NSNumber numberWithInt:7], [NSNumber numberWithInt:4235], nil];
    NSArray *sorted = [NSArray arrayWithArray:[InsertionSort insertionSort:array ascending:YES]];
    NSLog(@"Ascending %@", sorted);
    NSLog(@"Find element 7 with recursion, %lu", (unsigned long)[BinarySearch getIndexWithSortedArray:sorted element:7 range:NSMakeRange(0, sorted.count)]);
    NSLog(@"Find element 7 with while, %lu", (unsigned long)[BinarySearch getIndexWithSortedArray:sorted element:7]);
    NSLog(@"---------------------------------------");
}

- (void)runMergeSort {
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInteger:4], [NSNumber numberWithInteger:5], [NSNumber numberWithInteger:7], [NSNumber numberWithInteger:4235], nil];
    NSLog(@"%@", [MergeSort mergeSort:array]);
    NSLog(@"---------------------------------------");
}

- (void)runIndexOfBrute {
    
    NSString *string = @"Hello world!";
    NSLog(@"runIndexOfBrute %@", [string indexOf:@"world"]);
    NSLog(@"---------------------------------------");
}

- (void)runBoggleGame {
    
    BoggleGame *game = [[BoggleGame alloc] initWithWord:@"the" size:CGSizeMake(50, 50)];
}

@end
