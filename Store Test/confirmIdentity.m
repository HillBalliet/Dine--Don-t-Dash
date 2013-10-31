//
//  confirmIdentity.m
//  Store Test
//
//  Created by Hill Balliet on 4/30/13.
//  Copyright (c) 2013 Hill Balliet. All rights reserved.
//

#import "confirmIdentity.h"
#import "DiningHallCell.h"


@implementation confirmIdentity

- (id)initWithStudent:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle chosenStudent:(studentAccounts *)clickedStudent textFieldCell:(UITableViewCell *)fieldCell otherButtonTitles:(NSString *)otherButtonTitles, ...{
    self = [super initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles, nil];
        if (self) {
            holder = clickedStudent;
            cellHolder = fieldCell;
            NSLog(@"%@ hi", cellHolder);
            self.delegate = self;
    }
    return self;
}

- (id)initWithTextBox:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle textBoxFiller:(NSString *)textBoxFiller otherButtonTitles:(NSString *)otherButtonTitles, ...{
    self = [super initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles, nil];
    if (self) {
    }
    return self;
}

- (studentAccounts *)chosenStudent{
    return holder;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    id dudeFace = cellHolder;
    
    NSLog(@"%@ hi", dudeFace);
    [[dudeFace whichStudentField] becomeFirstResponder];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
