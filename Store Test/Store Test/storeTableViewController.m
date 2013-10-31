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
    [super viewDidLoad];
    
    accountLoaded = false;
    [[[self.splitViewController.viewControllers objectAtIndex:0] topViewController]performSegueWithIdentifier:@"manualSegue" sender:self];
    
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

#pragma mark - IBActions

- (IBAction)studentIDField:(id)sender{
    if ([[studentIDField text] length] > 3) {
        studentAccounts *ramsey = [[studentAccounts alloc] initWithInformation:2015 : [[NSNumber alloc] initWithInt:1111] :@"Ramsey Rossmann"];
        
        if([[studentIDField text] isEqualToString:
            [[NSString alloc] initWithFormat:@"%@", [ramsey idNumber]]]){
            accountLoaded = true;
            
            [studentPicture setImage:[UIImage imageNamed: [NSString stringWithFormat:@"%@.png", [ramsey name]]]];
            
            [totalDepositedLabel setText:[[NSString alloc] initWithFormat:@"$%.2f", [ramsey totalDeposited]]];
            [totalSpentLabel setText:[[NSString alloc] initWithFormat:@"$%.2f", [ramsey totalSpent]]];
            [currentBalanceLabel setText:[[NSString alloc] initWithFormat:@"$%.2f", [ramsey currentBalance]]];
            [studentNameLabel setText:[[NSString alloc] initWithFormat:@"%@", [ramsey name]]];
        }
        
    }
}

- (IBAction)purchaseButton:(id)sender{
    if (accountLoaded) {
        [studentPicture setImage:[UIImage imageNamed:@"Generic Face.jpeg"]];
        
        [totalSpentLabel setText:@""];
        [totalDepositedLabel setText:@""];
        [currentBalanceLabel setText:@""];
        [studentNameLabel setText:@"Student Information"];
        
        [studentIDField setText:@""];
        [studentIDField becomeFirstResponder];
    }
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
        label.shadowColor = [UIColor whiteColor];
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
        label.shadowColor = [UIColor whiteColor];
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

@end
