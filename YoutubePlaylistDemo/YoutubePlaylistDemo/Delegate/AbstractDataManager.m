//
//  AKObjectManager.m
//  AKGithubClient
//
//  Created by Alex Kurkin on 12/26/13.
//  Copyright (c) 2013 Brilliant Consulting Inc. All rights reserved.
//

#import "AbstractDataManager.h"

static AbstractDataManager *sharedManager = nil;

@implementation AbstractDataManager : AFHTTPRequestOperationManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [self manager];
        sharedManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    });

    return sharedManager;
}

+ (void)setCacheSize {
    NSURLCache *sharedCache = [[NSURLCache alloc] initWithMemoryCapacity:2 * 1024 * 1024
                                                            diskCapacity:100 * 1024 * 1024
                                                                diskPath:nil];
    [NSURLCache setSharedURLCache:sharedCache];
}

@end
