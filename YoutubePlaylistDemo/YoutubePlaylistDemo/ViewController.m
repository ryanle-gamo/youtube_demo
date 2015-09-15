//
//  ViewController.m
//  YoutubePlaylistDemo
//
//  Created by Binh Le on 9/14/15.
//  Copyright (c) 2015 bile. All rights reserved.
//

#import "ViewController.h"
#import "VideoListViewController.h"
#import "PLObject.h"
#import "VideoObject.h"
#import "ContentDataManager.h"

#define AUTHENTICATION_KEY @"AIzaSyBF2v-pZfhmIZH9ThhCi4wpJxUcur0TJaY" // Browser key
//#define AUTHENTICATION_KEY @"AIzaSyBQjcBJibgA_jz94-SZFG_pjsXbNI5z9to" // iOS key
#define CHANNEL_ID @"UC56oLyBaAmiyCfVGfCzAozQ"
#define YOUTUBE_PLAYLIST_URL @"https://www.googleapis.com/youtube/v3/playlists?part=snippet&channelId=%@&maxResults=%d&key=%@"
#define YOUTUBE_VIDEO_URL @"https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=%d&playlistId=%@&key=%@"
/*
 https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=50&playlistId=PLNrEnIHexeMNJiD3lsCWjAP63F8NweaVg&key=AIzaSyBF2v-pZfhmIZH9ThhCi4wpJxUcur0TJaY
 */

@interface ViewController () {
    NSMutableArray *playlistArray;
    ContentDataManager *contentDataManager;
}
@property (nonatomic, strong) IBOutlet UITableView *mainTableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    playlistArray = [[NSMutableArray alloc] init];
    contentDataManager = [[ContentDataManager alloc] init];
    contentDataManager.delegate = self;
    [self makeFakeDataForPlaylist];
    [self.mainTableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.title = @"Youtube";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadYoutubePlaylist {
    NSString *youtubeUrl = [NSString stringWithFormat:YOUTUBE_PLAYLIST_URL, CHANNEL_ID, 50, AUTHENTICATION_KEY];
    [contentDataManager getYoutubePlaylistWith:youtubeUrl parameter:nil];
}

- (void)finishLoadYoutubePlaylist:(NSMutableArray *)playListArray {
    
}

- (void)makeFakeDataForPlaylist {
    for (int i = 1; i <= 10; i++) {
        PLObject *plObj = [[PLObject alloc] init];
        plObj.plId = [NSString stringWithFormat:@"%d",i];
        plObj.plName = [NSString stringWithFormat:@"Playlist %d",i];
        plObj.videoArray = [self makeFakeDataForVideoArrayWithPlaylistId:plObj.plId];
        [playlistArray addObject:plObj];
    }
}

- (NSMutableArray *)makeFakeDataForVideoArrayWithPlaylistId:(NSString *)playlistId {
    NSMutableArray *videoArray = [[NSMutableArray alloc] init];
    for (int i = 1; i <= 10; i++) {
        VideoObject *videoObj = [[VideoObject alloc] init];
        videoObj.videoId = [NSString stringWithFormat:@"%@-%d",playlistId,i];
        videoObj.videoName = [NSString stringWithFormat:@"Playlist %@ - Video %d",playlistId, i];
        videoObj.videoThumbnail = @"http://toancanhbaochi.vn/pictures/picfullsizes/2015/01/22/pey1421910820.jpg";
        [videoArray addObject:videoObj];
    }
    return videoArray;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [playlistArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifer = @"CELL_IDENTIFIER";
    UITableViewCell *tableCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (!tableCell) {
        tableCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
    }
    PLObject *plObject = [playlistArray objectAtIndex:indexPath.row];
    [tableCell.textLabel setText:plObject.plName];
    return tableCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    PLObject *plObject = [playlistArray objectAtIndex:indexPath.row];
    VideoListViewController *videoViewController = [[VideoListViewController alloc] initWithNibName:@"VideoListViewController" bundle:nil playlist:plObject];
    [self.navigationController pushViewController:videoViewController animated:YES];
}

@end
