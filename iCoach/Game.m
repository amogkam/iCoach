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
    [self setPositions];
    
    NSMutableDictionary *temp = [[NSMutableDictionary alloc] init];
    NSArray *values = @[@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0];
    for(Player *p in self.gamePlayers)
    {
        [temp setObject:values forKey:p.number];
    }
    self.playerGameStats = [NSDictionary dictionaryWithDictionary:temp];
//    NSLog(@"%@",self.pg.fullName);
//    NSLog(@"%@",self.sg.fullName);
//    NSLog(@"%@",self.sf.fullName);
//    NSLog(@"%@",self.pf.fullName);
//    NSLog(@"%@",self.c.fullName);
    return self;
}
-(void) setPositions
{
    NSMutableArray *noPos = [[NSMutableArray alloc] init];
    for (int i=0; i<self.starters.count; i++)
    {
        Player *p = [self.starters objectAtIndex:i];
        if([p.position containsObject:@"PG"] && self.pg==nil)
        {
            self.pg = p;
        }
        else if([p.position containsObject:@"SG"] && self.sg==nil)
        {
            self.sg = p;
        }
        else if([p.position containsObject:@"SF"] && self.sf==nil)
        {
            self.sf = p;
        }
        else if([p.position containsObject:@"PF"] && self.pf==nil)
        {
            self.pf = p;
        }
        else if([p.position containsObject:@"C"] && self.c==nil)
        {
            self.c = p;
        }
        else
        {
            [noPos addObject:p];
        }
    }
    for(Player *p in noPos)
    {
        if(self.pg==nil)self.pg=p;
        else if(self.sg==nil)self.sg=p;
        else if(self.sf==nil)self.sf=p;
        else if(self.pf==nil)self.pf=p;
        else if(self.c==nil)self.c=p;
    }
}

@end
