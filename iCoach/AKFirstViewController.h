//
//  AKFirstViewController.h
//  iCoach
//
//  Created by Amog Kamsetty on 9/5/14.
//  Copyright (c) 2014 Amog Kamsetty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AKFirstViewController : UITableViewController <UISearchBarDelegate, UISearchDisplayDelegate>

@property(nonatomic,strong) NSMutableArray *starters;
@property(nonatomic,strong) NSMutableArray *bench;

-(void)updatePlayers:(NSArray *)players;
@end
