//
//  SecondRegisterViewController.h
//  Store Test
//
//  Created by Hill Balliet on 5/17/13.
//  Copyright (c) 2013 Hill Balliet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondRegisterViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>{
    IBOutlet UIBarButtonItem *nilButton;
    IBOutlet UICollectionView *registerView;
    
    NSArray *foodItems;
    NSArray *drinkItems;
    NSArray *miscellaneousItems;
    
    NSMutableArray *itemPrices;
    NSMutableArray *stockNumbers;
}
- (IBAction)addToCurrentPurchase:(id)sender;
@end
