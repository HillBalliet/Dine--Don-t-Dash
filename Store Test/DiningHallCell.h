//
//  DiningHallCell.h
//  Store Test
//
//  Created by Hill Balliet on 1/16/13.
//  Copyright (c) 2013 Hill Balliet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DiningHallViewController.h"
#import "studentAccountsFile.h"
#import "confirmIdentity.h"

@class DiningHallViewController;

@interface DiningHallCell : UITableViewCell <UIAlertViewDelegate>{
    int x;
    DiningHallViewController *diningViewController;
    
    IBOutlet UILabel *priceLabel;
    IBOutlet UILabel *mealLabel;
    
    IBOutlet UITextField *whichStudentField;
    
    NSTimer *mealTimer;
    
    NSString *costOfMeal;
    NSString *nameOfMeal;
    NSString *dateOfMeal;
        
    NSNumber *numberCostOfMeal;
    
    studentAccountsFile *readWrite;
}

- (NSString*) costOfMeal;

- (void) startTimer: (DiningHallViewController*) viewController;
- (void)stopTimer;
- (void)restartTimer;

- (void) chargeStudent: (studentAccounts*) chosenStudent;

- (IBAction)scanCard:(id)sender;

- (UITextField*) whichStudentField;

- (NSString *)whichMeal;

@end
