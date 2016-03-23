//
//  BoggleGame.h
//  AlgorithmClubObjectiveC
//
//  Created by Панов Андрей on 16.03.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface BoggleGame : NSObject

- (instancetype)initWithWord:(NSString *)word size:(CGSize)size;

@end
