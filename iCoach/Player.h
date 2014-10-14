//
//  Player.h
//  iCoach
//
//  Created by Amog Kamsetty on 10/13/14.
//  Copyright (c) 2014 Amog Kamsetty. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSNumber *number;
@property(nonatomic, strong) NSString *position;
@property(nonatomic, strong) NSNumber *ppg;
@property(nonatomic, strong) NSNumber *rpg;
@property(nonatomic, strong) NSNumber *apg;
@property(nonatomic, strong) NSNumber *spg;
@property(nonatomic, strong) NSNumber *bpg;

-(id)initWithName: (NSString *)name number:(int)number position:(NSString *)position;


@end
