//
//  AKGameDetailViewController.h
//  iCoach
//
//  Created by Amog Kamsetty on 11/16/14.
//  Copyright (c) 2014 Amog Kamsetty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"

@interface AKGameDetailViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) UITableView *tableView;
-(void) updateGame:(Game *)game;

@end
