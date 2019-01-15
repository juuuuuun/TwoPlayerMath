//
//  Player.h
//  TwoPlayerMath
//
//  Created by Jun Oh on 2019-01-14.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Player : NSObject

@property (nonatomic) NSString* name;
@property (nonatomic) NSInteger score;

- (instancetype) initWithName:(NSString *)name
                     andScore:(NSInteger)startingScore;

@end

NS_ASSUME_NONNULL_END
