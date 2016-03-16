//
//  Array2D.h
//  AlgorithmClubObjectiveC
//
//  Created by Панов Андрей on 16.03.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface Array2D : NSObject

- (instancetype)initWithSize:(CGSize)size;

- (void)addElement:(id)element x:(NSInteger)x y:(NSInteger)y;
- (id)getElementAtX:(NSInteger)x y:(NSInteger)y;

@end
