//
//  AKPlayerDetailViewController.h
//  iCoach
//
//  Created by Amog Kamsetty on 10/13/14.
//  Copyright (c) 2014 Amog Kamsetty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"

@interface AKPlayerDetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextViewDelegate> {}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UILabel *myLabel;
@property (nonatomic, strong) UILabel *positionLabel;
@property (nonatomic, strong) UILabel *numberLabel;
@property (nonatomic) BOOL isPop;

-(void)updatePlayer: (Player *)player;
-(void)setPop:(BOOL)pop;

@end
