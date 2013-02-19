//
//  SRGlobalConstants.m
//  SocialAPI
//
//  Created by Cory Pickrel on 2/1/13.
//  Copyright (c) 2013 SocialREST. All rights reserved.
//

#import "SRGlobalConstants.h"

@implementation SRGlobalConstants {}


#pragma mark - SocialAPI

NSString* const SRAchiveTokenPathAppendString = @"items.archive";

NSString* const SRLocalHostURL      = @"http://localhost:4567";
NSString* const SRRootFBUrl         = @"/fb";
NSString* const SRAuthenticateFBUrl = @"http://localhost:4567/fb/authenticate";
NSString* const SRFriendsFBUrl      = @"/fb/friends";

NSString* const SRRequestHTTPHeaderAccept = @"application/json,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5";

NSString* const SRTokenExpireString = @"&expires";

NSString* const SRFriendsDictKeyData = @"data";

@end
