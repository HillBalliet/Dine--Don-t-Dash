//
//  accountHistoryViewController.h
//  Store Test
//
//  Created by Hill Balliet on 12/28/12.
//  Copyright (c) 2012 Hill Balliet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "studentAccounts.h"

@interface accountHistoryViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    NSArray *transactions;
    NSArray *transactionCosts;
    int numTransactions;
    IBOutlet UITableView *accountHistoryTableView;
    
    studentAccounts *loadedStudent;
}

- (void) studentWasSelected: (studentAccounts*) studentsAccount;

@end
