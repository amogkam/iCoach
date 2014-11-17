//
//  Game.h
//  iCoach
//
//  Created by Amog Kamsetty on 11/16/14.
//  Copyright (c) 2014 Amog Kamsetty. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Game : NSObject

@property(nonatomic,strong) NSArray *gamePlayers;
@property(nonatomic,strong) NSMutableArray *starters;
@property(nonatomic,strong) NSMutableArray *bench;
@property(nonatomic,strong) NSString *name;

-(id)initWithPlayers:(NSArray *)players name:(NSString *)name;

@end
