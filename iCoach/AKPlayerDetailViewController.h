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

-(void)updatePlayer: (Player *)player;

@end
