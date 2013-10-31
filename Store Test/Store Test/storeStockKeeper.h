//
//  storeStockKeeper.h
//  Store Test
//
//  Created by Hill Balliet on 12/30/12.
//  Copyright (c) 2012 Hill Balliet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface storeStockKeeper : NSObject{
    NSMutableArray *foodStock;
    NSMutableArray *drinkStock;
    NSMutableArray *miscellaneousStock;
    NSMutableArray *foodItems;
    NSMutableArray *drinkItems;
    NSMutableArray *miscellaneousItems;
}

@end
