//
//  MasterViewController.h
//  Master Detail Test
//
//  Created by Hill Balliet on 12/28/12.
//  Copyright (c) 2012 Hill Balliet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "studentAccounts.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController <UISplitViewControllerDelegate, UITabBarDelegate>{
    BOOL shouldHideMasterViewController;
    studentAccounts *ramsey;
    
    NSArray *allTheStudents;
}

@property (strong, nonatomic) DetailViewController *detailViewController;

- (void)insertNewObject:(id)sender;

- (void)changeShouldHideMasterViewController;

- (BOOL) shouldHideMasterViewController;

- (studentAccounts*) selectedStudent;

- (void) setWhoseDelegate: (UITabBar*) tabBar;
@end
