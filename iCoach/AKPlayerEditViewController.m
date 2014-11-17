//
//  AKPlayerEditViewController.m
//  iCoach
//
//  Created by Amog Kamsetty on 11/7/14.
//  Copyright (c) 2014 Amog Kamsetty. All rights reserved.
//

#import "AKPlayerEditViewController.h"
#import "Player.h"
#import "AKFirstViewController.h"
#import "AKPlayerDetailViewController.h"

@interface AKPlayerEditViewController ()

@property (nonatomic, strong) NSMutableArray *positions;
@property (nonatomic, strong) NSArray *viewControllers;
@property (nonatomic,strong) NSString *firstname;
@property (nonatomic, strong) NSString *lastname;
@property (nonatomic, strong) NSString *playernumber;
@property (nonatomic) BOOL playerstarter;

@end

@implementation AKPlayerEditViewController

static const int kNumberOfPositions = 5;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.viewControllers = [self.navigationController viewControllers];
    
    self.positions = [[NSMutableArray alloc] init];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
    
    self.textField1 = [[UITextField alloc] initWithFrame:CGRectMake(0, 50, 325, 100)];
    self.textField1.font = [UIFont fontWithName:@"Helvetica" size:20];
    self.textField1.backgroundColor=[UIColor clearColor];
    self.textField1.returnKeyType = UIReturnKeyDone;
    self.textField1.delegate = self;
    
    self.textField2 = [[UITextField alloc] initWithFrame:CGRectMake(0, 100, 325, 100)];
    self.textField2.font = [UIFont fontWithName:@"Helvetica" size:20];
    self.textField2.backgroundColor=[UIColor clearColor];
    self.textField2.returnKeyType = UIReturnKeyDone;
    self.textField2.delegate = self;
    
    if(self.player.firstname == nil)
    {
        self.textField1.placeholder=@"First Name";
    }
    else
    {
        self.textField1.text = self.player.firstname;
        self.firstname = self.player.firstname;
    }
    
    if(self.player.lastname == nil)
    {
        self.textField2.placeholder=@"Last Name";
    }
    else
    {
        self.textField2.text = self.player.lastname;
        self.lastname = self.player.lastname;
    }
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    gestureRecognizer.delegate = self;
    [self.view addGestureRecognizer:gestureRecognizer];
    
    
    self.numberPicker = [[UIPickerView alloc] init];
    self.numberPicker.delegate = self;
    self.numberPicker.showsSelectionIndicator = YES;
    self.numberPicker.backgroundColor = [UIColor clearColor];
    
    self.number = [[UITextField alloc] initWithFrame:CGRectMake(0, 150, 325, 100)];
    self.number.inputView = self.numberPicker;
    self.number.font = [UIFont fontWithName:@"Helvetica" size:20];
    self.number.backgroundColor = [UIColor clearColor];
    
    if(self.player.number == nil)
    {
        self.number.placeholder = @"Number";
    }
    else
    {
        self.number.text = [NSString stringWithFormat:@"%@", self.player.number];
        self.playernumber = [NSString stringWithFormat:@"%@", self.player.number];
    }
    
    self.positionView = [[UITableView alloc] initWithFrame:CGRectMake(0, 225, 325, 250)];
    self.positionView.delegate = self;
    self.positionView.dataSource = self;
    [self.positionView setAllowsSelection:YES];
    
    self.starterLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 475, 75, 20)];
    self.starterLabel.text = @"Starter: ";
    self.starterLabel.backgroundColor = [UIColor clearColor];
    self.starterLabel.font = [UIFont fontWithName:@"Helvetica" size:20];
    
    self.starter = [[UISwitch alloc] initWithFrame:CGRectMake(80, 475, 0, 0)];
    [self.starter addTarget:self action:@selector(changeSwitch:) forControlEvents:UIControlEventValueChanged];
    self.playerstarter = self.player.starter;
    if (self.player.starter == YES) {
        [self.starter setOn:YES animated:NO];
    }
    
    [self.view addSubview:self.textField1];
    [self.view addSubview:self.textField2];
    [self.view addSubview:self.number];
    [self.view addSubview:self.positionView];
    [self.view addSubview:self.starter];
    [self.view addSubview:self.starterLabel];
    
}

-(void)updatePlayer: (Player *)player
{
    self.player = player;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField.placeholder != nil)
    {
        textField.text = @"";
    }
    return YES;
}


-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    self.firstname = self.textField1.text;
    self.lastname = self.textField2.text;
    return YES;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

-(void)hideKeyboard
{
    [self.textField1 resignFirstResponder];
    [self.textField2 resignFirstResponder];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
    self.number.text = [NSString stringWithFormat:@"%d", row];
    self.playernumber = self.number.text;
    [self.number resignFirstResponder];
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    NSUInteger numRows = 100;
    
    return numRows;
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *title;
    title = [@"" stringByAppendingFormat:@"%d",row];
    
    return title;
}


- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    int sectionWidth = 300;
    
    return sectionWidth;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return kNumberOfPositions;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Positions";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
    }
    
    int row = indexPath.row;
    switch (row) {
        case 0:
            cell.textLabel.text = @"PG";
            break;
        case 1:
            cell.textLabel.text = @"SG";
            break;
        case 2:
            cell.textLabel.text = @"SF";
            break;
        case 3:
            cell.textLabel.text = @"PF";
            break;
        case 4:
            cell.textLabel.text = @"C";
            break;
        default:
            break;
    }
    for(NSString *str in self.player.position)
    {
        if([str isEqualToString:cell.textLabel.text])
        {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            [self.positions addObject:cell.textLabel.text];
        }
    }
    return cell;
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if([self.positions containsObject:cell.textLabel.text])
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        [self.positions removeObject:cell.textLabel.text];
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        [self.positions addObject:cell.textLabel.text];
    }
    
}

-(void)changeSwitch:(id)sender
{
    AKFirstViewController *firstVC = [self.viewControllers objectAtIndex:0];
    if ([sender isOn])
    {
        if ([[firstVC starters] count] >= 5)
        {
            [self.starter setOn:NO animated:YES];
            return;
        }
        self.playerstarter = YES;
        
    }
    else
    {
        self.playerstarter = NO;
    }
}

-(void)done
{
    [self.player setFirstName: self.firstname lastName:self.lastname];
    [self.player setNumber: self.playernumber];
    [self.player setStarter:self.playerstarter];
    [self.player setPosition: self.positions];
    [self.delegate finishedEdit:self.player];
}

-(void)cancel
{
    [self.delegate finishedEdit:self.player];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return self.textField1.isEditing || self.textField2.isEditing;
}

@end
