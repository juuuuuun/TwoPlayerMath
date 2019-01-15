//
//  MathQuestion.m
//  TwoPlayerMath
//
//  Created by Jun Oh on 2019-01-14.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import "MathQuestion.h"

@implementation MathQuestion


- (instancetype)init
{
    self = [super init];
    if (self) {
        int questionType = arc4random_uniform(3) + 1;
        
        int firstNumber = arc4random_uniform(20) + 1;
        int secondNumber = arc4random_uniform(20) + 1;
        
        switch(questionType) {
            case 1:
                _question = [NSString stringWithFormat:@"%i + %i?", firstNumber, secondNumber];
                _answer = firstNumber + secondNumber;
                break;
            case 2:
                if(firstNumber > secondNumber) {
                    _question = [NSString stringWithFormat:@"%i - %i?", firstNumber, secondNumber];
                    _answer = firstNumber - secondNumber;
                } else {
                    _question = [NSString stringWithFormat:@"%i - %i?", secondNumber, firstNumber];
                    _answer = secondNumber - firstNumber;
                }
                break;
            case 3:
                _question = [NSString stringWithFormat:@"%i * %i?", firstNumber, secondNumber];
                _answer = firstNumber * secondNumber;
                break;
        }
        
    }
    return self;
}

@end
