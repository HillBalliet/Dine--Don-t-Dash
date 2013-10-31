//
//  RootViewController.m
//  Pager
//
//  Created by Matteo Cappadonna on 09/08/12.
//  Copyright (c) 2012 Matteo Cappadonna. All rights reserved.
//

#import "PageViewController.h"

#import "registerViewController.h"
#import "SecondRegisterViewController.h"

@interface PageViewController ()
@property (nonatomic, retain) registerViewController *firstViewController;
@property (nonatomic, retain) SecondRegisterViewController *secondViewController;
@end

@implementation PageViewController

- (registerViewController *)firstViewController {
    
    if (!_firstViewController) {
        UIStoryboard *storyboard = self.storyboard;
        _firstViewController = [storyboard instantiateViewControllerWithIdentifier:@"First View"];
    }
    
    return _firstViewController;
}

- (SecondRegisterViewController *)secondViewController {
    
    if (!_secondViewController) {
        UIStoryboard *storyboard = self.storyboard;
        _secondViewController = [storyboard instantiateViewControllerWithIdentifier:@"Second View"];
    }
    
    return _secondViewController;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // Aggancio il data source.
    self.dataSource = self;
    self.splitViewController.presentsWithGesture = NO;
    
    
    NSLog(@"%d", [self.splitViewController presentsWithGesture]);
    NSLog(@"%@", self.splitViewController);
    
    // Aggancio il view controller iniziale.
    [self setViewControllers:@[self.firstViewController]
                   direction:UIPageViewControllerNavigationDirectionForward
                    animated:YES
                  completion:nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    UIViewController *nextViewController = nil;
    
    if (viewController == self.firstViewController) {
        nextViewController = self.secondViewController;
    }
    
    return nextViewController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    UIViewController *prevViewController = nil;
    
    if (viewController == self.secondViewController) {
        prevViewController = self.firstViewController;
    }
    
    return prevViewController;
}

@end
