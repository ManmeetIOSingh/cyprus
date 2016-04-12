//
//  InsertViewController.m
//  DB_22NOV
//
//  Created by geniemac4 on 22/11/14.
//  Copyright (c) 2014 genie. All rights reserved.
//

#import "InsertViewController.h"
#import "DetailViewController.h"

@interface InsertViewController ()

@end

@implementation InsertViewController
@synthesize txtName,txtNumbar,txtAddress;

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


- (void)viewWillAppear:(BOOL)animated
{
    objDBHelper = [[DatabaseHelper alloc]init];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)SubmitButtonClicked:(id)sender
{
    if ([objDBHelper insertStudentRecordWithStudentName:txtName.text andStudentNumbar:txtNumbar.text andatudentAddress:txtAddress.text])
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Record inserted Successfully" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [alert show];
        
        [self clearControls:self];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Record insertion failed" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [alert show];
    }
    
    [txtName resignFirstResponder];
    [txtNumbar resignFirstResponder];
    [txtAddress resignFirstResponder];

}

- (IBAction)ShowAllDetailsButtonClicked:(id)sender
{
    DetailViewController *DVC = [[DetailViewController alloc]init];
    [self.navigationController pushViewController:DVC animated:YES];
}

- (void)clearControls:(id)sender
{
    self.txtName.text = @"";
    self.txtNumbar.text = @"";
    self.txtAddress.text = @"";
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


@end
