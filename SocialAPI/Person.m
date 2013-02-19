//
//  Person.m
//  SocialAPI
//
//  Created by Clayton Selby on 12/17/12.
//  Copyright (c) 2012 SocialREST. All rights reserved.
//
//  REVISION LOG
//  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
//  *   Date:           Person:                 Changes:
//  *   -----           -------                 --------
//  *   01/31/13        Cory Pickrel            - Formatting changes, changed private
//  *                                             variables to consts.
//  *                                           - appledoc formatted comments in the .h
//  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

#import "Person.h"
#import "SRDataObjectConstants.h"


@implementation Person


@synthesize firstName   = _firstName;
@synthesize lastName    = _lastName;
@synthesize displayName = _displayName;
@synthesize uniqueId    = _uniqueId;


#pragma mark - Initialization

- (Person *)initPersonWithValues:(NSDictionary *)values {
    // If the parent class returns an object
    if (self = [super init]) {
        // Assign dictionary values to the person object
        _firstName   = [values objectForKey:SRPersonFirstNameDictKey];
        _lastName    = [values objectForKey:SRPersonLastNameDictKey];
        _uniqueId    = [values objectForKey:SRPersonDisplayNameDictKey];
        _displayName = [values objectForKey:SRPersonUniqueIdDictKey];
    }
    // return the newly allocated Person object
    return self;
}

@end
