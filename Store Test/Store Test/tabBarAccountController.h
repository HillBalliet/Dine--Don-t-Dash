//
//  tabBarAccountController.h
//  Store Test
//
//  Created by Hill Balliet on 1/1/13.
//  Copyright (c) 2013 Hill Balliet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "studentAccounts.h"

@interface tabBarAccountController : UITabBarController <UITabBarDelegate>{
    studentAccounts *selectedStudent;   
}

- (void) setSelectedStudent: (studentAccounts*) newSelectedStudent;

- (studentAccounts*) selectedStudent;

@end
