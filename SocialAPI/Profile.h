//
//  Profile.h
//  SocialAPI
//
//  Created by Clayton Selby on 1/6/13.
//  Copyright (c) 2013 SocialREST. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 The Profile class is an native object that represents a user profile in the Facebook API.
 */
@interface Profile : NSObject

/** The display name of the user */
@property (nonatomic) NSString* displayName;
/** The gender of the user */
@property (nonatomic) NSString* gender;
/** The first name of the user */
@property (nonatomic) NSString* firstName;
/** The last name of the user */
@property (nonatomic) NSString* lastName;
/** The link... */
@property (nonatomic) NSString* link;
/** The time zone... */
@property (nonatomic) NSString* timezone;
/** The locale... */
@property (nonatomic) NSString* locale;

/** Initialization method that takes a dictionary of attributes and assigns them.
 
 @param  values NSDictionary containing values associated with a Profile object.
 @return Returns a newly allocated Profile object.
 */
- (Profile *)initWithValues:(NSDictionary *)values;

@end
