//
//  PeopleTabBarController.m
//  Store Test
//
//  Created by Hill Balliet on 8/8/13.
//  Copyright (c) 2013 Hill Balliet. All rights reserved.
//

#import "PeopleTabBarController.h"
#import "AppDelegate.h"

@interface PeopleTabBarController ()

@end

@implementation PeopleTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	AppDelegate *delegator = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    self.delegate = delegator;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)deleteBegins:(id)sender {
    studentAccountsFile *reader = [[studentAccountsFile alloc] init];
    
    for (int i = 0; i < [reader allStatus].count; i++) {
        NSLog(@"%@ %@", [[reader allNames] objectAtIndex:i], [[reader allStatus] objectAtIndex:i]);
    }
    
//    confirmIdentity credentials = [[confirmIdentity alloc] initWithTitle:@"Credentials" message:@"Please enter " delegate:<#(id)#> cancelButtonTitle:<#(NSString *)#> otherButtonTitles:<#(NSString *), ...#>, nil]
//    [[self selectedViewController] setEditing:true];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    id holder = [[self.splitViewController.viewControllers objectAtIndex:1] topViewController];
    
    id secondHolder = [holder selectedViewController];
    
    [[[secondHolder cell] whichStudentField] becomeFirstResponder];
}
@end
