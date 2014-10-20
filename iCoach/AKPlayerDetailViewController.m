//
//  AKPlayerDetailViewController.m
//  iCoach
//
//  Created by Amog Kamsetty on 10/13/14.
//  Copyright (c) 2014 Amog Kamsetty. All rights reserved.
//

#import "AKPlayerDetailViewController.h"
#import "Player.h"
#import "AKPlayerEditTableViewController.h"

@interface AKPlayerDetailViewController ()

@property (nonatomic, strong) Player *player;
@property (nonatomic, strong) NSDictionary *stats;
@end

@implementation AKPlayerDetailViewController

NSArray *keys;
NSArray *values;

- (void)viewDidLoad
{
    [super viewDidLoad];
    keys = @[@"PPG: ",@"RPG: ",@"APG: ",@"SPG: ",@"BPG: "];
    values = @[[self.player ppg],[self.player rpg],[self.player apg],[self.player spg],[self.player bpg]];
    self.stats = [NSDictionary dictionaryWithObjects:values forKeys:keys];
    
    self.view.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.95];
    UILabel *myLabel = [[UILabel alloc]initWithFrame:CGRectMake(120, 0, 175, 100)];
    myLabel.font = [UIFont fontWithName:@"Helvetica" size:35];
    myLabel.adjustsFontSizeToFitWidth = YES;
    [myLabel setBackgroundColor:[UIColor clearColor]];
    [myLabel setText:[self.player name]];
    
    UILabel *positionLabel = [[UILabel alloc] initWithFrame:CGRectMake(135, 50, 175, 100)];
    positionLabel.font = [UIFont fontWithName:@"Helvetica" size:25];
    positionLabel.adjustsFontSizeToFitWidth = YES;
    [positionLabel setBackgroundColor:[UIColor clearColor]];
    [positionLabel setText:[self.player position]];
    
    UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,25,120,100)];
    numberLabel.font = [UIFont fontWithName:@"Helvetica" size:80];
    numberLabel.adjustsFontSizeToFitWidth = YES;
    [numberLabel setBackgroundColor:[UIColor clearColor]];
    [numberLabel setText:[[[self.player number] stringValue] stringByAppendingString:@" | "]];
    
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(0.0, 120, 320.0, 125)textContainer: nil];
    self.textView.font = [UIFont fontWithName:@"Helvetica" size:12];
    self.textView.backgroundColor=[UIColor whiteColor];
    self.textView.returnKeyType = UIReturnKeyDone;
    self.textView.delegate = self;
    if(self.player.notes == nil)
    {
        self.textView.text=@"Notes";
    }
    else
    {
        self.textView.attributedText = self.player.notes;
    }
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:gestureRecognizer];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.backItem.title = @"Players";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(pushToEditView)];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 250, 320.0, 50*3)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [scrollview addSubview: myLabel];
    [scrollview addSubview:positionLabel];
    [scrollview addSubview:numberLabel];
    [scrollview addSubview: self.textView];
    [scrollview addSubview:self.tableView];
    scrollview.contentSize = CGSizeMake(320,568);
    [self.view addSubview:scrollview];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.stats count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Stats";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
    }
    
    for(NSString *key in self.stats)
    {
        if(key == [keys objectAtIndex:indexPath.row])
        {
            NSNumber *cellValue = [self.stats objectForKey:key];
            cell.textLabel.text = [key stringByAppendingString:[cellValue stringValue]];
        }
    }
        return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void) updatePlayer: (Player *)player
{
    self.player = player;
    [self.tableView reloadData];
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@"Notes"]) {
        textView.text = @"";
    }
    return YES;
}

-(BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    [self.player setNotes: textView.attributedText];
    return YES;
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    NSCharacterSet *doneButtonCharacterSet = [NSCharacterSet newlineCharacterSet];
    NSRange replacementTextRange = [text rangeOfCharacterFromSet:doneButtonCharacterSet];
    NSUInteger location = replacementTextRange.location;
    if (location != NSNotFound)
    {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

-(void)hideKeyboard
{
    [self.textView resignFirstResponder];
}

-(void)pushToEditView
{
    AKPlayerEditTableViewController *editView = [[AKPlayerEditTableViewController alloc] init];
    [self presentViewController:editView animated:YES completion:nil];
}



@end
