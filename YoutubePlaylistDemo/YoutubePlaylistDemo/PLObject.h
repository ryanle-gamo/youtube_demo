//
//  PLObject.h
//  YoutubePlaylistDemo
//
//  Created by Binh Le on 9/14/15.
//  Copyright (c) 2015 bile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PLObject : NSObject
@property (nonatomic, strong) NSString *plId;
@property (nonatomic, strong) NSString *plName;
@property (nonatomic, strong) NSArray *videoArray;

+ (NSMutableArray *)arrayFromDictionary:(NSDictionary *)dict;
@end
