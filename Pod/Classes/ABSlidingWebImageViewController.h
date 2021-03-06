//
//  ABSlidingImageViewController.h
//
//  Created by Alan Bouzek on 2/13/15.
//  Copyright (c) 2015 Alan Bouzek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ABSlidingWebImageViewController : UIViewController

-(instancetype)initWithThumbnailImageUrls:(NSArray *)thumbnailImageUrls
                            fullImageUrls:(NSArray *)fullImageUrls
                             showGradient:(BOOL)showGradient;
-(void)setItemSize:(CGSize)itemSize;

@end