//
//  MasterViewController.m
//  Master Detail Test
//
//  Created by Hill Balliet on 12/28/12.
//  Copyright (c) 2012 Hill Balliet. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"
#import "studentAccounts.h"
#import "accountHistoryViewController.h"
#import "tabBarAccountController.h"
#import "studentAccountsFile.h"
#import "confirmIdentity.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    shouldHideMasterViewController = true;
    
    self.splitViewController.delegate = self;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIImage *originalImage = [UIImage imageNamed:@"Carbon Fiber Background.png"];
    // scaling set to 2.0 makes the image 1/2 the size.
    UIImage *scaledImage =[UIImage imageWithCGImage:[originalImage CGImage]scale:originalImage.size.height/self.view.bounds.size.width orientation:UIImageOrientationUp];
    
    [[self.view.subviews objectAtIndex:0] setBackgroundColor:[UIColor clearColor]];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:scaledImage]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    studentAccountsFile *read = [[studentAccountsFile alloc] init];
    
    NSArray *students = [read allStudents];
    
    allTheStudents = students;
    
    students = [[students reverseObjectEnumerator] allObjects];
    
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    
    if([[NSString stringWithFormat:@"%@", [[[self.splitViewController.viewControllers objectAtIndex:1] topViewController] class]] isEqualToString:@"tabBarAccountController"] || [[NSString stringWithFormat:@"%@", [[[self.splitViewController.viewControllers objectAtIndex:1] topViewController] class]] isEqualToString:@"billHomeTabBarController"]){
        for (int i = 0; i < [students count]; i++) {
            [_objects insertObject:[[students objectAtIndex:i] name] atIndex:0];
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
            [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
    }
    else if([[NSString stringWithFormat:@"%@", [[[self.splitViewController.viewControllers objectAtIndex:1] topViewController] class]] isEqualToString:@"DetailViewController"]){
        if([_objects count] >0){
            for (int i = 0; i < [students count]; i++) {
                [_objects removeObjectAtIndex:0];
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
                [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            }
        }
    }
    else if([[NSString stringWithFormat:@"%@", [[[self.splitViewController.viewControllers objectAtIndex:1] topViewController] class]] isEqualToString:@"storeTableViewController"]){
        if([_objects count] >0){
            for (int i = 0; i < [students count]; i++) {
                [_objects removeObjectAtIndex:0];
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
                [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            }
        }
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSDate *object = _objects[indexPath.row];
    cell.textLabel.text = [object description];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

- (BOOL)splitViewController:(UISplitViewController *)svc shouldHideViewController:(UIViewController *)vc inOrientation:(UIInterfaceOrientation)orientation{
    return shouldHideMasterViewController;
}

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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[NSString stringWithFormat:@"%@", [[[self.splitViewController.viewControllers objectAtIndex:1] topViewController] class]] isEqualToString:@"tabBarAccountController"]) {
        if (indexPath.row == 2) {
            id holder = [[self.splitViewController.viewControllers objectAtIndex:1] topViewController];
            
            [holder setSelectedStudent: ramsey];
        }
    }
    
    else if ([[NSString stringWithFormat:@"%@", [[[self.splitViewController.viewControllers objectAtIndex:1] topViewController] class]] isEqualToString:@"billHomeTabBarController"]){
        confirmIdentity *confirm = [[confirmIdentity alloc] initWithTitle:@"Confirm" message:[NSString stringWithFormat:@"You have chosen %@, is that correct?", [[allTheStudents objectAtIndex:indexPath.row] name]] delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
        
        [confirm show];
        
    }
    
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
}

- (void) changeShouldHideMasterViewController{
    shouldHideMasterViewController = !shouldHideMasterViewController;
}

- (BOOL) shouldHideMasterViewController{
    return shouldHideMasterViewController;
}

- (void) setWhoseDelegate:(UITabBar *)tabBar{
    tabBar.delegate = self;
}

@end
