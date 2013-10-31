//
//  storeTableViewController.m
//  Store Test
//
//  Created by Hill Balliet on 12/26/12.
//  Copyright (c) 2012 Hill Balliet. All rights reserved.
//

#import "storeTableViewController.h"
#import "studentAccounts.h"
#import "MasterViewController.h"

@interface storeTableViewController ()

@end

@implementation storeTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    studentAccounts *ramsey = [[studentAccounts alloc] initWithInformation:@"2015" newIdNumber:@1111 newName:@"Ramsey Rossmann" newStatus:@"D"];
    [ramsey depositMoney:50];
    
    loadedStudent = ramsey;
    
    cellLoaded = false;
    [super viewDidLoad];
    
    accountLoaded = false;
    
    [studentIDField becomeFirstResponder];
    
    UIImage *originalImage = [UIImage imageNamed:@"Carbon Fiber Background.png"];
    // scaling set to 2.0 makes the image 1/2 the size.
    UIImage *scaledImage =[UIImage imageWithCGImage:[originalImage CGImage]scale:originalImage.size.height/self.tableView.bounds.size.width orientation:UIImageOrientationUp];
    
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    self.navigationController.view.backgroundColor = [UIColor colorWithPatternImage:scaledImage] ;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 2) {
        return (1 + itemsInCurrentPurchase.count);
    }
    else
        return 1;
}

- (void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2) {
        cell.backgroundColor = [UIColor whiteColor];
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 2){
        UITableViewCell *currentPurchaseCell = [super tableView: tableView cellForRowAtIndexPath:indexPath];
        
        currentPurchaseCell.textLabel.textColor = [UIColor whiteColor];
        
        UIImageView *backView = [[UIImageView alloc] initWithFrame:CGRectZero];
        
        
        if (indexPath.row == itemsInCurrentPurchase.count) {
            currentPurchaseCell.textLabel.text  = @"Total";
            backView.image = [UIImage imageNamed:@"total table.png"];
            
            totalPrice = 0;
            for (int i = 0; i < pricesInCurrentPurchase.count; i++) {
                totalPrice += [[pricesInCurrentPurchase objectAtIndex:i] floatValue];
            }
            [currentPurchaseCell.detailTextLabel setTextColor:[UIColor whiteColor]];
            currentPurchaseCell.detailTextLabel.text = [NSString stringWithFormat:@"$%.2f", totalPrice];
        }
        else{
            currentPurchaseCell.textLabel.text = [itemsInCurrentPurchase objectAtIndex:indexPath.row];
            
            backView.image = [UIImage imageNamed:@"total table copy.png"];
            
            NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
            [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
            
            
            if (pricesInCurrentPurchase) {
                currentPurchaseCell.detailTextLabel.text = [NSString stringWithFormat: @"%@", [formatter stringFromNumber: [pricesInCurrentPurchase objectAtIndex:indexPath.row]]];
            }
        }

        currentPurchaseCell.backgroundView = backView;

        return currentPurchaseCell;
    }
    else if (indexPath.section == 1){
        UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
        
        UIImageView *backView = [[UIImageView alloc] initWithFrame:CGRectZero];
        backView.image = [UIImage imageNamed:@"FINAL BUTTON - Big Text Box.png"];
        
        cell.backgroundView = backView;
        
        return cell;
    }
    else if (indexPath.section == 3){
        UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
        
        UIView *backView = [[UIView alloc] initWithFrame:CGRectZero];
        backView.backgroundColor = [UIColor clearColor];
        cell.backgroundView = backView;
        
        return cell;
    }
    else if (indexPath.section == 0){
        UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
        
        UIView *backView = [[UIView alloc] initWithFrame:CGRectZero];
        backView.backgroundColor = [UIColor clearColor];
        cell.backgroundView = backView;
        
        return cell;
    }
}

- (void) addItemsToCurrentPurchase: (NSString*) itemName: (NSNumber*) itemPrice{
    if (!itemsInCurrentPurchase) {
        itemsInCurrentPurchase = [[NSMutableArray alloc] init];
    }
    [itemsInCurrentPurchase insertObject:itemName atIndex:0];
    
    if (!pricesInCurrentPurchase) {
        pricesInCurrentPurchase = [[NSMutableArray alloc] init];
    }
    [pricesInCurrentPurchase insertObject:itemPrice atIndex:0];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:2];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView reloadData];
}

#pragma mark - IBActions

- (IBAction)studentIDField:(id)sender{
    accountLoaded = true;
    
    [studentIDField setUserInteractionEnabled:false];
    
    [studentPicture setImage:[UIImage imageNamed: @"Ramsey Rossmann copy.jpeg"]];
    
    [totalDepositedLabel setText:[[NSString alloc] initWithFormat:@"Deposited\t$%.2f", [loadedStudent totalDeposited]]];
    [totalSpentLabel setText:[[NSString alloc] initWithFormat:@"Spent\t\t\t\t\t\t\t\t$%.2f", [loadedStudent totalSpent]]];
    [currentBalanceLabel setText:[[NSString alloc] initWithFormat:@"Balance\t\t\t\t$%.2f", [loadedStudent currentBalance]]];
    [studentNameLabel setText:[[NSString alloc] initWithFormat:@"%@", [loadedStudent name]]];
    
    [studentIDField setText:@"D3018 Rossmann"];
}

- (IBAction)purchaseButton:(id)sender{
    BOOL failed = false;
    if (accountLoaded) {
        float doesHeHaveEnough = [loadedStudent currentBalance];
        
        for (int i = 0; i < itemsInCurrentPurchase.count; i++) {
            doesHeHaveEnough -= [[pricesInCurrentPurchase objectAtIndex:i] floatValue];
        }
        
        if (doesHeHaveEnough >= 0) {
            for (int i = 0; i < itemsInCurrentPurchase.count; i++) {
                
                [loadedStudent spendMoney:[[pricesInCurrentPurchase objectAtIndex:i] floatValue] :[itemsInCurrentPurchase objectAtIndex:i] :NO];
            }
        }
        else{
            failed = true;
        }
        if (!failed) {
            
            [studentPicture setImage:[UIImage imageNamed:@"Student Information.jpeg"]];
            
            [totalSpentLabel setText:@"Spent\t\t\t\t\t\t\t\t$0.00"];
            [totalDepositedLabel setText:@"Deposited\t$0.00"];
            [currentBalanceLabel setText:@"Balance\t\t\t\t$0.00"];
            [studentNameLabel setText:@"Student Information"];
            
            [studentIDField setText:@""];
            [studentIDField setUserInteractionEnabled:true];
        }
        
    }
    if (!failed) {
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:2];
        
        int conditional = itemsInCurrentPurchase.count;
        
        [pricesInCurrentPurchase removeAllObjects];
        pricesInCurrentPurchase = nil;
        [self.tableView reloadData];
        
        for (int i = 0; i < conditional; i++) {
            
            [itemsInCurrentPurchase removeObjectAtIndex:0];
            
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
        
        [self setFirstResponder];
    }
}

- (void) setFirstResponder{
    [studentIDField becomeFirstResponder];
}
/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView;
    if (section == 0){
        headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 0)];
        [headerView setBackgroundColor:[UIColor clearColor]];
    }
    else if (section == 1){
        headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, tableView.sectionHeaderHeight)];
        [headerView setBackgroundColor:[UIColor clearColor]];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(54, 4, tableView.bounds.size.width - 20, 22)];
        label.text = [self tableView:tableView titleForHeaderInSection:section];
        label.font = [UIFont boldSystemFontOfSize:17.0];
        label.shadowOffset = CGSizeMake(0, 1);
        label.shadowColor = [UIColor colorWithRed:0.298 - 0.1 green:0.337 - 0.1 blue:0.423 - 0.1 alpha:1.000];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor colorWithRed:0.298 + 0.3 green:0.337 + 0.3 blue:0.423 + 0.3 alpha:1.000];
        
        [headerView addSubview:label];
    }
    else if (section == 2){
        headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 0)];
        [headerView setBackgroundColor:[UIColor clearColor]];
    }
    else if (section == 3){
        headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, tableView.sectionHeaderHeight)];
        [headerView setBackgroundColor:[UIColor clearColor]];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(54, 4, tableView.bounds.size.width - 20, 22)];
        label.text = [self tableView:tableView titleForHeaderInSection:section];
        label.font = [UIFont boldSystemFontOfSize:17.0];
        label.shadowOffset = CGSizeMake(0, 1);
        label.shadowColor = [UIColor colorWithRed:0.298 - 0.1 green:0.337 - 0.1 blue:0.423 - 0.1 alpha:1.000];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor colorWithRed:0.298 + 0.3 green:0.337 + 0.3 blue:0.423 + 0.3 alpha:1.000];
        
        [headerView addSubview:label];
        
    }
    else if (section == 4){
        headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 0)];
        [headerView setBackgroundColor:[UIColor clearColor]];
    }
    return headerView;
}

- (void)fakeRotateScreen{
    [self.splitViewController willRotateToInterfaceOrientation:self.interfaceOrientation duration:0];
}

@end
