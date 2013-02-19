//
//  SRGlobalConstants.h
//  SocialAPI
//
//  Created by Cory Pickrel on 2/1/13.
//  Copyright (c) 2013 SocialREST. All rights reserved.
//
//  REVISION LOG
//  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
//  *   Date:           Person:                 Changes:
//  *   -----           -------                 --------
//  *   01/31/13        Cory Pickrel            - Extracted constants from SocialAPI
//  *                                             into this common global constants file
//  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

#import <Foundation/Foundation.h>


#pragma mark - SocialAPI

extern NSString* const SRAchiveTokenPathAppendString;

extern NSString* const SRLocalHostURL;
extern NSString* const SRRootFBUrl;
extern NSString* const SRAuthenticateFBUrl;
extern NSString* const SRFriendsFBUrl;
extern NSString* const SRRequestHTTPHeaderAccept;

extern NSString* const SRTokenExpireString;

extern NSString* const SRFriendsDictKeyData;

@interface SRGlobalConstants : NSObject

@end
