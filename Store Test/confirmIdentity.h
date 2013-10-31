//
//  confirmIdentity.h
//  Store Test
//
//  Created by Hill Balliet on 4/30/13.
//  Copyright (c) 2013 Hill Balliet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "studentAccounts.h"

@interface confirmIdentity : UIAlertView <UIAlertViewDelegate>{
    studentAccounts *holder;
    UITableViewCell *cellHolder;
}

- (id)initWithStudent:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle chosenStudent:(studentAccounts *)clickedStudent textFieldCell:(UITableViewCell *)fieldCell otherButtonTitles:(NSString *)otherButtonTitles, ...;

- (studentAccounts *)chosenStudent;
@end
