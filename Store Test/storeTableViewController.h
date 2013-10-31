//
//  storeTableViewController.h
//  Store Test
//
//  Created by Hill Balliet on 12/26/12.
//  Copyright (c) 2012 Hill Balliet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "registerViewController.h"
#import "studentAccounts.h"

@interface storeTableViewController : UITableViewController{
    IBOutlet UIButton *accountHistories;
    IBOutlet UIButton *purchaseButton;
    
    IBOutlet UIImageView *studentPicture;
    
    IBOutlet UITextField *studentIDField;
    
    IBOutlet UILabel *totalSpentLabel;
    IBOutlet UILabel *totalDepositedLabel;
    IBOutlet UILabel *currentBalanceLabel;
    IBOutlet UILabel *studentNameLabel;
    IBOutlet UILabel *firstSectionHeader;
    IBOutlet UILabel *secondSectionHeader;
        
    BOOL accountLoaded;
    BOOL cellLoaded;
    
    NSIndexPath *prototypeIndex;
    
    NSMutableArray *itemsInCurrentPurchase;
    NSMutableArray *pricesInCurrentPurchase;
    
    studentAccounts *loadedStudent;
    
    float totalPrice;
}

- (IBAction)purchaseButton:(id)sender;
- (IBAction)studentIDField:(id)sender;

- (void) fakeRotateScreen;

- (void) addItemsToCurrentPurchase: (NSString *) itemName: (NSNumber*) itemPrice;

@end
