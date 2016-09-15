//
//  CocoaObserverPattern.h
//  cocoa_observer_pattern
//
//  Created by Dmitriy Arkhipov on 12.08.16.
//  Copyright © 2016 Dmitriy Arkhipov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RandomGenerator.h"
#import "Constants.h"


@interface StockInfo : NSObject

@property (assign, nonatomic) int USD;
@property (assign, nonatomic) int euro;

@end


@interface Stock : NSObject //<IObservable>

/**
 Информация о торгах
 */
@property (strong, nonatomic) StockInfo *sInfo;

- (instancetype) init;

- (void) notifyObservers;

- (void) margetGeneration;

@end



@interface Broker : NSObject //<IObserver>

@property (strong, nonatomic) NSString *name;

@property (strong, nonatomic) id stock;

- (instancetype) initWithName:(NSString *)name AndObservervable:(id)obs;

- (void) updateObject:(NSNotification *)notifiObject;

- (void) stopTrade;

@end



@interface Bank : NSObject //<IObserver>

@property (strong, nonatomic) NSString *name;

@property (strong, nonatomic) id stock;

- (instancetype) initWithName:(NSString *)name AndObservervable:(id)obs;

- (void) updateObject:(NSNotification *)notifiObject;

@end