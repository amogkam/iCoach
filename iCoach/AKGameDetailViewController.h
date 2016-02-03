//
//  AKGameDetailViewController.h
//  iCoach
//
//  Created by Amog Kamsetty on 11/16/14.
//  Copyright (c) 2014 Amog Kamsetty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"

@class Player;

@protocol AKGameDetailViewControllerDelegate <NSObject>

-(void)statsChanged:(Player *)player atStat:(int) section inGame:(Game *)game;

@end

@interface AKGameDetailViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) UIImageView *imageView;
@property(nonatomic,strong) UIButton *pg;
@property(nonatomic,strong) UIButton *sg;
@property(nonatomic,strong) UIButton *sf;
@property(nonatomic,strong) UIButton *pf;
@property(nonatomic,strong) UIButton *c;
@property (nonatomic,strong) Player *selectedPlayer;
@property (nonatomic,strong) UITableView *statsView;
@property (nonatomic, weak) id<AKGameDetailViewControllerDelegate> delegate;

-(void) updateGame:(Game *)game;

@end
