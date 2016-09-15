//
//  RandomGenerator.m
//  observer_pattern
//
//  Created by Dmitriy Arkhipov on 11.08.16.
//  Copyright © 2016 Dmitriy Arkhipov. All rights reserved.
//


#import "RandomGenerator.h"

@implementation RandomGenerator

+ (int) getRandomNumberBetween:(int)from to:(int)to {
    
    return (int)from + arc4random() % (to-from+1);
}

@end