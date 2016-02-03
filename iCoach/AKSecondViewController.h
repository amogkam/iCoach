//
//  AKSecondViewController.h
//  iCoach
//
//  Created by Amog Kamsetty on 9/5/14.
//  Copyright (c) 2014 Amog Kamsetty. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Game;

@protocol AKSecondViewControllerDelegate <NSObject>

-(void)selectedGame:(Game *)game;
-(void)addGame;

@end

@interface AKSecondViewController : UITableViewController

@property(nonatomic,strong) NSArray *games;
@property (nonatomic, weak) id<AKSecondViewControllerDelegate> delegate;

-(void)updateGames:(NSArray *)games;
@end
