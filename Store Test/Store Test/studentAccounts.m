//
//  studentAccounts.m
//  Store Test
//
//  Created by Hill Balliet on 12/25/12.
//  Copyright (c) 2012 Hill Balliet. All rights reserved.
//

#import "studentAccounts.h"

@implementation studentAccounts

@synthesize name;
@synthesize idNumber;
@synthesize graduatingYear;

- (id) initWithInformation: (int) newGraduatingYear: (NSNumber*) newIdNumber: (NSString*) newName{
    
    self = [super init];
    
    if (self != nil){
        name = newName;
        idNumber = newIdNumber;
        graduatingYear = newGraduatingYear;
        
        totalDeposited = 0;
        totalSpent = 0;
        currentBalance = 0;
    }
    return self;
}

#pragma mark -
#pragma mark Getters
- (float) totalSpent{
    return totalSpent;
}

- (float) totalDeposited{
    return totalDeposited;
}

- (float) currentBalance{
    return currentBalance;
}

#pragma mark -
#pragma mark Currency Manipulators

- (void) spendMoney: (int) amountSpent: (NSString*) itemPurchased{
    
    NSNumber *objectAmountSpent = [[NSNumber alloc] initWithInt:amountSpent];
    
    totalSpent += amountSpent;
    currentBalance -= amountSpent;
    
    if (!itemsInTransactions) {
        itemsInTransactions = [[NSMutableArray alloc] initWithObjects:itemPurchased, nil];
    }
    else{
        [itemsInTransactions addObject:itemPurchased];
    }
    
    if (!pricesInTransactions) {
        pricesInTransactions = [[NSMutableArray alloc] initWithObjects:objectAmountSpent, nil];
    }
    else{
        [pricesInTransactions addObject:objectAmountSpent];
    }
}

- (void) depositMoney: (int) amountDeposited{
    totalDeposited += amountDeposited;
    currentBalance += amountDeposited;
}

@end
