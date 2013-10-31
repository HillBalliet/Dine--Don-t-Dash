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
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
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
    
    //for testing purposes only sets it specifically to be PM
    timePart = @"1:00 PM";
    
    //    if([weekDay characterAtIndex:0] == 'S'){
    //
    //    }
    if ([timePart characterAtIndex:1] == ':') {
        if ([timePart characterAtIndex:timePart.length - 2] == 'A') {
            mealLabel.text = @"Breakfast";
            
            costOfMeal = @"$4.00";
            nameOfMeal = @"Breakfast";
            dateOfMeal = datePart;
            [priceLabel setText:@"$4.00"];
            
            int numSeconds = (54 - (int)[timePart characterAtIndex:0] + 12) * 3600;
            numSeconds += (96 - (int)[timePart characterAtIndex:2] - (int)[timePart characterAtIndex:3]) * 60;
            
            mealTimer = [NSTimer scheduledTimerWithTimeInterval:numSeconds target:self selector:@selector(iFired) userInfo:nil repeats:NO];
        }
        else if ([timePart characterAtIndex:timePart.length - 2] == 'P') {
            mealLabel.text = @"Dinner";
            
            costOfMeal = @"$6.00";
            nameOfMeal = @"Dinner";
            dateOfMeal = datePart;
            [priceLabel setText:@"$6.00"];
            
            int numSeconds = (54 - (int)[timePart characterAtIndex:0] + 12) * 3600;
            numSeconds += (96 - (int)[timePart characterAtIndex:2] - (int)[timePart characterAtIndex:3]) * 60;
            
            mealTimer = [NSTimer scheduledTimerWithTimeInterval:numSeconds target:self selector:@selector(iFired) userInfo:nil repeats:NO];
        }
        
    }
    else{
        [priceLabel setText:@"N/A"];
        [mealLabel setText:@"Lunch"];
        
        costOfMeal = @"Lunch";
        nameOfMeal = @"Lunch";
        dateOfMeal = @"Lunch";
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
        
        if ([[whichStudentField text] length] == 20) {
            if ([[whichStudentField text] isEqualToString:@"Jessie is so hottttt"]) {
                [whichStudentField setText:@""];
                
                [[(UITabBarController*)[[[[diningViewController splitViewController] viewControllers] objectAtIndex:1] topViewController] selectedViewController] performSegueWithIdentifier:@"jessieSegue" sender:self];
            }
        }
        
        for (int i = 0; i < allStudents.count; i++) {
            
            if ([[NSString stringWithFormat:@"D%@ %@", ((studentAccounts*)[allStudents objectAtIndex:i]).idNumber, [((studentAccounts*)[allStudents objectAtIndex: i]) lastName]] isEqualToString:[whichStudentField text]] && ![costOfMeal isEqualToString:@"Lunch"]) {
                
                studentAccounts *chosenStudent = [allStudents objectAtIndex:i];
                
                [whichStudentField setText:@""];
                
                [self setHighlighted:YES animated:YES];
                
                NSIndexPath *indexPath;
                indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
                
                [diningViewController.studentsWhoAte insertObject:chosenStudent atIndex:0];
                
                [[diningViewController diningHallTableView] insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                                
                [chosenStudent billHome: costOfMeal : dateOfMeal : nameOfMeal];
                
                [self setHighlighted:NO animated:YES];
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

@end
