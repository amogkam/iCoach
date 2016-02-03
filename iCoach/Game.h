//
//  Game.h
//  iCoach
//
//  Created by Amog Kamsetty on 11/16/14.
//  Copyright (c) 2014 Amog Kamsetty. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Player;

@interface Game : NSObject

@property(nonatomic,strong) NSArray *gamePlayers;
@property(nonatomic,strong) NSMutableArray *starters;
@property(nonatomic,strong) NSMutableArray *bench;
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) Player *pg;
@property(nonatomic,strong) Player *sg;
@property(nonatomic,strong) Player *sf;
@property(nonatomic,strong) Player *pf;
@property(nonatomic,strong) Player *c;
@property (nonatomic,strong) NSDictionary *playerGameStats;

-(id)initWithPlayers:(NSArray *)players name:(NSString *)name;
-(void) setPositions;

@end
