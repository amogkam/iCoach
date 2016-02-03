//
//  Player.h
//  iCoach
//
//  Created by Amog Kamsetty on 10/13/14.
//  Copyright (c) 2014 Amog Kamsetty. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property(nonatomic, strong, readonly) NSString *firstname;
@property(nonatomic, strong, readonly) NSString *lastname;
@property(nonatomic, strong, readonly) NSNumber *number;
@property(nonatomic, strong, readonly) NSArray *position;
@property(nonatomic, strong, readonly) NSNumber *ppg;
@property(nonatomic, strong, readonly) NSNumber *rpg;
@property(nonatomic, strong, readonly) NSNumber *apg;
@property(nonatomic, strong, readonly) NSNumber *spg;
@property(nonatomic, strong, readonly) NSNumber *bpg;
@property(nonatomic, strong, readonly) NSAttributedString *notes;
@property(nonatomic,readonly) BOOL starter;
@property(nonatomic,strong,readonly) NSNumber *gamesPlayed;


-(id)initWithFirstName: (NSString *)firstname lastName: (NSString *)lastname number:(int)number position:(NSArray *)position starter:(BOOL)starter;
-(NSAttributedString *)notes;
-(void)setNotes:(NSAttributedString *)notes;
-(void) setFirstName:(NSString *)firstname lastName:(NSString *)lastname;
- (NSString *)fullName;
-(void) setNumber:(NSString *)number;
-(void) setStarter:(BOOL)starter;
-(void) setPosition:(NSArray *)position;
-(void) incrementGM;
-(void) setPpg:(NSNumber *)ppg;
-(void) setRpg:(NSNumber *)rpg;
-(void) setApg:(NSNumber *)apg;
-(void) setSpg:(NSNumber *)spg;
-(void) setBpg:(NSNumber *)bpg;


@end
