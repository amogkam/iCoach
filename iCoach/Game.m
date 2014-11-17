//
//  Game.m
//  iCoach
//
//  Created by Amog Kamsetty on 11/16/14.
//  Copyright (c) 2014 Amog Kamsetty. All rights reserved.
//

#import "Game.h"
#import "Player.h"

@implementation Game

-(id)initWithPlayers:(NSArray *)players name:(NSString *)name
{
    self.gamePlayers= [NSArray arrayWithArray:players];
    self.starters = [[NSMutableArray alloc] init];
    self.bench = [[NSMutableArray alloc] init];
    for (Player *p in self.gamePlayers) {
        if (p.starter == YES) {
            [self.starters addObject:p];
        }
        else
        {
            [self.bench addObject:p];
        }
    }
    self.name = name;
    return self;
}

@end
