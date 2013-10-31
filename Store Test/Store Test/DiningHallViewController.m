//
//  DiningHallViewController.m
//  Store Test
//
//  Created by Hill Balliet on 1/16/13.
//  Copyright (c) 2013 Hill Balliet. All rights reserved.
//

#import "DiningHallViewController.h"
#import "DiningHallCell.h"

@interface DiningHallViewController ()

@end

@implementation DiningHallViewController

@synthesize studentsWhoAte;

- (UITableView*) diningHallTableView{
    return diningHallTableView;
}

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
    
    diningHallHeaderView.delegate = self;
    diningHallHeaderView.dataSource = self;
    
    diningHallTableView.delegate = self;
    diningHallTableView.dataSource = self;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIImage *originalImage = [UIImage imageNamed:@"Carbon Fiber Background.png"];
    // scaling set to 2.0 makes the image 1/2 the size.
    UIImage *scaledImage =[UIImage imageWithCGImage:[originalImage CGImage]scale:originalImage.size.height/self.view.bounds.size.height orientation:UIImageOrientationUp];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:scaledImage]];
    //    [self displayComposerSheet];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == diningHallTableView) {
        if (!studentsWhoAte) {
            studentsWhoAte = [[NSMutableArray alloc] init];
        }
        return studentsWhoAte.count;
    }
    else{
        return 1;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == diningHallTableView) {
        mainCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        
        mainCell.textLabel.text = [[studentsWhoAte objectAtIndex:indexPath.row] name];
        mainCell.detailTextLabel.text = costOfMeal;
        
        return mainCell;
    }
    else{
        DiningHallCell *cell = [tableView dequeueReusableCellWithIdentifier:@"headerCell"];
        
        [[cell whichStudentField] becomeFirstResponder];
        
        [cell startTimer: self];
        costOfMeal = [cell costOfMeal];
        
        return cell;
    }
}

- (NSString *)getDocumentDirectory{
    fileManager = [NSFileManager defaultManager];
    homeDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    
    return homeDirectory;
}

-(void)showPicker
{
	// This sample can run on devices running iPhone OS 2.0 or later
	// The MFMailComposeViewController class is only available in iPhone OS 3.0 or later.
	// So, we must verify the existence of the above class and provide a workaround for devices running
	// earlier versions of the iPhone OS.
	// We display an email composition interface if MFMailComposeViewController exists and the device can send emails.
	// We launch the Mail application on the device, otherwise.
	
	Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
	if (mailClass != nil)
	{
		// We must always check whether the current device is configured for sending emails
		if ([mailClass canSendMail])
		{
			[self displayComposerSheet];
		}
		else
		{
			[self launchMailAppOnDevice];
		}
	}
	else
	{
		[self launchMailAppOnDevice];
	}
}


#pragma mark -
#pragma mark Compose Mail

// Displays an email composition interface inside the application. Populates all the Mail fields.
-(void)displayComposerSheet
{
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;
	
	[picker setSubject:@"Dining Hall Meals"];
	
    
	// Set up recipients
	NSArray *toRecipients = [NSArray arrayWithObject:@"wballiet@indiansprings.org"];
	
	[picker setToRecipients:toRecipients];
	
	// Attach an image to the email
    NSData *myData = [NSData dataWithContentsOfFile:[[self getDocumentDirectory] stringByAppendingPathComponent:@"Master File"]];
    NSData *detailData = [NSData dataWithContentsOfFile:[[self getDocumentDirectory] stringByAppendingPathComponent:@"Detail File"]];
        
    studentAccountsFile *readwrite = [[studentAccountsFile alloc] init];
    
    [readwrite recordMasterFile];
    
    [picker addAttachmentData:myData mimeType:@"text/plain" fileName:@"Quick View"];
    [picker addAttachmentData:detailData mimeType:@"text/plain" fileName:@"Detailed View"];
	
	// Fill out the email body text
	NSString *emailBody = @"This is the file for Ramsey Rossmann.";
	[picker setMessageBody:emailBody isHTML:NO];
	
	[self presentModalViewController:picker animated:YES];
}

#pragma mark -
#pragma mark Workaround

// Launches the Mail application on the device.
-(void)launchMailAppOnDevice
{
	NSString *recipients = @"mailto:wballiet@indiansprings.org?&subject=Dining Hall Meals";
	NSString *body = @"&body=These are the files for the dining hall meals students stuff things.";
	
	NSString *email = [NSString stringWithFormat:@"%@%@", recipients, body];
	email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    [mainCell whichStudentField];
    [self dismissModalViewControllerAnimated:YES];
}
@end
