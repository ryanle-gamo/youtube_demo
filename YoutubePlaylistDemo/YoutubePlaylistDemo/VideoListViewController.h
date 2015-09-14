//
//  VideoListViewController.h
//  YoutubePlaylistDemo
//
//  Created by Binh Le on 9/14/15.
//  Copyright (c) 2015 bile. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PLObject;
@interface VideoListViewController : UIViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil playlist:(PLObject *)playlist;
@end
