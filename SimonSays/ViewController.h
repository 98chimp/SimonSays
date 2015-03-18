//
//  ViewController.h
//  SimonSays
//
//  Created by Shahin on 2015-03-17.
//  Copyright (c) 2015 98% Chimp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SimonSays.h"

@interface ViewController : UIViewController <SimonSaysDelegate>

@property (strong, nonatomic) SimonSays *gameModel;

@property (assign, nonatomic) float startAlpha;
@property (assign, nonatomic) float endAlpha;
@property (assign, nonatomic) float animationDuration;
@property (assign, nonatomic) bool animationEnded;

@property (strong, nonatomic) IBOutlet UIButton *redButton;
@property (strong, nonatomic) IBOutlet UIButton *greenButton;
@property (strong, nonatomic) IBOutlet UIButton *blueButton;
@property (strong, nonatomic) IBOutlet UIButton *orangeButton;
@property (strong, nonatomic) IBOutlet UIButton *startButton;
@property (strong, nonatomic) IBOutlet UIButton *resetButton;

- (IBAction)playerRed:(UIButton *)sender;
- (IBAction)playerGreen:(UIButton *)sender;
- (IBAction)playerBlue:(UIButton *)sender;
- (IBAction)playerOrange:(UIButton *)sender;
- (IBAction)startGame:(UIButton *)sender;
- (IBAction)resetGame:(UIButton *)sender;

-(void)animateRedButton;
-(void)animateGreenButton;
-(void)animateBlueButton;
-(void)animateOrangeButton;

@end

