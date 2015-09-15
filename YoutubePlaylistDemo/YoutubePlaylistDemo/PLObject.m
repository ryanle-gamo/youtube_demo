//
//  PLObject.m
//  YoutubePlaylistDemo
//
//  Created by Binh Le on 9/14/15.
//  Copyright (c) 2015 bile. All rights reserved.
//

#import "PLObject.h"

@implementation PLObject

+ (NSMutableArray *)arrayFromDictionary:(NSDictionary *)dict {
    
    NSMutableArray *posterDicts = [dict valueForKeyPath:@"items"];
    NSMutableArray *playlists = [NSMutableArray array];
    for (NSDictionary *item in posterDicts) {
        PLObject *playlist = [[PLObject alloc] init];
        [playlist parser:item];
        [playlists addObject:playlist];
    }
    
    return playlists;
}

- (void) parser:(id) json {
    self.plId = [json valueForKey:@"id"];
    NSDictionary *dictionary = [json valueForKeyPath:@"snippet"];
    self.plName = [dictionary valueForKey:@"title"];
}

@end
