//
//  AKFirstViewController.h
//  iCoach
//
//  Created by Amog Kamsetty on 9/5/14.
//  Copyright (c) 2014 Amog Kamsetty. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Player;

@protocol AKFirstViewControllerDelegate <NSObject>

- (void)selectedPlayer:(Player *)player;
-(void)addPlayer:(Player *)player;

@end

@interface AKFirstViewController : UITableViewController <UISearchBarDelegate, UISearchDisplayDelegate>

@property(nonatomic,strong) NSMutableArray *starters;
@property(nonatomic,strong) NSMutableArray *bench;
@property (nonatomic, strong) NSArray *players;
@property (nonatomic, weak) id<AKFirstViewControllerDelegate> delegate;

-(void)updatePlayers:(NSArray *)players;

@end