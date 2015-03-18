//
//  SimonSays.h
//  SimonSays
//
//  Created by Shahin on 2015-03-17.
//  Copyright (c) 2015 98% Chimp. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol SimonSaysDelegate <NSObject>

-(void)animateSequence:(NSMutableArray *)colorSequence;
-(void)animateLose;
-(void)animateWin;

@end


@interface SimonSays : NSObject

@property (weak, nonatomic) id<SimonSaysDelegate> delegate;

@property (strong, nonatomic) NSArray *colors;
@property (strong, nonatomic) NSMutableArray *simonSays;
@property (strong, nonatomic) NSString *playerResponse;
@property (strong, nonatomic) NSMutableArray *playerDoes;
@property (assign, nonatomic) bool isRunning;


-(instancetype)initWithColours:(NSArray *)colors simonSays:(NSMutableArray *)simonSays playerDoes:(NSMutableArray *)playerDoes isRunning:(bool)isRunning;
-(NSMutableArray *)addRandomColorToSimonSays;

// model inputs

-(void)startGame;
-(void)inputColor:(NSString *)colorString;
-(void)resetGame;

@end
