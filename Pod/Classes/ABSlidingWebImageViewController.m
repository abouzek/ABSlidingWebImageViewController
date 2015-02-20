//
//  ABSlidingImageViewController.m
//
//  Created by Alan Bouzek on 2/13/15.
//  Copyright (c) 2015 Alan Bouzek. All rights reserved.
//

#import "ABSlidingWebImageViewController.h"
#import "ABSlidingWebImageViewCell.h"
#import <ASMediaFocusManager.h>

@interface ABSlidingWebImageViewController () <UICollectionViewDelegate, UICollectionViewDataSource, ASMediasFocusDelegate>

@property (weak, nonatomic) id<ABSlidingWebImageViewControllerDelegate> delegate;
@property (nonatomic) BOOL showGradient;
@property (strong, nonatomic) NSArray *thumbnailImageUrls, *fullImageUrls, *imageViews;
@property (strong, nonatomic) ASMediaFocusManager *mediaFocusManager;

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet UICollectionViewFlowLayout *collectionViewFlowLayout;
@property (strong, nonatomic) IBOutlet UIView *leftGradientView;
@property (strong, nonatomic) IBOutlet UIView *rightGradientView;

@end


@implementation ABSlidingWebImageViewController

-(instancetype)initWithDelegate:(id<ABSlidingWebImageViewControllerDelegate>)delegate
             thumbnailImageUrls:(NSArray *)thumbnailImageUrls
                  fullImageUrls:(NSArray *)fullImageUrls
                   showGradient:(BOOL)showGradient {
    if (self = [super initWithNibName:nil bundle:nil]) {
        self.delegate = delegate;
        self.thumbnailImageUrls = thumbnailImageUrls;
        self.fullImageUrls = fullImageUrls;
        self.showGradient = showGradient;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.showGradient) {
        [self setupGradientViews];
    }
    
    self.mediaFocusManager = [ASMediaFocusManager new];
    self.mediaFocusManager.delegate = self;

    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([ABSlidingWebImageViewCell class]) bundle:nil]
          forCellWithReuseIdentifier:@"ImageCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)setupGradientViews {
    // Left gradient view
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.leftGradientView.bounds;
    gradient.colors = [NSArray arrayWithObjects:
                       (id)[[UIColor colorWithWhite: 1.0 alpha:0.0] CGColor],
                       (id)[[UIColor colorWithWhite: 1.0 alpha:0.9] CGColor], nil];
    gradient.startPoint = CGPointMake(0.5, 0.0);
    gradient.endPoint = CGPointMake(0.0, 0.0);
    [self.leftGradientView.layer insertSublayer:gradient atIndex:0];
    
    // Right gradient view
    gradient = [CAGradientLayer layer];
    gradient.frame = self.rightGradientView.bounds;
    gradient.colors = [NSArray arrayWithObjects:
                       (id)[[UIColor colorWithWhite: 1.0 alpha:0.0] CGColor],
                       (id)[[UIColor colorWithWhite: 1.0 alpha:0.9] CGColor], nil];
    gradient.startPoint = CGPointMake(0.0, 0.0);
    gradient.endPoint = CGPointMake(1.0, 0.0);
    [self.rightGradientView.layer insertSublayer:gradient atIndex:0];
}

-(void)setItemSize:(CGSize)itemSize {
    self.collectionViewFlowLayout.itemSize = itemSize;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collectionView reloadData];
    });
}

#pragma mark - ASMediaFocusDelegate

- (UIImageView *)mediaFocusManager:(ASMediaFocusManager *)mediaFocusManager imageViewForView:(UIView *)view;
{
    return (UIImageView *)view;
}

- (CGRect)mediaFocusManager:(ASMediaFocusManager *)mediaFocusManager finalFrameForView:(UIView *)view
{
    return self.parentViewController.view.bounds;
}

- (UIViewController *)parentViewControllerForMediaFocusManager:(ASMediaFocusManager *)mediaFocusManager
{
    return self.parentViewController;
}

- (NSURL *)mediaFocusManager:(ASMediaFocusManager *)mediaFocusManager mediaURLForView:(UIView *)view
{
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:[self.collectionView convertPoint:view.center
                                                                                                   fromView:view.superview]];
    
    NSString *urlString;
    if (self.fullImageUrls) {
        urlString = self.fullImageUrls[indexPath.row];
    }
    else {
        // Use thumbnail image url if full size image urls not present
        urlString = self.thumbnailImageUrls[indexPath.row];
    }
    
    NSURL *url = [NSURL URLWithString:urlString];
    return url;
}

- (NSString *)mediaFocusManager:(ASMediaFocusManager *)mediaFocusManager titleForView:(UIView *)view
{
    return nil;
}


#pragma mark - UICollectionViewDelegate

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegate slidingWebImageViewController:self didSelectRow:indexPath.row];
}


#pragma mark - UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.thumbnailImageUrls.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ABSlidingWebImageViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageCell" forIndexPath:indexPath];
    
    NSString *urlString;
    if (self.thumbnailImageUrls) {
        urlString = self.thumbnailImageUrls[indexPath.row];
    }
    else {
        // Use full size image url if thumbnails not present
        urlString = self.fullImageUrls[indexPath.row];
    }
    [cell loadImageWithURL:urlString];
    [cell installMediaFocusManager:self.mediaFocusManager];
    
    return cell;
}

@end
