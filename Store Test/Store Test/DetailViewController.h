//
//  DetailViewController.h
//  Master Detail Test
//
//  Created by Hill Balliet on 12/30/12.
//  Copyright (c) 2012 Hill Balliet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
