# ABSlidingWebImageViewController

[![Version](https://img.shields.io/cocoapods/v/ABSlidingWebImageViewController.svg?style=flat)](http://cocoadocs.org/docsets/ABSlidingWebImageViewController)
[![License](https://img.shields.io/cocoapods/l/ABSlidingWebImageViewController.svg?style=flat)](http://cocoadocs.org/docsets/ABSlidingWebImageViewController)
[![Platform](https://img.shields.io/cocoapods/p/ABSlidingWebImageViewController.svg?style=flat)](http://cocoadocs.org/docsets/ABSlidingWebImageViewController)

## Description

A scrolling image collection view with asynchronous photo loading and single image focusing built in. Meant to be used with an item size and height to constrain the collection view to a single line. It leverages SDWebImage and ASMediaFocusManager.

## Example

![alt tag](https://www.github.com/abouzek/ABSlidingWebImageViewController/raw/master/example.gif)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

An instance of ABSegmentedViewController should be created using the designated initializer:

	-(instancetype)initWithThumbnailImageUrls:(NSArray *)thumbnailImageUrls
                                fullImageUrls:(NSArray *)fullImageUrls
                                 showGradient:(BOOL)showGradient;
                 
* The thumbnailImageUrls and fullImageUrls arrays should contain URLs in the form of NSStrings pointing to the images to be loaded in the collection view. They should have the same size. If no fullImageUrls exist, the thumbnailImageUrls will be used to load the full size images.

* The showGradient BOOL determines whether a white gradient on the left and right of the collection view will be shown.

* The instance should be added as a child view controller and the frame should be manually set. The view is intended to be constrained to a single line. 

The item size can be changed with the ABSegmentedViewController selector:

	-(void)setItemSize:(CGSize)itemSize;

## Installation

ABSlidingWebImageViewController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "ABSlidingWebImageViewController"

## Author

Alan Bouzek, github: abouzek, alan.bouzek@gmail.com.
Credit to SDWebImage and ASMediaFocusManager, as this pod depends on them for core functionality.

## License

ABSlidingWebImageViewController is available under the MIT license. See the LICENSE file for more info.
