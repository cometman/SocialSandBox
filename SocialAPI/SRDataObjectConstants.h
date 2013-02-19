//
//  SRDataObjectConstants.h
//  SocialAPI
//
//  Created by Cory Pickrel on 2/1/13.
//  Copyright (c) 2013 SocialREST. All rights reserved.
//
//  REVISION LOG
//  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
//  *   Date:           Person:                 Changes:
//  *   -----           -------                 --------
//  *   01/31/13        Cory Pickrel            - Extracted constants from individual DOs
//  *                                             into this common constants file
//  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

#import <Foundation/Foundation.h>


#pragma mark - SRPerson

extern NSString* const SRPersonFirstNameDictKey;
extern NSString* const SRPersonLastNameDictKey;
extern NSString* const SRPersonDisplayNameDictKey;
extern NSString* const SRPersonUniqueIdDictKey;


#pragma mark - SRProfile

extern NSString* const SRProfileNameDictKey;
extern NSString* const SRProfileFirstNameDictKey;
extern NSString* const SRProfileLastNameDictKey;
extern NSString* const SRProfileLocaleDictKey;
extern NSString* const SRProfileTimeZoneDictKey;
extern NSString* const SRProfileGenderDictKey;
extern NSString* const SRProfileLinkDictKey;


#pragma mark -

@interface SRDataObjectConstants : NSObject

@end
