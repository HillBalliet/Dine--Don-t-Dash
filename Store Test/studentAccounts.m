//
//  studentAccounts.m
//  Store Test
//
//  Created by Hill Balliet on 12/25/12.
//  Copyright (c) 2012 Hill Balliet. All rights reserved.
//

#import "studentAccounts.h"
#import "studentAccountsFile.h"

@implementation studentAccounts

@synthesize name;
@synthesize idNumber;
@synthesize graduatingYear;
@synthesize status;

- (id) initWithInformation: (NSString *)newGraduatingYear newIdNumber: (NSString*)newIdNumber newName: (NSString*)newName newStatus:(NSString *)newStatus{
    
    self = [super init];
    
    if (self != nil){
        name = newName;
        idNumber = newIdNumber;
        graduatingYear = newGraduatingYear;
        status = newStatus;
        
        totalDeposited = 0;
        totalSpent = 0;
        currentBalance = 0;
        
        BOOL record = false;
        NSMutableString *holderString = [NSMutableString string];
        
        for (int i = 0; i < [name length]; i++) {
            if (record) {
                [holderString appendFormat:@"%c", [name characterAtIndex:i]];
            }
            else if ([name characterAtIndex:i] == ' ') {
                record = true;
            }
        }
        
        lastName = holderString;
    }
    return self;
}

#pragma mark -
#pragma mark Getters
-(NSString *)lastName{
    return lastName;
}

- (NSArray*) itemsInStoreTransactions{
    return itemsInStoreTransactions;
}

- (NSArray*) itemsInBillHomeTransactions{
    return itemsInBillHomeTransactions;
}

- (NSArray*) pricesInStoreTransactions{
    return pricesInStoreTransactions;
}

- (NSArray*) pricesInBillHomeTransactions{
    return pricesInBillHomeTransactions;
}

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

- (void) billHome: (NSString*) amountSpent: (NSString*) datePurchased: (NSString*) itemPurchased{
        
    studentAccountsFile *readWrite = [[studentAccountsFile alloc] init];
    
    NSMutableArray *chargesToBill = [[NSMutableArray alloc] init];
        
    [chargesToBill addObject:@[amountSpent, datePurchased, itemPurchased]];
    
    [readWrite recordBillHomeToStudent: chargesToBill:[self name]];
}

- (void) spendMoney: (float) amountSpent: (NSString*) itemPurchased: (BOOL) billedHome{
    
    NSNumber *objectAmountSpent = [NSNumber numberWithFloat:amountSpent];
    
    totalSpent += amountSpent;
    currentBalance -= amountSpent;
    
    if (!billedHome) {
        
        if (!itemsInStoreTransactions) {
            itemsInStoreTransactions = [[NSMutableArray alloc] initWithObjects:itemPurchased, nil];
        }
        else{
            [itemsInStoreTransactions addObject:itemPurchased];
        }
        
        if (!pricesInStoreTransactions) {
            pricesInStoreTransactions = [[NSMutableArray alloc] initWithObjects:objectAmountSpent, nil];
        }
        else{
            [pricesInStoreTransactions addObject:objectAmountSpent];
        }
    }
    else{
        if (!itemsInBillHomeTransactions) {
            itemsInBillHomeTransactions = [[NSMutableArray alloc] initWithObjects:itemPurchased, nil];
        }
        else{
            [itemsInBillHomeTransactions addObject:itemPurchased];
        }
        
        if (!pricesInBillHomeTransactions) {
            pricesInBillHomeTransactions = [[NSMutableArray alloc] initWithObjects:objectAmountSpent, nil];
        }
        else{
            [pricesInBillHomeTransactions addObject:objectAmountSpent];
        }
    }
}

- (void) depositMoney: (int) amountDeposited{
    totalDeposited += amountDeposited;
    currentBalance += amountDeposited;
}

@end
