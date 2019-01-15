//
//  ViewController.m
//  TwoPlayerMath
//
//  Created by Jun Oh on 2019-01-14.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import "ViewController.h"
#import "MathQuestion.h"
#import "GameManager.h"
#import "Player.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

@property (weak, nonatomic) IBOutlet UILabel *playerOneScore;
@property (weak, nonatomic) IBOutlet UILabel *playerTwoScore;
@property (nonatomic, strong) NSMutableArray<UILabel *>* playerScores;
@property (weak, nonatomic) IBOutlet UILabel *correctLabel;

@property (nonatomic, strong) NSMutableString* userInput;

@property (nonatomic, strong) GameManager* gameManager;

@end

@implementation ViewController
- (IBAction)pressedNumber:(UIButton *)sender {
    [self.userInput appendString:sender.titleLabel.text];
    self.answerLabel.text = self.userInput;
}
//- (IBAction)pressedOne:(UIButton *)sender {
//    [self.userInput appendString:@"1"];
//    self.answerLabel.text = self.userInput;
//}
//- (IBAction)pressedTwo:(UIButton *)sender {
//    [self.userInput appendString:@"2"];
//    self.answerLabel.text = self.userInput;
//}
//- (IBAction)pressedThree:(UIButton *)sender {
//    [self.userInput appendString:@"3"];
//    self.answerLabel.text = self.userInput;
//}
//- (IBAction)pressedFour:(UIButton *)sender {
//    [self.userInput appendString:@"4"];
//    self.answerLabel.text = self.userInput;
//}
//- (IBAction)pressedFive:(UIButton *)sender {
//    [self.userInput appendString:@"5"];
//    self.answerLabel.text = self.userInput;
//}
//- (IBAction)pressedSix:(UIButton *)sender {
//    [self.userInput appendString:@"6"];
//    self.answerLabel.text = self.userInput;
//}
//- (IBAction)pressedSeven:(UIButton *)sender {
//    [self.userInput appendString:@"7"];
//    self.answerLabel.text = self.userInput;
//}
//- (IBAction)pressedEight:(UIButton *)sender {
//    [self.userInput appendString:@"8"];
//    self.answerLabel.text = self.userInput;
//}
//- (IBAction)pressedNine:(UIButton *)sender {
//    [self.userInput appendString:@"9"];
//    self.answerLabel.text = self.userInput;
//}
- (IBAction)pressedEnter:(UIButton *)sender {
    if([self.gameManager answer: self.userInput.integerValue]) {
        self.correctLabel.text = @"Correct!";
        self.correctLabel.textColor = UIColor.greenColor;
        self.correctLabel.alpha = 1.0;
    } else {
        self.correctLabel.text = @"Incorrect!";
        self.correctLabel.textColor = UIColor.redColor;
        self.correctLabel.alpha = 1.0;
    }
    
    [UIView animateWithDuration:1 animations:^{self.correctLabel.alpha = 0.0;}];
    
   
    self.playerOneScore.text = [self.gameManager reportScore:0];
    self.playerTwoScore.text = [self.gameManager reportScore:1];
    
    if(self.gameManager.gameOver) {
        
        UIAlertController* gameOverAlert = [UIAlertController alertControllerWithTitle:@"Game Over!" message:@"Would you like to play again?" preferredStyle:UIAlertControllerStyleAlert];
        
        [gameOverAlert addAction:[UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){
            [self initializeView];
        }]];
        [self presentViewController:gameOverAlert animated:YES completion:nil];
        
    } else {
    
        self.questionLabel.text = [NSString stringWithFormat:@"%@: %@", [self.gameManager currentPlayerName], [self.gameManager nextQuestion]];
        self.userInput = [@"" mutableCopy];
        self.answerLabel.text = self.userInput;
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initializeView];
}

- (void) initializeView {
    self.gameManager = [[GameManager alloc] init];
    self.userInput = [[NSMutableString alloc] init];
    
    self.questionLabel.text = [NSString stringWithFormat:@"%@: %@", [self.gameManager currentPlayerName], [self.gameManager nextQuestion]];
    self.answerLabel.text = self.userInput;
    
    self.playerOneScore.text = [self.gameManager reportScore:0];
    self.playerTwoScore.text = [self.gameManager reportScore:1];
    self.correctLabel.text = @"";
    
}


@end
