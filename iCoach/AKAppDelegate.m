//
//  AKAppDelegate.m
//  iCoach
//
//  Created by Amog Kamsetty on 9/5/14.
//  Copyright (c) 2014 Amog Kamsetty. All rights reserved.
//

#import "AKAppDelegate.h"
#import "AKFirstViewController.h"
#import "AKSecondViewController.h"
#import "AKPlayerDetailViewController.h"
#import "AKPlayerEditViewController.h"
#import "Game.h"
#import "AKGameDetailViewController.h"
@interface AKAppDelegate() <AKFirstViewControllerDelegate, AKPlayerDetailViewControllerDelegate, AKPlayerEditViewControllerDelegate, AKSecondViewControllerDelegate, AKGameDetailViewControllerDelegate>
@end
@implementation AKAppDelegate
{
    UINavigationController *_firstNavigationController;
    UINavigationController *_secondNavigationController;
    AKFirstViewController *_firstViewController;
    AKPlayerDetailViewController *_detailViewController;
    AKSecondViewController *_secondViewController;
    AKGameDetailViewController *_gameDetailViewController;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    AKFirstViewController *firstVC = [[AKFirstViewController alloc] init];
    firstVC.delegate = self;
    UINavigationController *firstNavVC = [[UINavigationController alloc] initWithRootViewController:firstVC];
    _firstNavigationController = firstNavVC;
    firstVC.title = @"Players";
    firstVC.players = [[NSArray alloc] init];
    
    Player *player1 = [[Player alloc] initWithFirstName:@"Test" lastName:@"One" number:1 position:@[@"PG"]starter:YES];
    Player *player2 = [[Player alloc] initWithFirstName:@"Test" lastName:@"Two" number:2 position:@[@"SG",@"SF",@"C"]starter:YES];
    Player *player3 = [[Player alloc] initWithFirstName:@"Test" lastName:@"Three" number:3 position:@[@"SF"]starter:YES];
    Player *player4 = [[Player alloc] initWithFirstName:@"Test" lastName:@"Four" number:4 position:@[@"PF"]starter:YES];
    Player *player5 = [[Player alloc] initWithFirstName:@"Test" lastName:@"Five" number:5 position:@[@"C"]starter:YES];
    Player *player6 = [[Player alloc] initWithFirstName:@"Test" lastName:@"Six" number:6 position:@[@"C"]starter:NO];
    
    
    NSArray *players = @[player1,player2,player3,player4,player5, player6];
    [firstVC updatePlayers:players];
    
    _firstViewController = firstVC;
    
    AKSecondViewController *secondVC = [[AKSecondViewController alloc] init];
    secondVC.delegate = self;
    UINavigationController *secondNavVC = [[UINavigationController alloc] initWithRootViewController:secondVC];
    _secondNavigationController = secondNavVC;
    secondVC.title = @"Games";
    //secondVC.games = @[[[Game alloc] initWithPlayers:_firstViewController.players name:@"Game 1"]];
    _secondViewController = secondVC;
    
    NSMutableArray *tabViewControllers = [[NSMutableArray alloc] init];
    [tabViewControllers addObject:firstNavVC];
    [tabViewControllers addObject:secondNavVC];
    
    firstNavVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Roster Management" image:nil tag:1];
    UINavigationBar *firstNavigationBar = firstNavVC.navigationBar;
    firstNavigationBar.barTintColor = [UIColor colorWithRed:242.0 / 255.0 green:122.0 / 255.0 blue:87.0 / 255.0 alpha:1.0];
    firstNavigationBar.tintColor = [UIColor whiteColor];
    firstNavigationBar.barStyle = UIBarStyleBlackOpaque;
    
    secondNavVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Games" image:nil tag:2];
    UINavigationBar *secondNavigationBar = secondNavVC.navigationBar;
    secondNavigationBar.barTintColor = [UIColor colorWithRed:242.0 / 255.0 green:122.0 / 255.0 blue:87.0 / 255.0 alpha:1.0];
    secondNavigationBar.tintColor = [UIColor whiteColor];
    secondNavigationBar.barStyle = UIBarStyleBlackOpaque;
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = tabViewControllers;
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = tabBarController;
    
    [self.window makeKeyAndVisible];
    
       
    return YES;
}

- (void)selectedPlayer:(Player *)player
{
    AKPlayerDetailViewController *detailVC = [[AKPlayerDetailViewController alloc] init];
    detailVC.delegate = self;
    [detailVC updatePlayer:player];
    _detailViewController = detailVC;
    [_firstNavigationController pushViewController:detailVC animated:YES];
}

-(void)editingPlayer:(Player *)player
{
    AKPlayerEditViewController *editView = [[AKPlayerEditViewController alloc] init];
    editView.delegate = self;
    [editView updatePlayer: player];
    [_firstNavigationController pushViewController:editView animated:YES];
}

-(void)finishedEdit:(Player *)player
{
    [_detailViewController updatePlayer:player];
    if(![_firstViewController.players containsObject:player] && player.firstname!=nil)
    {
        [_firstViewController updatePlayers:[_firstViewController.players arrayByAddingObject:player]];
    }
    [_firstViewController updatePlayers:_firstViewController.players];
    [_firstNavigationController popViewControllerAnimated:YES];
}

-(void)addPlayer:(Player *)player
{
    AKPlayerEditViewController *editView = [[AKPlayerEditViewController alloc] init];
    editView.delegate = self;
    [editView updatePlayer: player];
    [_firstNavigationController pushViewController:editView animated:YES];
}

-(void)selectedGame:(Game *)game
{
    AKGameDetailViewController *gameDetailVC = [[AKGameDetailViewController alloc] init];
    gameDetailVC.delegate = self;
    [gameDetailVC updateGame:game];
    _gameDetailViewController = gameDetailVC;
    [_secondNavigationController pushViewController:gameDetailVC animated:YES];
}

-(void)addGame
{
    Game *game = [[Game alloc]initWithPlayers:_firstViewController.players name:[NSString stringWithFormat:@"Game %d",_secondViewController.games.count+1]];
    for(Player *p in _firstViewController.players)
    {
        [p incrementGM];
    }
    [_secondViewController updateGames:[_secondViewController.games arrayByAddingObject:game]];
}

-(void) statsChanged:(Player *)player atStat:(int)section inGame:(Game *)game
{
    for(Player *p in _firstViewController.players)
    {
        if(p.number == player.number)
        {
        }
        
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
