//
//  ContentDataManager.m
//  API
//

#import "ContentDataManager.h"
#import "PLObject.h"

@implementation ContentDataManager

- (void)getYoutubePlaylistWith:(NSString *)url parameter:(NSDictionary *)parameter {
    [self GET:url parameters:parameter
      success:^(AFHTTPRequestOperation *operation, id responseObject) {
          NSMutableArray *playlists = [PLObject arrayFromDictionary:responseObject];
          [self.delegate finishLoadYoutubePlaylist:playlists];
      }
      failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          [self.delegate finishLoadYoutubePlaylist:nil];
      }];
}

- (void)getYoutubeVideolistWith:(NSString *)url parameter:(NSDictionary *)parameter {
    [self GET:url parameters:parameter
      success:^(AFHTTPRequestOperation *operation, id responseObject) {
          [self.delegate finishLoadYoutubeVideoList:nil];
      }
      failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          [self.delegate finishLoadYoutubePlaylist:nil];
      }];
}

@end
