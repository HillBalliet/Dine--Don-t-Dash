//
//  historyHeaderCell.h
//  Store Test
//
//  Created by Hill Balliet on 1/8/13.
//  Copyright (c) 2013 Hill Balliet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface historyHeaderCell : UITableViewCell{
    IBOutlet UIImageView *studentPhoto;
    
    IBOutlet UILabel *studentName;
    IBOutlet UILabel *totalSpent;
    IBOutlet UILabel *totalDeposited;
    IBOutlet UILabel *currentBalance;
}

- (void) updateInformation: (UIImage*) newStudentPhoto: (NSString*) newStudentName: (float) newTotalSpent: (float) newTotalDeposited: (float) newCurrentBalance: (BOOL) isBillHome;

@end
