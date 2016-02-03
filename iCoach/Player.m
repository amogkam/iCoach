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

-(id)initWithFirstName: (NSString *)firstname lastName: (NSString *)lastname number:(int)number position:(NSArray *)position starter:(BOOL)starter
{
    self = [super init];
    if (self) {
        _firstname = firstname;
        _lastname = lastname;
        _number = [NSNumber numberWithInt:number];
        _position = position;
        _ppg = [NSNumber numberWithDouble:0.0];
        _rpg = [NSNumber numberWithDouble:0.0];
        _apg = [NSNumber numberWithDouble:0.0];
        _spg = [NSNumber numberWithDouble:0.0];
        _bpg = [NSNumber numberWithDouble:0.0];
        _starter = starter;
    }
    return self;
}

-(void) setFirstName:(NSString *)firstname lastName:(NSString *)lastname
{
    _firstname = firstname;
    _lastname = lastname;
}


-(void)setNotes:(NSAttributedString *)notes
{
    _notes = notes;
}

- (NSString *)fullName
{
    return [NSString stringWithFormat:@"%@ %@", self.firstname, self.lastname];
}

-(void) setNumber:(NSString *)number
{
    _number = [NSNumber numberWithInt:[number intValue]];
}

-(void) setStarter:(BOOL)starter
{
    _starter = starter;
}

-(void) setPosition:(NSArray *)position
{
    _position = position;
}

-(void) incrementGM
{
    NSNumber *num = [NSNumber numberWithInt:([self.gamesPlayed intValue] + 1)];
    _gamesPlayed = num;
}

-(void) setPpg:(NSNumber *)ppg
{
    _ppg = ppg;
}

-(void) setRpg:(NSNumber *)rpg
{
   _rpg = rpg;
}

-(void) setApg:(NSNumber *)apg
{
    _apg = apg;
}

-(void) setSpg:(NSNumber *)spg
{
    _spg = spg;
}

-(void) setBpg:(NSNumber *)bpg
{
    _bpg = bpg;
}

@end
