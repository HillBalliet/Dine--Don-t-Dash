//
//  historyHeaderCell.m
//  Store Test
//
//  Created by Hill Balliet on 1/8/13.
//  Copyright (c) 2013 Hill Balliet. All rights reserved.
//

#import "historyHeaderCell.h"

@implementation historyHeaderCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void) updateInformation: (UIImage*) newStudentPhoto: (NSString*) newStudentName: (float) newTotalSpent: (float) newTotalDeposited: (float) newCurrentBalance: (BOOL) isBillHome{
    if (newStudentPhoto) {
        [studentPhoto setImage:newStudentPhoto];
    }
    else
        [studentPhoto setImage:[UIImage imageNamed:@"Generic Face.jpeg"]];
    
    if (isBillHome) {
        [studentName setText:newStudentName];
    }
    else{
        if (newStudentName) {
            [studentName setText:newStudentName];
            [totalSpent setText:[NSString stringWithFormat: @"%.2f", newTotalSpent]];
            [totalDeposited setText:[NSString stringWithFormat: @"%.2f", newTotalDeposited]];
            [currentBalance setText:[NSString stringWithFormat: @"%.2f", newCurrentBalance]];
        }
        else
            [studentName setText:@"Student Information"];
        
        [totalSpent setText:[NSString stringWithFormat: @"%.2f", newTotalSpent]];
        [totalDeposited setText:[NSString stringWithFormat: @"%.2f", newTotalDeposited]];
        [currentBalance setText:[NSString stringWithFormat: @"%.2f", newCurrentBalance]];
    }
}

@end
