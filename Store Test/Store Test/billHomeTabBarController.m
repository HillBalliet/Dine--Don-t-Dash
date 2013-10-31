//
//  billHomeTabBarController.m
//  Store Test
//
//  Created by Hill Balliet on 12/29/12.
//  Copyright (c) 2012 Hill Balliet. All rights reserved.
//

#import "billHomeTabBarController.h"
#import "DiningHallViewController.h"

@interface billHomeTabBarController ()

@end

@implementation billHomeTabBarController

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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendMail:(id)sender{
    [(DiningHallViewController*)[self selectedViewController] showPicker];
}
@end
