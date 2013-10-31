//
//  storeStockKeeper.m
//  Store Test
//
//  Created by Hill Balliet on 12/30/12.
//  Copyright (c) 2012 Hill Balliet. All rights reserved.
//

#import "storeStockKeeper.h"

@implementation storeStockKeeper

- (void) increaseStock: (NSString*) category: (NSString*) itemName: (int) amountAdded{
    if ([category isEqualToString:@"food"]) {
        for (int i = 0; i < [foodItems count]; i++) {
            if ([[foodItems objectAtIndex:i] isEqualToString:itemName]) {
                NSNumber *total = [NSNumber numberWithInt: amountAdded + (int)[foodStock objectAtIndex:i]];
                [foodStock removeObjectAtIndex:i];
                [foodStock insertObject:total atIndex:i];
            }
        }
    }
    else if ([category isEqualToString:@"drink"]) {
        for (int i = 0; i < [drinkItems count]; i++) {
            if ([[drinkItems objectAtIndex:i] isEqualToString:itemName]) {
                NSNumber *total = [NSNumber numberWithInt: amountAdded + (int)[drinkStock objectAtIndex:i]];
                [drinkStock removeObjectAtIndex:i];
                [drinkStock insertObject:total atIndex:i];
            }
        }
    }
    else if ([category isEqualToString:@"miscellaneous"]) {
        for (int i = 0; i < [miscellaneousItems count]; i++) {
            if ([[miscellaneousItems objectAtIndex:i] isEqualToString:itemName]) {
                NSNumber *total = [NSNumber numberWithInt: amountAdded + (int)[miscellaneousStock objectAtIndex:i]];
                [miscellaneousStock removeObjectAtIndex:i];
                [miscellaneousStock insertObject:total atIndex:i];
            }
        }
    }
}


@end
