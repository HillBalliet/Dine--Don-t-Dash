//
//  billHomeAccountHistoryViewController.m
//  Store Test
//
//  Created by Hill Balliet on 12/31/12.
//  Copyright (c) 2012 Hill Balliet. All rights reserved.
//

#import "billHomeAccountHistoryViewController.h"
#import "MasterViewController.h"
#import "storeTableViewController.h"
#import "tabBarAccountController.h"
#import "historyHeaderCell.h"

@interface billHomeAccountHistoryViewController ()

@end

@implementation billHomeAccountHistoryViewController

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
    id holder = self.tabBarController;
    
    [self studentWasSelected:[holder selectedStudent]];
    
    billHomeAccountHistoryTableView.dataSource = self;
    billHomeAccountHistoryTableView.delegate = self;
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    billHomeAccountHistoryTableView.scrollEnabled = YES;
    UIImage *originalImage = [UIImage imageNamed:@"Carbon Fiber Background.png"];
    // scaling set to 2.0 makes the image 1/2 the size.
    UIImage *scaledImage =[UIImage imageWithCGImage:[originalImage CGImage]scale:originalImage.size.height/self.view.bounds.size.width orientation:UIImageOrientationUp];
    
    [[self.view.subviews objectAtIndex:1] setBackgroundColor:[UIColor clearColor]];
    [[self.view.subviews objectAtIndex:0] setBackgroundColor:[UIColor clearColor]];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:scaledImage]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return 1;
    }
    else if(section == 1){
        return numTransactions;
    }
    else{
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 249;
    }
    else
        return 42;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        historyHeaderCell *accountHistoryCell = [tableView dequeueReusableCellWithIdentifier:@"accountHistoryHeaderCell" forIndexPath:indexPath];
        if (!loadedStudent) {
            loadedStudent = [[studentAccounts alloc] initWithInformation:0 newIdNumber:0 newName:@"Student Information" newStatus:@"D"];
        }
        [accountHistoryCell updateInformation:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpeg", loadedStudent.name]] :loadedStudent.name :loadedStudent.totalSpent :loadedStudent.totalDeposited :loadedStudent.currentBalance: YES];
        
        return accountHistoryCell;
    }
    else if (indexPath.section == 2){
        UITableViewCell *accountHistoryCell = [tableView dequeueReusableCellWithIdentifier:@"accountHistoryCell" forIndexPath:indexPath];
        
        accountHistoryCell.textLabel.text = @"Total";
        
        float totalSpent = 0;
        for (int i = 0; i < transactionCosts.count; i++) {
            totalSpent += [[transactionCosts objectAtIndex:i] floatValue];
        }
        accountHistoryCell.detailTextLabel.text = [NSString stringWithFormat:@"$%.2f", totalSpent];
        return accountHistoryCell;
    }
    else{
        UITableViewCell *accountHistoryCell = [tableView dequeueReusableCellWithIdentifier:@"accountHistoryCell" forIndexPath:indexPath];
        
        accountHistoryCell.textLabel.text = [transactions objectAtIndex:indexPath.row];
        accountHistoryCell.detailTextLabel.text = [NSString stringWithFormat:@"$%.2f", [[transactionCosts objectAtIndex:indexPath.row] floatValue]];
        return accountHistoryCell;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (void) studentWasSelected: (studentAccounts*) studentsAccount{
    
    transactionCosts = [[NSArray alloc] initWithArray:[studentsAccount pricesInBillHomeTransactions]];
    transactions = [[NSArray alloc] initWithArray:[studentsAccount itemsInBillHomeTransactions]];
    
    numTransactions = [transactions count];
    
    loadedStudent = studentsAccount;
    
    [billHomeAccountHistoryTableView reloadData];
    
}

@end
