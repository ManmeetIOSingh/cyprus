//
//  DetailViewController.m
//  DB_22NOV
//
//  Created by geniemac4 on 22/11/14.
//  Copyright (c) 2014 genie. All rights reserved.
//

#import "DetailViewController.h"
#import "StudentTableViewCell.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize tableview;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.title = @"Student Listing";
    
    objDBHelper = [[DatabaseHelper alloc]init];
    
    presentationArray = [[NSMutableArray alloc]initWithArray:[objDBHelper getAllStudentRecord]];
    
    if (presentationArray.count!=0)
    {
        [tableview reloadData];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return presentationArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    StudentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    NSArray *xiblocation = [[NSBundle mainBundle] loadNibNamed:@"StudentTableViewCell" owner:self options:nil];
    
    for (id cellObj in xiblocation)
    {
        cell = (StudentTableViewCell*)cellObj;
    }
    
    cell.lblname.text = [[presentationArray objectAtIndex:indexPath.row] valueForKey:@"emp_name"];
    
    cell.lblnumber.text = [[presentationArray objectAtIndex:indexPath.row] valueForKey:@"emp_id"];
    
    cell.lbladdress.text = [[presentationArray objectAtIndex:indexPath.row] valueForKey:@"emp_sal"];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90.0f;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source
        if (objDBHelper)
        {
            NSString *currentUserRecordID = [[presentationArray objectAtIndex:indexPath.row] valueForKey:@"emp_id"];
            
            BOOL deleteflag = [objDBHelper deleteEmployeeWithID:currentUserRecordID];
            
            if (deleteflag == YES)
            {
                [presentationArray removeObjectAtIndex:indexPath.row];
                [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            }
        }
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}



@end
