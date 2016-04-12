//
//  InsertViewController.h
//  DB_22NOV
//
//  Created by geniemac4 on 22/11/14.
//  Copyright (c) 2014 genie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatabaseHelper.h"

@interface InsertViewController : UIViewController
//<UITextFieldDelegate>
{
    DatabaseHelper *objDBHelper;
}

@property (strong, nonatomic) IBOutlet UITextField *txtName;
@property (strong, nonatomic) IBOutlet UITextField *txtNumbar;
@property (strong, nonatomic) IBOutlet UITextField *txtAddress;

- (IBAction)SubmitButtonClicked:(id)sender;
- (IBAction)ShowAllDetailsButtonClicked:(id)sender;


@end
