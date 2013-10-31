//
//  billHomeAccountHistoryViewController.h
//  Store Test
//
//  Created by Hill Balliet on 12/31/12.
//  Copyright (c) 2012 Hill Balliet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "studentAccounts.h"

@interface billHomeAccountHistoryViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    NSArray *transactions;
    NSArray *transactionCosts;
    int numTransactions;
    IBOutlet UITableView *billHomeAccountHistoryTableView;
    
    studentAccounts *loadedStudent;
}

- (void) studentWasSelected: (studentAccounts*) studentsAccount;

@end
