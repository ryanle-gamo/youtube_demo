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

@interface ViewController () {
    NSMutableArray *playlistArray;
}
@property (nonatomic, strong) IBOutlet UITableView *mainTableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    playlistArray = [[NSMutableArray alloc] init];
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
