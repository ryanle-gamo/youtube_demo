//
//  Constants.h
//  YoutubePlaylistDemo
//
//  Created by Binh Le on 9/15/15.
//  Copyright (c) 2015 bile. All rights reserved.
//


#define AUTHENTICATION_KEY @"AIzaSyBF2v-pZfhmIZH9ThhCi4wpJxUcur0TJaY" // Browser key
//#define AUTHENTICATION_KEY @"AIzaSyBQjcBJibgA_jz94-SZFG_pjsXbNI5z9to" // iOS key
#define CHANNEL_ID @"UC56oLyBaAmiyCfVGfCzAozQ"
#define YOUTUBE_PLAYLIST_URL @"https://www.googleapis.com/youtube/v3/playlists?part=snippet&channelId=%@&maxResults=%d&key=%@"
#define YOUTUBE_VIDEO_URL @"https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=%d&playlistId=%@&key=%@"
/*
 https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=50&playlistId=PLNrEnIHexeMNJiD3lsCWjAP63F8NweaVg&key=AIzaSyBF2v-pZfhmIZH9ThhCi4wpJxUcur0TJaY
 */

@interface Constants : NSObject

@end
