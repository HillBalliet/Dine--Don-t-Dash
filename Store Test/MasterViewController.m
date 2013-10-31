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
    if (!certainGradeStudents) {
        certainGradeStudents = [[NSMutableArray alloc] init];
    }
    
    [self insertNewObject:self];
    
    self.splitViewController.presentsWithGesture = NO;
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
        NSDate *date = [[NSDate alloc] init];
        
        NSString* longDate = [NSDateFormatter localizedStringFromDate: date dateStyle: NSDateFormatterLongStyle timeStyle: NSDateFormatterNoStyle];
        
        NSMutableString* month = [NSMutableString string];
        NSMutableString* year = [NSMutableString string];
        
        int gradYear = 0;
        
        for (int i = 0; i < longDate.length; i++) {
            if ([longDate characterAtIndex:i] == ' ') {
                i = longDate.length;
            }
            else
                [month appendFormat:@"%c", [longDate characterAtIndex:i]];
        }
        
        int x = 0;
        
        for (int i = 3; i < longDate.length; i++) {
            if ([longDate characterAtIndex:i] == ' ') {
                x++;
            }
            else if(x == 2)
                [year appendFormat:@"%c", [longDate characterAtIndex:i]];
        }
        
        NSDateFormatter* theDateFormatter = [[NSDateFormatter alloc] init];
        [theDateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
        [theDateFormatter setDateFormat:@"EEEE"];
        if (![self.title isEqualToString:@"69"]) {
            for (int i = 0; i < [students count]; i++) {
                if ([month isEqualToString:@"July"] || [month isEqualToString:@"August"] || [month isEqualToString:@"September"] || [month isEqualToString:@"October"] || [month isEqualToString:@"November"] || [month isEqualToString:@"December"]) {
                    
                    gradYear = [year intValue] + 1;
                    
                    
                }
                if ([self.title intValue] + gradYear == [[[students objectAtIndex:i] graduatingYear] intValue]) {
                    [certainGradeStudents insertObject:[students objectAtIndex:i] atIndex:0];
                    [_objects insertObject:[[students objectAtIndex:i] name] atIndex:0];
                    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
                    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                }
                
            }
            
        }
        else{
            for (int i = 0; i < [students count]; i++) {
                if ([self.title intValue] == [[[students objectAtIndex:i] graduatingYear] intValue]) {
                    [certainGradeStudents insertObject:[students objectAtIndex:i] atIndex:0];
                    [_objects insertObject:[[students objectAtIndex:i] name] atIndex:0];
                    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
                    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                }
                
            }
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    
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
    id holder = [[self.splitViewController.viewControllers objectAtIndex:1] topViewController];
    id holderSecond = [holder selectedViewController];
    
    if (![[[holderSecond cell] whichMeal] isEqualToString:@"Lunch"]) {
        if ([[NSString stringWithFormat:@"%@", [[[self.splitViewController.viewControllers objectAtIndex:1] topViewController] class]] isEqualToString:@"tabBarAccountController"]) {
            if (indexPath.row == 2) {
                id holder = [[self.splitViewController.viewControllers objectAtIndex:1] topViewController];
                
                [holder setSelectedStudent: ramsey];
            }
        }
        
        else if ([[NSString stringWithFormat:@"%@", [[[self.splitViewController.viewControllers objectAtIndex:1] topViewController] class]] isEqualToString:@"billHomeTabBarController"]){
            
            id holder = [[self.splitViewController.viewControllers objectAtIndex:1] topViewController];
            
            id secondHolder = [holder selectedViewController];
            
            confirmIdentity *confirm = [[confirmIdentity alloc] initWithStudent:@"Confirm" message:[NSString stringWithFormat:@"You have chosen %@, is that correct?", [[certainGradeStudents objectAtIndex:indexPath.row] name]] delegate:self cancelButtonTitle:@"No" chosenStudent:[certainGradeStudents  objectAtIndex:indexPath.row] textFieldCell:[secondHolder cell] otherButtonTitles:@"Yes", nil];
            
            confirm.delegate = [holderSecond cell];
            
            [confirm show];
        }
    }
    
    else{
        if ([[NSString stringWithFormat:@"%@", [[[self.splitViewController.viewControllers objectAtIndex:1] topViewController] class]] isEqualToString:@"tabBarAccountController"]) {
            if (indexPath.row == 2) {
                id holder = [[self.splitViewController.viewControllers objectAtIndex:1] topViewController];
                
                [holder setSelectedStudent: ramsey];
            }
        }
        
        else if ([[NSString stringWithFormat:@"%@", [[[self.splitViewController.viewControllers objectAtIndex:1] topViewController] class]] isEqualToString:@"billHomeTabBarController"]){
            
            id holder = [[self.splitViewController.viewControllers objectAtIndex:1] topViewController];
            
            id secondHolder = [holder selectedViewController];
            
            confirmIdentity *confirm = [[confirmIdentity alloc] initWithStudent:@"Congradulations!" message:@"You have already paid for lunch." delegate:self cancelButtonTitle:@"OK" chosenStudent:[certainGradeStudents objectAtIndex:indexPath.row] textFieldCell:[secondHolder cell] otherButtonTitles: nil];
            
            confirm.delegate = [holderSecond cell];
            
            [confirm show];
        }
        
    }
        
    [[[holderSecond cell] whichStudentField] becomeFirstResponder];
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

- (void)viewDidUnload {
    [super viewDidUnload];
}
@end
