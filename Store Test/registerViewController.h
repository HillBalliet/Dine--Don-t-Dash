//
//  registerViewController.h
//  Store Test
//
//  Created by Hill Balliet on 12/27/12.
//  Copyright (c) 2012 Hill Balliet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface registerViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>{
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
