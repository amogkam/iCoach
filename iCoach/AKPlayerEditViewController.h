//
//  AKPlayerEditViewController.h
//  iCoach
//
//  Created by Amog Kamsetty on 11/7/14.
//  Copyright (c) 2014 Amog Kamsetty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"
@protocol AKPlayerEditViewControllerDelegate <NSObject>

- (void)finishedEdit:(Player *)player;

@end
@interface AKPlayerEditViewController : UIViewController <UITextFieldDelegate, UIPickerViewDelegate, UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) Player *player;
@property(nonatomic, strong) UITextField *textField1;
@property(nonatomic, strong) UITextField *textField2;
@property(nonatomic, strong) UIPickerView *numberPicker;
@property(nonatomic, strong) UITextField *number;
@property(nonatomic, strong) UITableView *positionView;
@property(nonatomic, strong) UISwitch *starter;
@property(nonatomic, strong) UILabel *starterLabel;
@property (nonatomic, weak) id<AKPlayerEditViewControllerDelegate> delegate;

-(void)updatePlayer: (Player *)player;

@end
