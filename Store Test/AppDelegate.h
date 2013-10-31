//
//  AppDelegate.h
//  Store Test
//
//  Created by Hill Balliet on 12/23/12.
//  Copyright (c) 2012 Hill Balliet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DiningHallCell.h"
#import "DiningHallViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>{
    DiningHallCell *cell;
    DiningHallViewController *diningViewController;
}

@property (strong, nonatomic) UIWindow *window;

- (void)setCell:(DiningHallCell *)newCell viewController: (DiningHallViewController *)newDiningViewController;

@end
