//
//  Profile.m
//  SocialAPI
//
//  Created by Clayton Selby on 1/6/13.
//  Copyright (c) 2013 SocialREST. All rights reserved.
//
//  REVISION LOG
//  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
//  *   Date:           Person:                 Changes:
//  *   -----           -------                 --------
//  *   01/31/13        Cory Pickrel            - Formatting changes, changed private
//  *                                             variables to consts.
//  *                                           - appledoc formatted comments in the .h
//  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

#import "Profile.h"
#import "SRDataObjectConstants.h"


@implementation Profile


@synthesize displayName = _displayName;
@synthesize firstName   = _firstName;
@synthesize lastName    = _lastName;
@synthesize locale      = _locale;
@synthesize timezone    = _timezone;
@synthesize gender      = _gender;
@synthesize link        = _link;


#pragma mark - Initialization

- (Profile *)initWithValues:(NSDictionary *)values {
    // If the parent class returns an object
    if (self = [super init]) {   
        // Assign the dictionary values to the object
        _displayName    = [values objectForKey:SRProfileNameDictKey];
        _firstName      = [values objectForKey:SRProfileFirstNameDictKey];
        _lastName       = [values objectForKey:SRProfileLastNameDictKey];
        _locale         = [values objectForKey:SRProfileLocaleDictKey];
        _timezone       = [values objectForKey:SRProfileTimeZoneDictKey];
        _gender         = [values objectForKey:SRProfileGenderDictKey];
        _link           = [values objectForKey:SRProfileLinkDictKey];
    }
    // Return a newly allocated instance of a Profile object
    return self;
}
@end
