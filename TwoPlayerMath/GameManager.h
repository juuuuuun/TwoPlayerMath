//
//  GameManager.h
//  TwoPlayerMath
//
//  Created by Jun Oh on 2019-01-14.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Player;

NS_ASSUME_NONNULL_BEGIN

@interface GameManager : NSObject

@property (nonatomic, strong, readonly) NSArray<Player *>* players;
@property (nonatomic) NSInteger currentPlayerIndex;
@property (nonatomic) BOOL gameOver;


-(BOOL) answer:(NSInteger)answerInput;
-(NSString *) nextQuestion;
-(NSString *) reportScore:(NSUInteger)playerIndex;
-(NSString *) currentPlayerName;

@end

NS_ASSUME_NONNULL_END
