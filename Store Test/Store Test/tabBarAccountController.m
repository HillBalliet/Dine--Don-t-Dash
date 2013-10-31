//
//  tabBarAccountController.m
//  Store Test
//
//  Created by Hill Balliet on 1/1/13.
//  Copyright (c) 2013 Hill Balliet. All rights reserved.
//

#import "tabBarAccountController.h"
#import "accountHistoryViewController.h"
#import "billHomeAccountHistoryViewController.h"

@interface tabBarAccountController ()

@end

@implementation tabBarAccountController

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
    selectedStudent = nil;
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setSelectedStudent: (studentAccounts*) newSelectedStudent{
    selectedStudent = newSelectedStudent;
    
    id holder = [self selectedViewController];
    
    [holder studentWasSelected:selectedStudent];
}

- (studentAccounts*) selectedStudent{
    return selectedStudent;
}

@end
