//
//  studentAccounts.h
//  Store Test
//
//  Created by Hill Balliet on 12/25/12.
//  Copyright (c) 2012 Hill Balliet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface studentAccounts : NSObject{
    
    NSMutableArray *itemsInTransactions;
    NSMutableArray *pricesInTransactions;
    
    float currentBalance;
    float totalSpent;
    float totalDeposited;
    
    NSString *shirtSize;
}

@property int graduatingYear;
@property NSString *name;
@property NSNumber *idNumber;

- (float) totalSpent;
- (float) totalDeposited;
- (float) currentBalance;

- (void) spendMoney: (int) amountSpent;
- (void) depositMoney: (int) amountDeposited: (NSString*) itemPurchased;

- (id) initWithInformation: (int) newGraduatingYear: (NSNumber*) newIdNumber: (NSString*) newName;
@end
