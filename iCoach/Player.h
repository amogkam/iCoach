//
//  Player.h
//  iCoach
//
//  Created by Amog Kamsetty on 10/13/14.
//  Copyright (c) 2014 Amog Kamsetty. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property(nonatomic, strong, readonly) NSString *name;
@property(nonatomic, strong, readonly) NSNumber *number;
@property(nonatomic, strong, readonly) NSString *position;
@property(nonatomic, strong, readonly) NSNumber *ppg;
@property(nonatomic, strong, readonly) NSNumber *rpg;
@property(nonatomic, strong, readonly) NSNumber *apg;
@property(nonatomic, strong, readonly) NSNumber *spg;
@property(nonatomic, strong, readonly) NSNumber *bpg;
@property(nonatomic, strong, readonly) NSAttributedString *notes;

-(id)initWithName: (NSString *)name number:(int)number position:(NSString *)position;
-(NSAttributedString *)notes;
-(void)setNotes:(NSAttributedString *)notes;


@end
