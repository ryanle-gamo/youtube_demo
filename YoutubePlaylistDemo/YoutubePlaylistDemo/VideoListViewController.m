//
//  VideoListViewController.m
//  YoutubePlaylistDemo
//
//  Created by Binh Le on 9/14/15.
//  Copyright (c) 2015 bile. All rights reserved.
//

#import "VideoListViewController.h"
#import "PLObject.h"
#import "VideoObject.h"
#import "ContentDataManager.h"
#import "Constants.h"

@interface VideoListViewController ()

@property (nonatomic, strong) NSMutableArray *videoArray;
@property (nonatomic, strong) PLObject *selectedPlaylist;
@property (nonatomic, strong) ContentDataManager *contentDataManager;
@property (nonatomic, strong) IBOutlet UITableView *videoTableView;

@end

@implementation VideoListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil playlist:(PLObject *)playlist {
    self = [self initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.selectedPlaylist = playlist;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.contentDataManager = [[ContentDataManager alloc] init];
    self.contentDataManager.delegate = self;
    [self loadYoutubeVideolist];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.title = self.selectedPlaylist.plName;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadYoutubeVideolist {
    NSString *youtubeUrl = [NSString stringWithFormat:YOUTUBE_PLAYLIST_ITEMS_URL, 50, self.selectedPlaylist.plId, AUTHENTICATION_KEY];
    [self.contentDataManager getYoutubeVideolistWith:youtubeUrl parameter:nil];
}

- (void)finishLoadYoutubeVideoList:(NSMutableArray *)videoArray {
    if (!videoArray) {
        videoArray = [[NSMutableArray alloc] init];
    }
    self.videoArray = videoArray;
    [self.videoTableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.videoArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifer = @"CELL_IDENTIFIER";
    UITableViewCell *tableCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (!tableCell) {
        tableCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
    }
    VideoObject *videoObj = [self.videoArray objectAtIndex:indexPath.row];
    [tableCell.textLabel setText:videoObj.videoName];
    return tableCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    VideoObject *videoObj = [self.selectedPlaylist.videoArray objectAtIndex:indexPath.row];
}

@end
