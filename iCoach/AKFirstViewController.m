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

@end

@implementation AKFirstViewController

static const NSUInteger kNumSections=2;
static const NSUInteger kStarterSection=0;
static const NSUInteger kBenchSection=1;
static const NSUInteger kNumStarters=5;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:NULL];

//    NSRange theRange;
//    
//    theRange.location = 0;
//    theRange.length = 5;
//    
//    self.starters = [self.players subarrayWithRange:theRange];
//    
//    
//    NSRange theOtherRange;
//    theOtherRange.location = 5;
//    theOtherRange.length = [self.players count]-[self.starters count];
//    
//    self.bench = [NSMutableArray arrayWithArray:[self.players subarrayWithRange:theOtherRange]];
    
	
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == kStarterSection)
    {
        return kNumStarters;
    }
    else if(section == kBenchSection)
    {
        return [self.players count]-kNumStarters;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return kNumSections;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
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
    
    if (indexPath.section==kStarterSection)
    {
        Player *cellValue = [self.players objectAtIndex:indexPath.row];
        cell.textLabel.text = [[cellValue.name stringByAppendingString:@", "]stringByAppendingString:[cellValue.number stringValue]];
        return cell;
    }
    else
    {
        Player *cellValue = [self.players objectAtIndex:indexPath.row+kNumStarters];
        cell.textLabel.text = [[cellValue.name stringByAppendingString:@", "]stringByAppendingString:[cellValue.number stringValue]];
        return cell;
    }
}

- (void)tableView:(UITableView *)collectionView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger row = [indexPath row];
    AKPlayerDetailViewController *viewController = [[AKPlayerDetailViewController alloc] init];
    if(indexPath.section==kStarterSection)
    {
        viewController.player = [self.players objectAtIndex:row];
        [self.navigationController pushViewController:viewController animated:NO];
    }
    else
    {
        viewController.player = [self.players objectAtIndex:row+5];
        [self.navigationController pushViewController:viewController animated:NO];
    }
}


-(void)updatePlayers: (NSArray *)players
{
    self.players = players;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
