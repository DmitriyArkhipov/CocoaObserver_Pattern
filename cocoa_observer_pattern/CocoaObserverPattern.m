//
//  CocoaObserverPattern.m
//  cocoa_observer_pattern
//
//  Created by Dmitriy Arkhipov on 12.08.16.
//  Copyright © 2016 Dmitriy Arkhipov. All rights reserved.
//


#import "CocoaObserverPattern.h"

@implementation StockInfo

@end



@implementation Stock

- (instancetype) init {
    
    self = [super init];
    
    if (self)
    {
        _sInfo = [[StockInfo alloc] init];
    }
    
    return self;
    
}

- (void) notifyObservers {
    
    NSNotification *updateNotify = [NSNotification notificationWithName:kStockNotifyUpdateData object:self];
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    
    [notificationCenter postNotification:updateNotify];
    
}


- (void) margetGeneration {
    
    _sInfo.USD = [RandomGenerator getRandomNumberBetween:20 to:40];
    _sInfo.euro = [RandomGenerator getRandomNumberBetween:30 to:50];
    [self notifyObservers];
    
}

@end

@implementation Broker

- (instancetype) initWithName:(NSString *)name AndObservervable:(id)obs {
    
    self = [super init];
    
    if (self)
    {
        _name = name;
        _stock = obs;
        [self addUpdateObserver];
    }
    
    return self;
    
}


- (void) addUpdateObserver {

    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    
    [notificationCenter addObserver:self selector:@selector(updateObject:) name:kStockNotifyUpdateData object:nil];

}



- (void) updateObject:(NSNotification *)notifiObject {
    
    if ([notifiObject.object isKindOfClass:[Stock class]]){
        
        Stock *stock = notifiObject.object;
    
        StockInfo *sInfo = stock.sInfo;
        
        if (sInfo.USD > 30) {
            
            NSLog(@"Broker: Брокер %@ продает доллары; Курс доллара: %i ;", _name, sInfo.USD);
            
        } else {
            
            NSLog(@"Broker: Брокер %@ продает доллары; Курс доллара: %i ;", _name, sInfo.USD);
            
        }
    }
    
}


- (void) stopTrade {
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    
    [notificationCenter removeObserver:self];
    
}

@end


@implementation Bank

- (instancetype) initWithName:(NSString *)name AndObservervable:(id)obs {
    
    self = [super init];
    
    if (self)
    {
        _name = name;
        _stock = obs;
        [self addUpdateObserver];
    }
    
    return self;
    
}

- (void) addUpdateObserver {
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    
    [notificationCenter addObserver:self selector:@selector(updateObject:) name:kStockNotifyUpdateData object:nil];
    
}

- (void) updateObject:(NSNotification *)notifiObject {
    
    if ([notifiObject.object isKindOfClass:[Stock class]]){
        
        Stock *stock = notifiObject.object;
        
        StockInfo *sInfo = stock.sInfo;
        
        if (sInfo.USD > 40) {
            
            NSLog(@"Bank: Банк %@ продает доллары; Курс доллара: %i ;", _name, sInfo.USD);
            
        } else {
            
            NSLog(@"Bank: Банк %@ продает доллары; Курс доллара: %i ;", _name, sInfo.USD);
            
        }
    }
    
}

@end