//
//  ViewController.m
//  SimonSays
//
//  Created by Shahin on 2015-03-17.
//  Copyright (c) 2015 98% Chimp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.gameModel = [[SimonSays alloc] initWithColours:@[@"R", @"G", @"B", @"O"]];
    self.gameModel.delegate = self;
    self.resetButton.hidden = YES;
    self.animationEnded = NO;
    self.startAlpha = 0.5;
    self.endAlpha = 1.0;
    self.animationDuration = 0.2;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)animateRedButton {
    [UIView animateWithDuration:self.animationDuration animations:^{self.redButton.alpha = self.endAlpha;} completion:^(BOOL finished) {
        self.redButton.alpha = self.startAlpha;
    }];
}

-(void)animateGreenButton {
    [UIView animateWithDuration:self.animationDuration animations:^{self.greenButton.alpha = self.endAlpha;} completion:^(BOOL finished) {
        self.greenButton.alpha = self.startAlpha;
    }];
}

-(void)animateBlueButton {
    [UIView animateWithDuration:self.animationDuration animations:^{self.blueButton.alpha = self.endAlpha;} completion:^(BOOL finished) {
        self.blueButton.alpha = self.startAlpha;
    }];
}

-(void)animateOrangeButton {
    [UIView animateWithDuration:self.animationDuration animations:^{self.orangeButton.alpha = self.endAlpha;} completion:^(BOOL finished) {
        self.orangeButton.alpha = self.startAlpha;
    }];
}

- (IBAction)playerRed:(UIButton *)sender {
    [self.gameModel inputColor:@"R"];
    [self animateRedButton];
}

- (IBAction)playerGreen:(UIButton *)sender {
    [self.gameModel inputColor:@"G"];
    [self animateGreenButton];
}

- (IBAction)playerBlue:(UIButton *)sender {
    [self.gameModel inputColor:@"B"];
    [self animateBlueButton];
}

- (IBAction)playerOrange:(UIButton *)sender {
    [self.gameModel inputColor:@"O"];
    [self animateOrangeButton];
}

- (IBAction)startGame:(UIButton *)sender {
    [self.gameModel startGame];
    self.resetButton.hidden = YES;
    self.startButton.hidden = YES;
}

- (IBAction)resetGame:(UIButton *)sender {
    [self.gameModel resetGame];
    self.resetButton.hidden = YES;
}

-(void)animateSequence:(NSMutableArray *)colorSequence {
    for (int counter = 0; counter < self.gameModel.simonSays.count; counter++) {
        if ([self.gameModel.simonSays[counter] isEqualToString:@"R"]) {
            [self animateRedButton];
        }
        else if ([self.gameModel.simonSays[counter] isEqualToString:@"G"]) {
            [self animateGreenButton];
        }
        else if ([self.gameModel.simonSays[counter] isEqualToString:@"B"]) {
            [self animateBlueButton];
        }
        else {
            [self animateOrangeButton];
        }
    }
    self.animationEnded = YES;
}

-(void)animateLose {
    for (int i = 0; i < 3; i++) {
        for (int counter = 0; counter < self.gameModel.simonSays.count; counter++) {
            if ([self.gameModel.simonSays[counter] isEqualToString:@"R"]) {
                [self animateRedButton];
            }
            else if ([self.gameModel.simonSays[counter] isEqualToString:@"G"]) {
                [self animateGreenButton];
            }
            else if ([self.gameModel.simonSays[counter] isEqualToString:@"B"]) {
                [self animateBlueButton];
            }
            else {
                [self animateOrangeButton];
            }
        }
    }
    self.resetButton.hidden = false;
    return;
}

-(void)animateArray:(NSArray *)remaining {
    
    if (remaining.count < 1) {
        return;
    }
    
    [UIView animateWithDuration:self.animationDuration delay:5.0 options:0 animations:^{
        
        NSString *colorString = remaining.firstObject;
        
        if ([colorString isEqualToString:@"R"]) {
            [self animateRedButton];
        }
        else if ([colorString isEqualToString:@"G"]) {
            [self animateGreenButton];
        }
        else if ([colorString isEqualToString:@"B"]) {
            [self animateBlueButton];
        }
        else {
            [self animateOrangeButton];
        }
    } completion:^(BOOL finished) {
        
        if (remaining.count > 0) {
            NSMutableArray *newRemaining = [remaining mutableCopy];
            [newRemaining removeObjectAtIndex:0];
            
            [self animateArray:newRemaining];
        }
        
    }];

}

-(void)animateWin {
    
    //_block int counter = 0;
    
    [self animateArray:self.gameModel.simonSays];
    
    

//    return;
}

@end