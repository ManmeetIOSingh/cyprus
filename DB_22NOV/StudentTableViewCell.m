//
//  StudentTableViewCell.m
//  DB_22NOV
//
//  Created by geniemac4 on 22/11/14.
//  Copyright (c) 2014 genie. All rights reserved.
//

#import "StudentTableViewCell.h"

@implementation StudentTableViewCell
@synthesize lblname,lblnumber,lbladdress;

- (void)awakeFromNib
{
    // Initialization code
}

/*
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}
 */

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
