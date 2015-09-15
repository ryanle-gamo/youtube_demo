//
//  ContentDataManager.h
//  API
//

#import "AbstractDataManager.h"

@interface ContentDataManager : AbstractDataManager
- (void)getYoutubePlaylistWith:(NSString *)url parameter:(NSDictionary *)parameter;
- (void)getYoutubeVideolistWith:(NSString *)url parameter:(NSDictionary *)parameter;
@end
