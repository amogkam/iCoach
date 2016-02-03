//
//  AKSecondViewController.m
//  iCoach
//
//  Created by Amog Kamsetty on 9/5/14.
//  Copyright (c) 2014 Amog Kamsetty. All rights reserved.
//

#import "AKSecondViewController.h"
#import "Game.h"

@interface UISplitViewController ()

@end

@implementation AKSecondViewController: UITableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.games = [[NSArray alloc] init];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add)];
	

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)updateGames:(NSArray *)games
{
    self.games = games;
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.games.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Games";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
    }
    
    Game *cellValue = [self.games objectAtIndex:indexPath.row];
    NSString *text = cellValue.name;
    cell.textLabel.text = text;
    return cell;
    
}

- (void)tableView:(UITableView *)collectionView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger row = [indexPath row];
    Game *game = [[Game alloc] init];
    game = [self.games objectAtIndex:row];
    [self.delegate selectedGame:game];
}

-(void)add
{
    [self.delegate addGame];
}

@end
