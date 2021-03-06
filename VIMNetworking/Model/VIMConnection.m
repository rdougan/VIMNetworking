//
//  VIMConnection.m
//  VIMNetworking
//
//  Created by Kashif Muhammad on 6/16/14.
//  Copyright (c) 2014-2015 Vimeo (https://vimeo.com)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "VIMConnection.h"

// Connection names

NSString *const VIMConnectionNameActivities = @"activities";
NSString *const VIMConnectionNameAlbums = @"albums";
NSString *const VIMConnectionNameChannels = @"channels";
NSString *const VIMConnectionNameRelated = @"related";
NSString *const VIMConnectionNameRecommendations = @"recommendations";
NSString *const VIMConnectionNameComments = @"comments";
NSString *const VIMConnectionNameReplies = @"replies";
NSString *const VIMConnectionNameCovers = @"covers";
NSString *const VIMConnectionNameCredits = @"credits";
NSString *const VIMConnectionNameFeed = @"feed";
NSString *const VIMConnectionNameFollowers = @"followers";
NSString *const VIMConnectionNameFollowing = @"following";
NSString *const VIMConnectionNameUsers = @"users";
NSString *const VIMConnectionNameGroups = @"groups";
NSString *const VIMConnectionNameLikes = @"likes";
NSString *const VIMConnectionNamePictures = @"pictures";
NSString *const VIMConnectionNamePortfolios = @"portfolios";
NSString *const VIMConnectionNameShared = @"shared";
NSString *const VIMConnectionNameVideos = @"videos";
NSString *const VIMConnectionNameWatchlater = @"watchlater";
NSString *const VIMConnectionNameViolations = @"violations";
NSString *const VIMConnectionNameVODItem = @"ondemand";
NSString *const VIMConnectionNameVODTrailer = @"trailer";

@interface VIMConnection()
@property (nonatomic, strong, nullable) NSNumber *extra_total;
@property (nonatomic, strong, nullable) NSNumber *main_total;
@property (nonatomic, strong, nullable) NSNumber *viewable_total;
@end

@implementation VIMConnection

#pragma mark - VIMMappable

- (void)didFinishMapping
{
    // TODO: Why not use getObjectMapping to achieve below?
    // That method won't be called if a VIMModelObject is created with initWithKeyValueDictionary
    // We should fix that or make this aspect of object mapping more transparent [NL] 05/21/2016
    
    self.extraVideosCount = self.extra_total;
    self.mainVideosCount = self.main_total;
    self.viewableVideosCount = self.viewable_total;
}

- (BOOL)canGet
{
    return (self.options && [self.options containsObject:@"GET"]);
}

- (BOOL)canPost
{
    return (self.options && [self.options containsObject:@"POST"]);
}

@end
