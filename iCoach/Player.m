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
        _name = name;
        _number = [NSNumber numberWithInt:number];
        _position = position;
        _ppg = [NSNumber numberWithDouble:0.0];
        _rpg = [NSNumber numberWithDouble:0.0];
        _apg = [NSNumber numberWithDouble:0.0];
        _spg = [NSNumber numberWithDouble:0.0];
        _bpg = [NSNumber numberWithDouble:0.0];
    }
    return self;
}


-(void)setNotes:(NSAttributedString *)notes
{
    _notes = notes;
}

@end
