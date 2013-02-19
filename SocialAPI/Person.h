//
//  Person.h
//  SocialAPI
//
//  Created by Clayton Selby on 12/17/12.
//  Copyright (c) 2012 SocialREST. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
    The Person class is a native iOS object that represents a Person in the Facebook API.
 */
@interface Person : NSObject

/** Represents the unique id of a Person on Facebook */
@property (nonatomic) NSString* uniqueId;
/** Represents the first name of a Person on Facebook */
@property (nonatomic) NSString* firstName;
/** Represents the last name of a Person on Facebook */
@property (nonatomic) NSString* lastName;
/** Represents the display name of a Person on Facebook */
@property (nonatomic) NSString* displayName;


/** Initialization method that takes a dictionary of attributes and assigns them.
 
 @param  values NSDictionary containing values associated with a Person object.
 @return Returns a newly allocated Person object.
 */
- (Person *)initPersonWithValues:(NSDictionary *)values;

@end
