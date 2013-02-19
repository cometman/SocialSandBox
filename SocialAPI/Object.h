//
//  Object.h
//  SocialAPI
//
//  Created by Clayton Selby on 1/6/13.
//  Copyright (c) 2013 SocialREST. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 The Object class is an native object that represents an Object in the Facebook API.
 */
@interface Object : NSObject

/** A category...*/
@property (nonatomic) NSString* category;
/** A name... */
@property (nonatomic) NSString* name;
/** A unique id... */
@property (nonatomic) NSString* uniqueId;
/** The creation time... */
@property (nonatomic) NSString* creationTime;

@end
