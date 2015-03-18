//
//  SimonSays.m
//  SimonSays
//
//  Created by Shahin on 2015-03-17.
//  Copyright (c) 2015 98% Chimp. All rights reserved.
//

#import "SimonSays.h"

@implementation SimonSays

-(instancetype)initWithColours:(NSArray *)colours simonSays:(NSMutableArray *)simonSays playerDoes:(NSMutableArray *)playerDoes isRunning:(bool)isRunning{
    self = [super init];
    
    if (self) {
        self.colors = @[@"R", @"G", @"B", @"O"];
        self.simonSays = [NSMutableArray new];
        self.playerDoes = [NSMutableArray new];
        self.isRunning = YES;
    }
    return self;
}

-(NSMutableArray *)addRandomColorToSimonSays {
    NSInteger randomNumber = arc4random() % self.colors.count;
    NSString *color = self.colors[randomNumber];
    [self.simonSays addObject:color];
    NSLog(@"%@", self.simonSays);
    return self.simonSays;
}

#pragma mark - Inputs

-(void)startGame {
    [self initWithColours:self.colors simonSays:self.simonSays playerDoes:self.playerDoes isRunning:YES];
    [self addRandomColorToSimonSays];
    [self.delegate animateSequence:self.simonSays];
}

-(void)inputColor:(NSString *)colorString {
    while (self.isRunning) {
        if ([self.simonSays[self.playerDoes.count] isEqualToString:colorString]) {
            [self.playerDoes addObject:colorString];
            if (self.simonSays.count == self.playerDoes.count) {
                [self.delegate animateWin];
                [self.playerDoes removeAllObjects];
            }
        }
        else {
            self.isRunning = NO;
            [self.delegate animateLose];
        }
    }
}

-(void)resetGame {
    self.isRunning = YES;
    [self startGame];
}

@end

