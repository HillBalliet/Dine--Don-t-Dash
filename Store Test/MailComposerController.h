//
//  MailComposerController.h
//  Store Test
//
//  Created by Hill Balliet on 1/30/13.
//  Copyright (c) 2013 Hill Balliet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface MailComposerController : UIViewController <MFMailComposeViewControllerDelegate>
{    
    NSFileManager *fileManager;
    
    NSString *homeDirectory;
}

-(void)showPicker;
-(void)displayComposerSheet;
-(void)launchMailAppOnDevice;

@end
