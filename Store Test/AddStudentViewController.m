//
//  AddStudentViewController.m
//  Store Test
//
//  Created by Hill Balliet on 6/21/13.
//  Copyright (c) 2013 Hill Balliet. All rights reserved.
//

#import "AddStudentViewController.h"

@interface AddStudentViewController ()

@end

@implementation AddStudentViewController

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

- (IBAction)addStudent:(id)sender {
    studentAccountsFile *reader = [[studentAccountsFile alloc] init];
        
    if (![self.yearField.text isEqualToString: @""] && ![self.idField.text isEqualToString:@""] && ![self.nameField.text isEqualToString:@""]) {
        
        if (!studentsStatus) {
            studentsStatus = @"D";
        }
        
        studentAccounts *newStudent = [[studentAccounts alloc] initWithInformation:self.yearField.text newIdNumber:[NSNumber numberWithInt:[self.idField.text intValue]] newName:self.nameField.text newStatus:studentsStatus];
        
        [reader addStudent:newStudent];
        
        [self.nameField setBackgroundColor:[UIColor whiteColor]];
        [self.idField setBackgroundColor:[UIColor whiteColor]];
        [self.yearField setBackgroundColor:[UIColor whiteColor]];
        
        self.idField.text = @"";
        self.nameField.text = @"";
        self.yearField.text = @"";
    }
    
    else{
        if ([self.yearField.text isEqualToString: @""]) {
            [self.yearField setBackgroundColor:[UIColor colorWithRed:255 green:0 blue:0 alpha:0.25]];
        }
        if ([self.nameField.text isEqualToString: @""]) {
            [self.nameField setBackgroundColor:[UIColor colorWithRed:255 green:0 blue:0 alpha:0.25]];
        }
        if ([self.idField.text isEqualToString: @""]) {
            [self.idField setBackgroundColor:[UIColor colorWithRed:255 green:0 blue:0 alpha:0.25]];
        }
    }
}

- (IBAction)accountTypeChanged:(id)sender {
    if (self.accountTypeSelector.selectedSegmentIndex == 2) {
        studentsStatus = @"F";
        
        [self.yearField setEnabled:false];
        [self.yearField setBorderStyle:UITextBorderStyleNone];
        [self.yearLabel setText:@""];
        
        [self.yearField setTextColor:[UIColor clearColor]];
        [self.yearField setText:@"69"];
        
        [self.idField setEnabled:false];
        [self.idField setBorderStyle:UITextBorderStyleNone];
        [self.idField setTextColor:[UIColor clearColor]];
        [self.idField setText:@"0001"];
        [self.idLabel setText:@"Faculty"];
    }
    else if ([self.idLabel.text isEqualToString:@"Faculty"]){
        if (self.accountTypeSelector.selectedSegmentIndex == 0) {
            studentsStatus = @"D";
        }
        else
            studentsStatus = @"B";
        [self.yearField setEnabled:true];
        [self.yearField setBorderStyle:UITextBorderStyleRoundedRect];
        [self.yearLabel setText:@"Class of:"];
        [self.yearField setText:@""];
        [self.yearField setTextColor:[UIColor blackColor]];
        
        [self.idField setText:@""];
        [self.idField setTextColor:[UIColor blackColor]];
        [self.idField setBorderStyle:UITextBorderStyleRoundedRect];
        [self.idField setEnabled:true];
        [self.idLabel setText:@"Student ID:"];
    }
}
- (void)viewDidUnload {
    [self setNameField:nil];
    [self setIdField:nil];
    [self setYearField:nil];
    [self setAccountTypeSelector:nil];
    [self setYearLabel:nil];
    [self setIdLabel:nil];
    [super viewDidUnload];
}
@end
