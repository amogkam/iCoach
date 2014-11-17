//
//  AKPlayerDetailViewController.h
//  iCoach
//
//  Created by Amog Kamsetty on 10/13/14.
//  Copyright (c) 2014 Amog Kamsetty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"
@protocol AKPlayerDetailViewControllerDelegate <NSObject>

- (void)editingPlayer:(Player *)player;

@end
@interface AKPlayerDetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextViewDelegate> {}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UILabel *myLabel;
@property (nonatomic, strong) UILabel *positionLabel;
@property (nonatomic, strong) UILabel *numberLabel;
@property (nonatomic, weak) id<AKPlayerDetailViewControllerDelegate> delegate;

-(void)updatePlayer: (Player *)player;

@end
