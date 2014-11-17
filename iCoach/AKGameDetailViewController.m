//
//  AKGameDetailViewController.m
//  iCoach
//
//  Created by Amog Kamsetty on 11/16/14.
//  Copyright (c) 2014 Amog Kamsetty. All rights reserved.
//

#import "AKGameDetailViewController.h"
#import "Game.h"
#import "Player.h"

@interface AKGameDetailViewController ()

@property(nonatomic,strong) Game *game;

@end

@implementation AKGameDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(66, 279, 249, 236)];
    self.tableView.bounds = self.tableView.frame;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void) updateGame:(Game *)game
{
    self.game = game;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.game.bench count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Bench";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
    }
    
    Player *cellValue = [self.game.bench objectAtIndex:indexPath.row];
    NSString *text = [[[cellValue fullName] stringByAppendingString:@", "]stringByAppendingString:[cellValue.number stringValue]];
    cell.textLabel.text = text;
    
    return cell;
}

@end
