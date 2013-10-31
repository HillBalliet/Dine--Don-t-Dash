//
//  registerViewController.m
//  Store Test
//
//  Created by Hill Balliet on 12/27/12.
//  Copyright (c) 2012 Hill Balliet. All rights reserved.
//

#import "registerViewController.h"
#import "storeTableViewController.h"

@interface registerViewController ()

@end

@implementation registerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    foodItems = [[NSArray alloc] initWithObjects:@"Champagne", @"Coca-Cola", @"Sprite", @"Diet Coke", @"Mexican Coke", @"Kool-Aid", @"Coffee", @"Milk", @"Root Beer",@"Kit Kat", @"Clementines", @"Chocolate", @"Pizza", @"Creme Brulee", @"Caviar", @"Sushi", @"Pate", @"Pastries", @"Bagels", @"Doughnuts", nil];
    stockNumbers = [[NSMutableArray alloc] initWithArray:@[@69, @54, @39, @43, @21, @30, @27, @11, @45, @35, @22, @36, @10, @3, @5, @8, @2, @23, @32, @47]];
    itemPrices = [[NSMutableArray alloc] initWithArray:@[@12.00, @0.50, @0.50, @0.50, @0.70, @0.40, @0.50, @0.40, @0.50, @0.60f, @0.40f, @0.60f, @1.20f, @1.50f, @3.90f, @2.70f, @2.30f, @1.20f, @1.00f]];
        
    registerView.dataSource = self;
    registerView.delegate = self;
    
    [registerView reloadData];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    nilButton = nil;
    
    [self.navigationItem setLeftBarButtonItem:nilButton];
    
    UIImage *originalImage = [UIImage imageNamed:@"Carbon Fiber Background.png"];
    // scaling set to 2.0 makes the image 1/2 the size.
    UIImage *scaledImage =[UIImage imageWithCGImage:[originalImage CGImage]scale:originalImage.size.height/self.view.bounds.size.width orientation:UIImageOrientationUp];
    
//    [[self.view.subviews objectAtIndex:1] setBackgroundColor:[UIColor clearColor]];
    [[self.view.subviews objectAtIndex:0] setBackgroundColor:[UIColor clearColor]];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:scaledImage]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [foodItems count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *registerCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"registerCell" forIndexPath:indexPath];
    
    [[[[registerCell.subviews objectAtIndex:0] subviews] objectAtIndex:0] setTitle: [foodItems objectAtIndex:indexPath.row] forState: UIControlStateNormal];
    
    [[[[registerCell.subviews objectAtIndex:0] subviews] objectAtIndex:1] setText:[NSString stringWithFormat:@"%@", [stockNumbers objectAtIndex:indexPath.row]]];
    
    return registerCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    int holdStockNumber = [[stockNumbers objectAtIndex:indexPath.row] intValue];
    holdStockNumber--;
    if (holdStockNumber >= 0) {
        [stockNumbers removeObjectAtIndex:indexPath.row];
        [stockNumbers insertObject:[NSNumber numberWithInt:holdStockNumber] atIndex:indexPath.row];
        
        [registerView reloadData];
        
        id holder = [[self.splitViewController.viewControllers objectAtIndex:0] topViewController];
        
        [holder addItemsToCurrentPurchase:[foodItems objectAtIndex:indexPath.row] :[itemPrices objectAtIndex:indexPath.row]];
    }
}

- (IBAction)pageOver:(UIPageControl *)sender {
}

- (IBAction)addToCurrentPurchase:(id)sender{
}

@end
