//
//  DetailViewController.h
//  DB_22NOV
//
//  Created by geniemac4 on 22/11/14.
//  Copyright (c) 2014 genie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatabaseHelper.h"

@interface DetailViewController : UIViewController

{
    NSMutableArray *presentationArray;
    DatabaseHelper *objDBHelper;
}

@property (strong, nonatomic) IBOutlet UITableView *tableview;

@end
