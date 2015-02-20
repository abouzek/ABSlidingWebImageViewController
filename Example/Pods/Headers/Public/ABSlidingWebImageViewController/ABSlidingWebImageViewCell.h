//
//  ABSlidingWebImageViewCell.h
//  Test
//
//  Created by Alan Bouzek on 2/13/15.
//  Copyright (c) 2015 Alan Bouzek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ASMediaFocusManager.h>

@interface ABSlidingWebImageViewCell : UICollectionViewCell

-(void)loadImageWithURL:(NSString *)urlString;
-(void)installMediaFocusManager:(ASMediaFocusManager *)manager;

@end
