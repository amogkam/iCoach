//
//  AKPlayerDetailViewController.m
//  iCoach
//
//  Created by Amog Kamsetty on 10/13/14.
//  Copyright (c) 2014 Amog Kamsetty. All rights reserved.
//

#import "AKPlayerDetailViewController.h"
#import "Player.h"

@interface AKPlayerDetailViewController ()



@end

@implementation AKPlayerDetailViewController

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.95];
    UILabel *myLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 50, 200, 40)];
    [myLabel setBackgroundColor:[UIColor clearColor]];
    [myLabel setText:[self.player name]];
    [[self view] addSubview:myLabel];
    
    self.navigationController.navigationBar.backItem.title = @"Players";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:NULL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
