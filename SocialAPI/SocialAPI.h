//
//  SocialAPI.h
//  SocialAPI
//
//  Created by Clayton Selby on 12/14/12.
//  Copyright (c) 2012 SocialREST. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Person.h"
#import "Profile.h"


/**
 The SocialAPI class ...
 */
@interface SocialAPI : NSObject

/** Opens the Login dialog on the device in a web view */
+ (void)authenticateFB;
/** 
 Calls FB to retrieve the current user's profile
 @return A Profile object 
 */
+ (Profile *)getProfile;
/** 
 Calls FB to retrieve the current user's friends list
 @return An array of Person objects 
 */
+ (NSArray *)getFriends;

/**
 Getter method to retrieve a static token
 @return Token; if no token exists, nil is returned.
 */
+ (NSString*)token;
/**
 Getter method to retrive a static token
 @return A unique ID; if no ID exists, nil is returned.
 */
+ (NSString*)uniqueID;


// Are these meant as public class methods?
+ (BOOL)isTokenValid;
+ (BOOL)saveToken:(NSString *)token;

@end


