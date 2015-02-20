//
//  ABViewController.m
//  ABSlidingWebImageViewController
//
//  Created by abouzek on 02/20/2015.
//  Copyright (c) 2014 abouzek. All rights reserved.
//

#import "ABViewController.h"
#import "ABSlidingWebImageViewController.h"

@implementation ABViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *thumbnailUrl = @"http://placehold.it/110x110";
    NSString *fullUrl = @"http://placehold.it/1100x1100";
    NSArray *thumbnailUrls = @[thumbnailUrl, thumbnailUrl, thumbnailUrl, thumbnailUrl, thumbnailUrl, thumbnailUrl, thumbnailUrl, thumbnailUrl, thumbnailUrl, thumbnailUrl];
    NSArray *fullUrls = @[fullUrl, fullUrl, fullUrl, fullUrl, fullUrl, fullUrl, fullUrl, fullUrl, fullUrl, fullUrl];
    ABSlidingWebImageViewController *slidingImageViewController = [[ABSlidingWebImageViewController alloc] initWithThumbnailImageUrls:thumbnailUrls
                                                                                                                        fullImageUrls:fullUrls
                                                                                                                         showGradient:YES];
    [self addChildViewController:slidingImageViewController];
    [self.view addSubview:slidingImageViewController.view];
    slidingImageViewController.view.frame = CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, 80);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
