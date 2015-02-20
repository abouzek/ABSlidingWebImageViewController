//
//  ABSlidingWebImageViewCell.m
//  Test
//
//  Created by Alan Bouzek on 2/13/15.
//  Copyright (c) 2015 Alan Bouzek. All rights reserved.
//

#import "ABSlidingWebImageViewCell.h"
#import "UIImageView+WebCache.h"

@interface ABSlidingWebImageViewCell ()

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end


@implementation ABSlidingWebImageViewCell

-(void)awakeFromNib {}

-(void)loadImageWithURL:(NSString *)urlString {
    [self.imageView sd_cancelCurrentImageLoad];
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:urlString]];
}

-(void)installMediaFocusManager:(ASMediaFocusManager *)manager {
    [manager installOnView:self.imageView];
}

-(void)prepareForReuse {
    [self.imageView sd_cancelCurrentImageLoad];
    self.imageView.image = nil;
}

@end
