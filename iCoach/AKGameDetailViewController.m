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
    
    self.title = self.game.name;
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(100, 279, 249,1000)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100,0,249,279)];
    self.imageView.image = [UIImage imageNamed:@"court9.png"];
    [self.imageView setUserInteractionEnabled:YES];
    
    self.selectedPlayer = self.game.pg;
    
    
    self.pg = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.pg addTarget:self action:@selector(buttonHandler:) forControlEvents: UIControlEventTouchUpInside];
    [self.pg setTitle:[NSString stringWithFormat:@"%@, %@",self.game.pg.lastname,@"PG"] forState:UIControlStateNormal];
    self.pg.frame = CGRectMake(35,2,120,40);
    [self.pg setBackgroundColor:[UIColor colorWithRed:242.0 / 255.0 green:122.0 / 255.0 blue:87.0 / 255.0 alpha:1.0]];
    self.pg.tag = [self.game.pg.number integerValue];
    [self.imageView addSubview:self.pg];
    
    self.sg = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.sg addTarget:self action:@selector(buttonHandler:) forControlEvents: UIControlEventTouchUpInside];
    [self.sg setTitle:[NSString stringWithFormat:@"%@, %@",self.game.sg.lastname,@"SG"] forState:UIControlStateNormal];
    self.sg.frame = CGRectMake(5,60,120,40);
    self.sg.tag = [self.game.sg.number integerValue];
    [self.sg setBackgroundColor:[UIColor colorWithRed:242.0 / 255.0 green:122.0 / 255.0 blue:87.0 / 255.0 alpha:1.0]];
    [self.imageView addSubview:self.sg];
    
    self.sf = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.sf addTarget:self action:@selector(buttonHandler:) forControlEvents: UIControlEventTouchUpInside];
    [self.sf setTitle:[NSString stringWithFormat:@"%@, %@",self.game.sf.lastname,@"SF"] forState:UIControlStateNormal];
    self.sf.frame = CGRectMake(100,220,120,40);
    self.sf.tag = [self.game.sf.number integerValue];
    [self.sf setBackgroundColor:[UIColor colorWithRed:242.0 / 255.0 green:122.0 / 255.0 blue:87.0 / 255.0 alpha:1.0]];
    [self.imageView addSubview:self.sf];
    
    self.pf = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.pf addTarget:self action:@selector(buttonHandler:) forControlEvents: UIControlEventTouchUpInside];
    [self.pf setTitle:[NSString stringWithFormat:@"%@, %@",self.game.pf.lastname,@"PF"] forState:UIControlStateNormal];
    self.pf.frame = CGRectMake(5,160,120,40);
    self.pf.tag = [self.game.pf.number integerValue];
    [self.pf setBackgroundColor:[UIColor colorWithRed:242.0 / 255.0 green:122.0 / 255.0 blue:87.0 / 255.0 alpha:1.0]];
    [self.imageView addSubview:self.pf];
    
    self.c = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.c addTarget:self action:@selector(buttonHandler:) forControlEvents: UIControlEventTouchUpInside];
    [self.c setTitle:[NSString stringWithFormat:@"%@, %@",self.game.c.lastname,@"C"] forState:UIControlStateNormal];
    self.c.frame = CGRectMake(100,110,120,40);
    self.c.tag = [self.game.c.number integerValue];
    [self.c setBackgroundColor:[UIColor colorWithRed:242.0 / 255.0 green:122.0 / 255.0 blue:87.0 / 255.0 alpha:1.0]];
    [self.imageView addSubview:self.c];
    
    self.statsView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0, 100, 1000)];
    self.statsView.delegate = self;
    self.statsView.dataSource = self;
    
    UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
   scrollview.contentSize = CGSizeMake(self.view.frame.size.width,1000);
    [scrollview addSubview:self.tableView];
    [scrollview addSubview:self.imageView];
    [scrollview addSubview:self.statsView];
    
    [self.view addSubview:scrollview];
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
    if(tableView==self.tableView) return [self.game.bench count];
    else return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if(tableView==self.tableView)return 1;
    else return 13;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(tableView==self.tableView) return @"Bench";
    else
    {
        switch (section) {
            case 0:
                return @"Points";
                break;
            case 1:
                return @"DReb";
                break;
            case 2:
                return @"OReb";
                break;
            case 3:
                return @"Assists";
                break;
            case 4:
                return @"Steals";
                break;
            case 5:
                return @"Blocks";
                break;
            case 6:
                return @"TO";
                break;
            case 7:
                return @"Fouls";
                break;
            case 8:
                return @"2pt FGM";
                break;
            case 9:
                return @"3pt FGM";
                break;
            case 10:
                return @"FGA";
                break;
            case 11:
                return @"FTM";
                break;
            case 12:
                return @"FTA";
                break;
            default:
                break;
        }
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
    
    if(tableView==self.statsView)
    {
        UIStepper *stepper = [[UIStepper alloc] init];
        //NSLog(@"%d",indexPath.row);
        stepper.value = [[[self.game.playerGameStats objectForKey:self.selectedPlayer.number] objectAtIndex:indexPath.section] doubleValue];
        //NSLog(@"%f",stepper.value);
        stepper.tag = indexPath.section;
        
//        UILabel *myLabel = [[UILabel alloc] init];
//        myLabel.font = [UIFont fontWithName:@"Helvetica" size:5];
//        myLabel.text = [NSString stringWithFormat:@"%f",stepper.value];
        
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:5];
        cell.textLabel.text = [NSString stringWithFormat:@"%f",stepper.value];
        
        [cell addSubview:stepper];
//        [cell addSubview:myLabel];
        
        [stepper addTarget:self action:@selector(incrementStepper:) forControlEvents:UIControlEventValueChanged];
    }
    else
    {
        Player *cellValue = [self.game.bench objectAtIndex:indexPath.row];
        NSString *text = [[[cellValue fullName] stringByAppendingString:@", "]stringByAppendingString:[cellValue.number stringValue]];
        cell.textLabel.text = text;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger row = [indexPath row];
    if(tableView==self.tableView)
    {
        self.selectedPlayer = [self.game.bench objectAtIndex:row];
        [self.statsView reloadData];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    else return;

}

-(void) buttonHandler: (id)sender
{
    UIButton *button = (UIButton *)sender;
    for(Player *p in self.game.gamePlayers)
    {
        if(button.tag == [p.number integerValue]) self.selectedPlayer = p;
    }
    [self.statsView reloadData];
}

-(void)incrementStepper: (id)sender
{
    UIStepper *stepper = (UIStepper *)sender;
    //NSLog(@"%f",stepper.value);
    NSMutableDictionary *temp = [NSMutableDictionary dictionaryWithDictionary:self.game.playerGameStats];
    NSMutableArray *temp2 = [[temp objectForKey:self.selectedPlayer.number] mutableCopy];
    NSInteger s = stepper.tag;
    //NSLog(@"%d",s);
    [temp2 replaceObjectAtIndex:s withObject: [NSNumber numberWithInt:(int)stepper.value]];
    [temp setObject:[NSArray arrayWithArray:temp2] forKey:self.selectedPlayer.number];
    self.game.playerGameStats = [NSDictionary dictionaryWithDictionary:temp];
    [self.statsView reloadData];
}
@end
