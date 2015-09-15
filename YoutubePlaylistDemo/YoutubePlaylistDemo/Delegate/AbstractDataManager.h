//
//  AKObjectManager.h
//  AKGithubClient
//
//  Created by Alex Kurkin on 12/26/13.
//  Copyright (c) 2013 Brilliant Consulting Inc. All rights reserved.
//
#import "AFHTTPRequestOperationManager.h"
#import "DataManagerDelegate.h"

@interface AbstractDataManager : AFHTTPRequestOperationManager

@property (weak, nonatomic) id<DataManagerDelegate> delegate;

+ (instancetype)sharedManager;
+ (void)setCacheSize;
@end
