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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self runStack];
    [self runQueue];
    [self runInsertionSort];
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

@end