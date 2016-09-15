//
//  ViewController.m
//  cocoa_observer_pattern
//
//  Created by Dmitriy Arkhipov on 12.08.16.
//  Copyright © 2016 Dmitriy Arkhipov. All rights reserved.
//

#import "ViewController.h"

#import "CocoaObserverPattern.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Stock *stock = [[Stock alloc] init];
    
    Bank *bank = [[Bank alloc] initWithName:@"СБЕРБАНК" AndObservervable:stock];
    Broker *broker = [[Broker alloc] initWithName:@"Петр Петрович" AndObservervable:stock];
    
    //имитация торгов
    [stock margetGeneration];
    
    //брокер прекращает наблюдать за торгами
    [broker stopTrade];
    
    //имитация торгов
    [stock margetGeneration];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
