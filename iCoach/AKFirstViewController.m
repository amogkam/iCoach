//
//  AKFirstViewController.m
//  iCoach
//
//  Created by Amog Kamsetty on 9/5/14.
//  Copyright (c) 2014 Amog Kamsetty. All rights reserved.
//

#import "AKFirstViewController.h"
#import "Player.h"
#import "AKPlayerDetailViewController.h"

@interface AKFirstViewController ()

@property (strong, nonatomic) AKPlayerDetailViewController *playerController;

@property (nonatomic, strong) NSArray *players;

@property(nonatomic, strong) UISearchDisplayController *controller;

@end

@implementation AKFirstViewController

static const NSUInteger kNumSections=2;
static const NSUInteger kStarterSection=0;
static const NSUInteger kBenchSection=1;
static const NSUInteger kNumStarters=5;

NSArray *searchResults;
NSMutableArray *names;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for(Player *player in self.players)
    {
        [names addObject:player.name];
    }
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:NULL];
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0,50,320,44)];
    self.tableView.tableHeaderView = searchBar;
    searchBar.delegate = self;
    self.controller = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    self.controller.delegate = self;
    self.controller.searchResultsDataSource = self;
    self.controller.searchResultsDelegate = self;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
        
    }
    
    else
    {
        if(section == kStarterSection)
        {
            return kNumStarters;
        }
        else if(section == kBenchSection)
        {
            return [self.players count]-kNumStarters;
        }
    }
    
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == self.searchDisplayController.searchResultsTableView) return 1;
    return kNumSections;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) return @"";
    if(section == kStarterSection)
    {
        return @"Starters";
    }
    else if(section == kBenchSection)
    {
        return @"Bench";
    }
    return @"";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
    }
    
    
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        Player *cellValue = [searchResults objectAtIndex:indexPath.row];
        cell.textLabel.text = [[cellValue.name stringByAppendingString:@", "]stringByAppendingString:[cellValue.number stringValue]];
        return cell;
    }
    else
    {
        if (indexPath.section==kStarterSection)
        {
            Player *cellValue = [self.players objectAtIndex:indexPath.row];
            NSString *text = [[cellValue.name stringByAppendingString:@", "]stringByAppendingString:[cellValue.number stringValue]];
            cell.textLabel.text = text;
            return cell;
        }
        else
        {
            Player *cellValue = [self.players objectAtIndex:indexPath.row+kNumStarters];
            NSString *text = [[cellValue.name stringByAppendingString:@", "]stringByAppendingString:[cellValue.number stringValue]];
            cell.textLabel.text = text;
            
            return cell;
        }
    }
    
}

- (void)tableView:(UITableView *)collectionView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger row = [indexPath row];
    AKPlayerDetailViewController *viewController = [[AKPlayerDetailViewController alloc] init];
    if(indexPath.section==kStarterSection)
    {
        [viewController updatePlayer:[self.players objectAtIndex:row]];
        [self.navigationController pushViewController:viewController animated:YES];
    }
    else
    {
        [viewController updatePlayer:[self.players objectAtIndex:row+5]];
        [self.navigationController pushViewController:viewController animated:YES];
    }
}


-(void)updatePlayers: (NSArray *)players
{
    self.players = players;
    [self.tableView reloadData];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"name contains %@", searchText];
    searchResults = [names filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles]objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    return YES;
}

@end
