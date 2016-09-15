//
//  RandomGenerator.h
//  observer_pattern
//
//  Created by Dmitriy Arkhipov on 11.08.16.
//  Copyright © 2016 Dmitriy Arkhipov. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RandomGenerator : NSObject

/**
 Генерация случайных чисел в заданном диапазоне. С использованием arc4random() из библиотеки stdlib.h
 @param from от
 @param to до
 */
+ (int) getRandomNumberBetween:(int)from to:(int)to;

@end