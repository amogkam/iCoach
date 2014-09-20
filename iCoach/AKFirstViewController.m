//
//  AKFirstViewController.m
//  iCoach
//
//  Created by Amog Kamsetty on 9/5/14.
//  Copyright (c) 2014 Amog Kamsetty. All rights reserved.
//

#import "AKFirstViewController.h"

@interface AKFirstViewController ()

@end

@implementation AKFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Roster Management";
    
    self.players = [NSMutableArray arrayWithObjects:@"Doe, John",@"Random, Joe",@"Kamsetty,Amog",@"Cambell,Colin",@"McDonald,Austen",@"Objective,C", nil];
	
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0)
    {
        return 5;
    }
    else if(section == 1)
    {
        return [self.players count]-5;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 0)
    {
        return @"Starters";
    }
    else if(section == 1)
    {
        return @"Bench";
    }
    return @"";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    cell.textLabel.text = [self.players objectAtIndex:indexPath.row];
    
    return cell;
    
    
//    if (indexPath.section==0) {
//        appDelegate = (MultipleDetailViewsWithNavigatorAppDelegate *)[[UIApplication sharedApplication] delegate];
//        ObjectData *theCellData = [resultArray objectAtIndex:indexPath.row];
//        NSString *cellValue =theCellData.category;
//        NSLog(@"Cell Values %@",cellValue);
//        cell.textLabel.text = cellValue;
//        return cell;
//    }
//    else {
//        ObjectData *theCellData = [resultArray objectAtIndex:indexPath.row];
//        NSString *cellValue =theCellData.category;
//        cell.textLabel.text = cellValue;
//        return cell;
    }



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
