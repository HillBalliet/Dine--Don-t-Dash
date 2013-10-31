//
//  DiningHallViewController.h
//  Store Test
//
//  Created by Hill Balliet on 1/16/13.
//  Copyright (c) 2013 Hill Balliet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "studentAccounts.h"
#import "DiningHallCell.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@class DiningHallCell;

@interface DiningHallViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate>{
    IBOutlet UITableView *diningHallTableView;
    IBOutlet UITableView *diningHallHeaderView;
    
    DiningHallCell *mainCell;
    DiningHallCell *cell;
        
    NSFileManager *fileManager;
    
    NSString *homeDirectory;
}

@property NSMutableArray *studentsWhoAte;

- (UITableView*) diningHallTableView;

-(DiningHallCell *)cell;

-(void)showPicker;
-(void)displayComposerSheet;
-(void)launchMailAppOnDevice;

@end
