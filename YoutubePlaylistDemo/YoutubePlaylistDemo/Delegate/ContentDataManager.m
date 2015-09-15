//
//  ContentDataManager.m
//  API
//

#import "ContentDataManager.h"
#import "PLObject.h"
#import "VideoObject.h"

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
          NSMutableArray *videos = [VideoObject arrayFromDictionary:responseObject];
          [self.delegate finishLoadYoutubeVideoList:videos];
      }
      failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          [self.delegate finishLoadYoutubeVideoList:nil];
      }];
}

@end
