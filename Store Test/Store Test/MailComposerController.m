//
//  MailComposerController.m
//  Store Test
//
//  Created by Hill Balliet on 1/30/13.
//  Copyright (c) 2013 Hill Balliet. All rights reserved.
//

#import "MailComposerController.h"

@interface MailComposerController ()

@end

@implementation MailComposerController


- (NSString *)getDocumentDirectory{
    fileManager = [NSFileManager defaultManager];
    homeDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    
    return homeDirectory;
}

- (void)viewDidLoad{
    [self showPicker];
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
    NSData *myData = [NSData dataWithContentsOfFile:[self getDocumentDirectory]];
	[picker addAttachmentData:myData mimeType:@"application/x-directory" fileName:@"Documents"];
	
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
	NSString *body = @"&body=This is the file for Ramsey Rossmann.";
	
	NSString *email = [NSString stringWithFormat:@"%@%@", recipients, body];
	email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    [self dismissModalViewControllerAnimated:YES];
}

@end
