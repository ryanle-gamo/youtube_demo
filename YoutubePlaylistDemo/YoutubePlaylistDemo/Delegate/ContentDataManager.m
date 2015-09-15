//
//  ContentDataManager.m
//  API
//

#import "ContentDataManager.h"

@implementation ContentDataManager

- (void)getYoutubePlaylistWith:(NSString *)url parameter:(NSDictionary *)parameter {
    [self GET:url parameters:parameter
      success:^(AFHTTPRequestOperation *operation, id responseObject) {
          [self.delegate finishLoadYoutubePlaylist:nil];
      }
      failure:^(AFHTTPRequestOperation *operation, NSError *error) {
      }];
}

- (void)getYoutubeVideolistWith:(NSString *)url parameter:(NSDictionary *)parameter {
    [self GET:url parameters:parameter
      success:^(AFHTTPRequestOperation *operation, id responseObject) {
          [self.delegate finishLoadYoutubeVideoList:nil];
      }
      failure:^(AFHTTPRequestOperation *operation, NSError *error) {
      }];
}

@end
