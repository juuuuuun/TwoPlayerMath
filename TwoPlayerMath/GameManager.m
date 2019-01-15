//
//  GameManager.m
//  TwoPlayerMath
//
//  Created by Jun Oh on 2019-01-14.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import "GameManager.h"
#import "MathQuestion.h"
#import "Player.h"

@interface GameManager ()

@property (nonatomic, strong) NSMutableArray<Player *>* allPlayers;
@property (nonatomic, strong) MathQuestion* mathQuestion;

@end

@implementation GameManager


- (instancetype)init
{
    self = [super init];
    if (self) {
        _allPlayers = [self createPlayers];
        _mathQuestion = [[MathQuestion alloc] init];
        _currentPlayerIndex = 0;
        _gameOver = NO;
    }
    return self;
}


- (NSMutableArray<Player *>*)createPlayers {
    NSMutableArray<Player *>* players = [NSMutableArray array];
    for(int i = 0; i < 2; i++) {
        Player* player = [[Player alloc] initWithName:[NSString stringWithFormat:@"Player %i", i+1] andScore:3];
        [players addObject:player];
    }
    return players;
}

- (NSString *) reportScore:(NSUInteger)playerIndex {
    NSMutableString* scoreToReport = [NSMutableString stringWithFormat:@"%@: ", [self currentPlayerName]];
    for(int i = 0; i < self.players[playerIndex].score; i++) {
        [scoreToReport appendString:@"❤️"];
    }
    return [scoreToReport copy];
}

- (NSArray<Player *>*)players {
    return [_allPlayers copy];
}

- (BOOL)answer:(NSInteger)answerInput {
    
    if(self.mathQuestion.answer == answerInput) {
        self.currentPlayerIndex++;
        self.currentPlayerIndex = self.currentPlayerIndex % self.players.count;
        return YES;
    } else {
        self.players[self.currentPlayerIndex].score--;
        if(self.players[self.currentPlayerIndex].score == 0) {
            self.gameOver = YES;
        }
        self.currentPlayerIndex++;
        self.currentPlayerIndex = self.currentPlayerIndex % self.players.count;
        return NO;
    }
}

- (NSString *) nextQuestion {
    self.mathQuestion = [[MathQuestion alloc] init];
    return self.mathQuestion.question;
}

-(NSString *)currentPlayerName {
    return self.players[self.currentPlayerIndex].name;
}

@end
