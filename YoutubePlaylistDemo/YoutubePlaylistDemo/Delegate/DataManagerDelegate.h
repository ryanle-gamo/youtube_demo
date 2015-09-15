//
//  DataManagerDelegate.h
//  API
//

#import <Foundation/Foundation.h>

@protocol DataManagerDelegate <NSObject>

@optional

- (void)finishLoadYoutubePlaylist:(NSMutableArray *)playListArray;
- (void)finishLoadYoutubeVideoList:(NSMutableArray *)videoArray;

@end
