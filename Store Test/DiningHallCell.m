//
//  DiningHallCell.m
//  Store Test
//
//  Created by Hill Balliet on 1/16/13.
//  Copyright (c) 2013 Hill Balliet. All rights reserved.
//

#import "DiningHallCell.h"
#import "DiningHallViewController.h"
#import "studentAccounts.h"
#import "studentAccountsFile.h"
#import "MailComposerController.h"

@implementation DiningHallCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        x = 0;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)restartTimer{
    [self startTimer:diningViewController];
}

- (void)startTimer: (DiningHallViewController*) viewController{
    
    diningViewController = viewController;
    
    NSDate *time = [[NSDate alloc] init];
    
    NSString* timePart = [NSDateFormatter localizedStringFromDate: time dateStyle: NSDateFormatterNoStyle timeStyle: NSDateFormatterShortStyle];
    
    NSString* datePart = [NSDateFormatter localizedStringFromDate: time dateStyle: NSDateFormatterShortStyle timeStyle: NSDateFormatterNoStyle];
    
    NSDateFormatter* theDateFormatter = [[NSDateFormatter alloc] init];
    [theDateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [theDateFormatter setDateFormat:@"EEEE"];
    NSString *weekDay =  [theDateFormatter stringFromDate:[NSDate date]];
    
    NSLog(@"%c", [timePart characterAtIndex:timePart.length - 2]);
    
    if([weekDay characterAtIndex:0] == 'S'){
        if ([timePart characterAtIndex:1] == ':') {
            if ([timePart characterAtIndex:timePart.length - 2] == 'A') {
                mealLabel.text = @"Brunch";
                
                costOfMeal = @"$5.00";
                nameOfMeal = @"Brunch";
                dateOfMeal = datePart;
                [priceLabel setText:@"$5.00"];
                
                int numSeconds = (9 - [[[NSString alloc] initWithFormat:@"%c", [timePart characterAtIndex:0]] intValue]) * 3600;
                numSeconds += (60 - [[[NSString alloc] initWithFormat:@"%c%c", [timePart characterAtIndex:2], [timePart characterAtIndex:3]] intValue]) * 60;
                
                mealTimer = [NSTimer scheduledTimerWithTimeInterval:numSeconds target:self selector:@selector(iFired) userInfo:nil repeats:NO];
            }
            else if ([timePart characterAtIndex:timePart.length - 2] == 'P') {
                mealLabel.text = @"Dinner";
                
                costOfMeal = @"$6.00";
                nameOfMeal = @"Dinner";
                dateOfMeal = datePart;
                [priceLabel setText:@"$6.00"];
                
                int numSeconds = (9 - [[[NSString alloc] initWithFormat:@"%c", [timePart characterAtIndex:0]] intValue]) * 3600;
                numSeconds += (60 - [[[NSString alloc] initWithFormat:@"%c%c", [timePart characterAtIndex:2], [timePart characterAtIndex:3]] intValue]) * 60;
                
                mealTimer = [NSTimer scheduledTimerWithTimeInterval:numSeconds target:self selector:@selector(iFired) userInfo:nil repeats:NO];
            }
            
        }
        else{
            [priceLabel setText:@"$5.00"];
            [mealLabel setText:@"Brunch"];
            
            costOfMeal = @"$5.00";
            nameOfMeal = @"Brunch";
            dateOfMeal = datePart;
            
            int numSeconds = (12 - [[[NSString alloc] initWithFormat:@"%c%c", [timePart characterAtIndex:0], [timePart characterAtIndex:1]] intValue]) * 3600;
            numSeconds += (60 - [[[NSString alloc] initWithFormat:@"%c%c", [timePart characterAtIndex:3], [timePart characterAtIndex:4]] intValue]) * 60;
            
            
            mealTimer = [NSTimer scheduledTimerWithTimeInterval:numSeconds target:self selector:@selector(iFired) userInfo:nil repeats:NO];
        }
    }
    else{
        if ([timePart characterAtIndex:1] == ':') {
            if ([timePart characterAtIndex:timePart.length - 2] == 'A') {
                mealLabel.text = @"Breakfast";
                
                costOfMeal = @"$4.00";
                nameOfMeal = @"Breakfast";
                dateOfMeal = datePart;
                [priceLabel setText:@"$4.00"];
                
                int numSeconds = (9 - [[[NSString alloc] initWithFormat:@"%c", [timePart characterAtIndex:0]] intValue]) * 3600;
                numSeconds += (60 - [[[NSString alloc] initWithFormat:@"%c%c", [timePart characterAtIndex:2], [timePart characterAtIndex:3]] intValue]) * 60;
                
                mealTimer = [NSTimer scheduledTimerWithTimeInterval:numSeconds target:self selector:@selector(iFired) userInfo:nil repeats:NO];
            }
            else if ([timePart characterAtIndex:timePart.length - 2] == 'P') {
                mealLabel.text = @"Dinner";
                
                costOfMeal = @"$6.00";
                nameOfMeal = @"Dinner";
                dateOfMeal = datePart;
                [priceLabel setText:@"$6.00"];
                
                int numSeconds = (9 - [[[NSString alloc] initWithFormat:@"%c", [timePart characterAtIndex:0]] intValue]) * 3600;
                numSeconds += (60 - [[[NSString alloc] initWithFormat:@"%c%c", [timePart characterAtIndex:2], [timePart characterAtIndex:3]] intValue]) * 60;
                
                mealTimer = [NSTimer scheduledTimerWithTimeInterval:numSeconds target:self selector:@selector(iFired) userInfo:nil repeats:NO];
            }
            
        }
        else{
            [priceLabel setText:@"N/A"];
            [mealLabel setText:@"Lunch"];
            
            costOfMeal = @"Lunch";
            nameOfMeal = @"Lunch";
            dateOfMeal = @"Lunch";
            
            int numSeconds = (12 - [[[NSString alloc] initWithFormat:@"%c%c", [timePart characterAtIndex:0], [timePart characterAtIndex:1]] intValue]) * 3600;
            numSeconds += (60 - [[[NSString alloc] initWithFormat:@"%c%c", [timePart characterAtIndex:3], [timePart characterAtIndex:4]] intValue]) * 60;
            
            NSLog(@"%i", numSeconds);
            
            mealTimer = [NSTimer scheduledTimerWithTimeInterval:numSeconds target:self selector:@selector(iFired) userInfo:nil repeats:NO];
        }
    }
}

- (void) iFired{
    [diningViewController.studentsWhoAte removeAllObjects];
    
    [[diningViewController diningHallTableView] reloadData];
    [self startTimer: diningViewController];
}

- (IBAction)scanCard:(id)sender{
    if (!readWrite) {
        readWrite = [[studentAccountsFile alloc] init];
    }
    
    NSMutableArray *allStudents;
    
    if (!allStudents) {
        allStudents = [readWrite allStudents];
    }
    
    
    if ([[whichStudentField text] length] > 5) {
        
        NSMutableString *holder;
        
        if ([[whichStudentField text] characterAtIndex:2] == '0') {
            holder = [[NSMutableString alloc] initWithString:whichStudentField.text];
            [holder deleteCharactersInRange: NSMakeRange(2, 3)];
            [whichStudentField setText:holder];
        }
        
        if ([[whichStudentField text] length] == 20) {
            if ([[whichStudentField text] isEqualToString:@"Jessie is so hottttt"]) {
                [whichStudentField setText:@""];
                
                [[(UITabBarController*)[[[[diningViewController splitViewController] viewControllers] objectAtIndex:1] topViewController] selectedViewController] performSegueWithIdentifier:@"jessieSegue" sender:self];
            }
        }
        
        for (int i = 0; i < allStudents.count; i++) {
            
            if ([[NSString stringWithFormat:@"%@ %@ %@", ((studentAccounts*)[allStudents objectAtIndex:i]).status, ((studentAccounts*)[allStudents objectAtIndex:i]).idNumber, [((studentAccounts*)[allStudents objectAtIndex: i]) lastName]] localizedCaseInsensitiveCompare:[whichStudentField text]] == NSOrderedSame && ![costOfMeal isEqualToString:@"Lunch"]) {
                
                studentAccounts *chosenStudent = [allStudents objectAtIndex:i];
                [self chargeStudent: chosenStudent];
            }
            
            else if ([[NSString stringWithFormat:@"%@ %@ %@", ((studentAccounts*)[allStudents objectAtIndex:i]).status, ((studentAccounts*)[allStudents objectAtIndex:i]).idNumber, [((studentAccounts*)[allStudents objectAtIndex: i]) lastName]] localizedCaseInsensitiveCompare:[whichStudentField text]] == NSOrderedSame){
                [whichStudentField setText:@""];
            }
        }
    }
    
}

- (UITextField *)whichStudentField{
    return whichStudentField;
}

- (NSString *)costOfMeal{
    return costOfMeal;
}

- (void) chargeStudent: (studentAccounts*) chosenStudent{
    
    [whichStudentField setText:@""];
    
    [self setHighlighted:YES animated:YES];
    
    NSIndexPath *indexPath;
    indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    [diningViewController.studentsWhoAte insertObject:chosenStudent atIndex:0];
    
    [[diningViewController diningHallTableView] insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [chosenStudent billHome: costOfMeal : dateOfMeal : nameOfMeal];
    
    [self setHighlighted:NO animated:YES];
    
    [[self whichStudentField] becomeFirstResponder];
}

- (NSString *)whichMeal{
    return [mealLabel text];
}

# pragma mark - Alert View Delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 0){
    }
    else{
        confirmIdentity *confirm = alertView;
        
        [self chargeStudent:[confirm chosenStudent]];
        
    }
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex{
}
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    
}
- (void)alertViewCancel:(UIAlertView *)alertView{
}
- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView{
    return YES;
}

@end
