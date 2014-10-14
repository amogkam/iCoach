//
//  Player.m
//  iCoach
//
//  Created by Amog Kamsetty on 10/13/14.
//  Copyright (c) 2014 Amog Kamsetty. All rights reserved.
//

#import "Player.h"

@interface Player()



@end

@implementation Player

-(id)initWithName: (NSString *)name number:(int)number position:(NSString *)position
{
    self = [super init];
    if (self) {
        self.name = name;
        self.number = [NSNumber numberWithInt:number];
        self.position = position;
        self.ppg = [NSNumber numberWithDouble:0.0];
        self.rpg = [NSNumber numberWithDouble:0.0];
        self.apg = [NSNumber numberWithDouble:0.0];
        self.spg = [NSNumber numberWithDouble:0.0];
        self.bpg = [NSNumber numberWithDouble:0.0];
    }
    return self;
}

@end
