//
//  VideoObject.m
//  YoutubePlaylistDemo
//
//  Created by Binh Le on 9/14/15.
//  Copyright (c) 2015 bile. All rights reserved.
//

#import "VideoObject.h"

@implementation VideoObject

+ (NSMutableArray *)arrayFromDictionary:(NSDictionary *)dictionary {
    NSMutableArray *dictionary1 = [dictionary valueForKeyPath:@"items.snippet"];
    NSMutableArray *videos = [NSMutableArray array];
    for (NSDictionary *item in dictionary1) {
        VideoObject *videoObject = [[VideoObject alloc] init];
        [videoObject parser:item];
        [videos addObject:videoObject];
    }
    
    return videos;
}

- (void) parser:(id) json {
    self.videoName = [json valueForKey:@"title"];
    NSDictionary *resourceDictionary = [json valueForKeyPath:@"resourceId"];
    self.videoId = [resourceDictionary valueForKey:@"videoId"];
    NSDictionary *thumbnailDictionary = [json valueForKeyPath:@"thumbnails.medium"];
    self.videoThumbnail = [thumbnailDictionary valueForKey:@"url"];
}

@end
