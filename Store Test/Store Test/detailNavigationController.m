//
//  detailNavigationController.m
//  Store Test
//
//  Created by Hill Balliet on 12/29/12.
//  Copyright (c) 2012 Hill Balliet. All rights reserved.
//

#import "detailNavigationController.h"
#import "MasterViewController.h"
#import "DetailViewController.h"

@interface detailNavigationController ()

@end

@implementation detailNavigationController

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
    isNesting = false;
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item{
    if (!isNesting) {
        
        if ([[NSString stringWithFormat:@"%@", [[[self.splitViewController.viewControllers objectAtIndex:0] topViewController] class]] isEqualToString:@"registerViewController"]) {
                        
            [[self.splitViewController.viewControllers objectAtIndex:0] popViewControllerAnimated:YES];
            
            id holder = self.splitViewController.delegate;
            [holder changeShouldHideMasterViewController];
            
            self.splitViewController.delegate = nil;
            self.splitViewController.delegate = holder;
            
            [self.splitViewController.view setNeedsLayout];
            
            [self.splitViewController willRotateToInterfaceOrientation:self.interfaceOrientation duration:0];
        }
        else if([[NSString stringWithFormat:@"%@", [[[self.splitViewController.viewControllers objectAtIndex:1] topViewController] class]] isEqualToString:@"UITabBarController"]){
            
            if (isUnderStore) {
                [[[self.splitViewController.viewControllers objectAtIndex:0] topViewController]performSegueWithIdentifier:@"manualSegue" sender:self];
                
                [[[[self.splitViewController.viewControllers objectAtIndex:0] topViewController] navigationItem] setHidesBackButton:YES animated:YES];
                id holder = self.splitViewController.delegate;

            }
            else{
                id holder = self.splitViewController.delegate;
                
                if (![holder shouldHideMasterViewController]) {
                    [holder changeShouldHideMasterViewController];
                }
                self.splitViewController.delegate = nil;
                self.splitViewController.delegate = holder;
                
                [self.splitViewController.view setNeedsLayout];
                
                [self.splitViewController willRotateToInterfaceOrientation:self.interfaceOrientation duration:0];
            }
                
        }
        else{
                        
            id holder = self.splitViewController.delegate;
            
            if (![holder shouldHideMasterViewController]) {
                [holder changeShouldHideMasterViewController];
            }
            self.splitViewController.delegate = nil;
            self.splitViewController.delegate = holder;
            
            [self.splitViewController.view setNeedsLayout];
            
            [self.splitViewController willRotateToInterfaceOrientation:self.interfaceOrientation duration:0];
        }
        
        isNesting = true;

        [self popViewControllerAnimated:YES];
    }
    isNesting = false;
}

- (void)navigationBar: (UINavigationBar *) navigationBar didPopItem:(UINavigationItem *)item{
    if([[NSString stringWithFormat:@"%@", [[[self.splitViewController.viewControllers objectAtIndex:1] topViewController] class]] isEqualToString:@"DetailViewController"]){
                
        id holder = self.splitViewController.delegate;
        [holder insertNewObject: self];
    }
    else if([[NSString stringWithFormat:@"%@", [[[self.splitViewController.viewControllers objectAtIndex:1] topViewController] class]] isEqualToString:@"storeTableViewController"]){
        
        id holder = self.splitViewController.delegate;
        [holder insertNewObject: self];
    }
}

- (void) navigationBar: (UINavigationBar *) navigationBar shouldPushItem:(UINavigationItem *)item{
    if ([[NSString stringWithFormat:@"%@", [[[self.splitViewController.viewControllers objectAtIndex:1] topViewController] class]] isEqualToString:@"storeTableViewController"]){
                
        [[[self.splitViewController.viewControllers objectAtIndex:0] topViewController]performSegueWithIdentifier:@"manualSegue" sender:self];
        
        [[[[self.splitViewController.viewControllers objectAtIndex:0] topViewController] navigationItem] setHidesBackButton:YES animated:YES];
        
        id holder = self.splitViewController.delegate;
        
        if ([holder shouldHideMasterViewController]) {
            [holder changeShouldHideMasterViewController];
        }
        
        self.splitViewController.delegate = nil;
        self.splitViewController.delegate = holder;
        
        [self.splitViewController.view setNeedsLayout];
        
        [self.splitViewController willRotateToInterfaceOrientation:self.interfaceOrientation duration:0];
    }
    else if ([[NSString stringWithFormat:@"%@", [[[self.splitViewController.viewControllers objectAtIndex:1] topViewController] class]] isEqualToString:@"tabBarAccountController"] || [[NSString stringWithFormat:@"%@", [[[self.splitViewController.viewControllers objectAtIndex:1] topViewController] class]] isEqualToString:@"billHomeTabBarController"]){
                
        if ([[NSString stringWithFormat:@"%@", [[[self.splitViewController.viewControllers objectAtIndex:0] topViewController] class]] isEqualToString:@"registerViewController"]) {
            isUnderStore = true;
            
            [[self.splitViewController.viewControllers objectAtIndex:0] popViewControllerAnimated:YES];
        }
        else
            isUnderStore = false;
        id holder = self.splitViewController.delegate;
        
        if ([holder shouldHideMasterViewController]) {
            [holder changeShouldHideMasterViewController];
        }
        
        self.splitViewController.delegate = nil;
        self.splitViewController.delegate = holder;
        
        [self.splitViewController.view setNeedsLayout];
        
        [self.splitViewController willRotateToInterfaceOrientation:self.interfaceOrientation duration:0];
    }
    else if ([[NSString stringWithFormat:@"%@", [[[self.splitViewController.viewControllers objectAtIndex:0] topViewController] class]] isEqualToString:@"registerViewController"]){
    }
}

- (void) navigationBar: (UINavigationBar *) navigationBar didPushItem:(UINavigationItem *)item{
    if([[NSString stringWithFormat:@"%@", [[[self.splitViewController.viewControllers objectAtIndex:1] topViewController] class]] isEqualToString:@"tabBarAccountController"]|| [[NSString stringWithFormat:@"%@", [[[self.splitViewController.viewControllers objectAtIndex:1] topViewController] class]] isEqualToString:@"billHomeTabBarController"]){
        id holder = self.splitViewController.delegate;
        [holder insertNewObject: self];
    }
}

@end
