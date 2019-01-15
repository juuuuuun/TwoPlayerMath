//
//  Player.m
//  TwoPlayerMath
//
//  Created by Jun Oh on 2019-01-14.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)initWithName:(NSString *)name andScore:(NSInteger)startingScore {
    self = [super init];
    if(self != nil) {
        _name = name;
        _score = startingScore;
    }
    return self;

}

@end
