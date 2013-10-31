//
//  studentAccounts.h
//  Store Test
//
//  Created by Hill Balliet on 12/25/12.
//  Copyright (c) 2012 Hill Balliet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface studentAccounts : NSObject{
    
    NSMutableArray *itemsInStoreTransactions;
    NSMutableArray *pricesInStoreTransactions;
    
    NSMutableArray *itemsInBillHomeTransactions;
    NSMutableArray *pricesInBillHomeTransactions;
    NSMutableArray *datesOfBillHomeTransactions;
    
    NSMutableArray *allStudents;
    
    NSMutableArray *billHomeTransactions;
    
    float currentBalance;
    float totalSpent;
    float totalDeposited;
    
    NSString *shirtSize;
    NSString *lastName;
}

@property NSString *graduatingYear;
@property NSString *name;
@property NSString *idNumber;
@property NSString *status;

- (NSString *)lastName;

- (float) totalSpent;
- (float) totalDeposited;
- (float) currentBalance;

- (void) spendMoney: (float) amountSpent: (NSString*) itemPurchased: (BOOL) billedHome;
- (void) depositMoney: (int) amountDeposited;

- (NSArray*) itemsInStoreTransactions;
- (NSArray*) itemsInBillHomeTransactions;
- (NSArray*) pricesInStoreTransactions;
- (NSArray*) pricesInBillHomeTransactions;

- (void) billHome: (NSString*) amountSpent: (NSString*) datePurchased: (NSString*) itemPurchased;

- (id) initWithInformation: (NSString *)newGraduatingYear newIdNumber: (NSNumber*)newIdNumber newName: (NSString*)newName newStatus: (NSString *)newStatus;
@end
