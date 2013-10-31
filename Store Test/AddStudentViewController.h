//
//  AddStudentViewController.h
//  Store Test
//
//  Created by Hill Balliet on 6/21/13.
//  Copyright (c) 2013 Hill Balliet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "studentAccountsFile.h"
#import "studentAccounts.h"
#import "confirmIdentity.h"

@interface AddStudentViewController : UIViewController{
    NSString *studentsStatus;
}
- (IBAction)addStudent:(id)sender;
- (IBAction)accountTypeChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *idField;
@property (weak, nonatomic) IBOutlet UITextField *yearField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *accountTypeSelector;
@property (weak, nonatomic) IBOutlet UILabel *idLabel;

@end
