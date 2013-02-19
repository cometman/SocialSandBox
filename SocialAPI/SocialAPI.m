//
//  SocialAPI.m
//  SocialAPI
//
//  Created by Clayton Selby on 12/14/12.
//  Copyright (c) 2012 SocialREST. All rights reserved.
//
//  REVISION LOG
//  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
//  *   Date:           Person:                 Changes:
//  *   -----           -------                 --------
//  *   01/31/13        Cory Pickrel            Clean up, error handling, organization
//  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

#import "SocialAPI.h"
#import "SRGlobalConstants.h"


static NSString* token    = nil;
static NSString* uniqueID = nil;
static NSString* SRToken  = nil;


// Private Class Methods
@interface SocialAPI()
+ (NSData *)sendGET:(NSString *)url;
+ (NSString *)itemArchivePath;
+ (void)openSafariWithURL:(NSString *)url;
+ (NSString* )convertDataToString:(NSData *)contents;
@end


@implementation SocialAPI


#pragma mark - Initialization

// Set the unique GUID for the user
+ (void)initialize {
    // Retrieve the token path on the device
    NSString* tokenPath = [self itemArchivePath];
    // Set the static var to the saved token on the device.
    NSMutableArray* tokenOnDevice = [NSKeyedUnarchiver unarchiveObjectWithFile:tokenPath];
    if ((nil != tokenOnDevice) &&
        (nil != [tokenOnDevice objectAtIndex:0])) {
        token = [tokenOnDevice objectAtIndex:0];
    }
    uniqueID = @"test";
    
    
    // Grab the socialRest token from the user's Plist file
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"SRAuth" ofType:@"plist"];
    // Create a mutable array to pull bundle contents into
    NSMutableArray* plistArray = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
}

#pragma mark - Helper Methods

// Path to archive token to on the device
+ (NSString *)itemArchivePath {
    // Create List of document directories
    // (the YES argument specifies tildes being replaced by full paths)
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    // Get one and only document directory from that list, append to the path, and return
    return [[documentDirectories objectAtIndex:0] stringByAppendingPathComponent:SRAchiveTokenPathAppendString];
}

// Validates token
+ (BOOL)isTokenValid {
    NSError *error;
    NSDictionary* jsonDictionary;
    
    // Check to see if the token is a valid token with Facebook.
    jsonDictionary = [NSJSONSerialization JSONObjectWithData:[self sendGET:SRRootFBUrl]
                                                     options:NSJSONReadingMutableLeaves
                                                       error:&error];
    if (nil == jsonDictionary) {
        NSLog(@"%@: %@", [error localizedDescription], [error localizedFailureReason]);
    } else {
        NSLog(@"%@", [jsonDictionary description]);
        return YES;
    }
    return NO;
    
    // backend call to check database for exp date compared to current date for token
    // associated with this device
    // return NO; // dummy return
}

// Save the token to the device
+ (BOOL)saveToken:(NSString *)tokenToSave {
    // Check to see if we have the expire parameter in the token string, if so remove it.
    if ([tokenToSave rangeOfString:SRTokenExpireString].location != NSNotFound) {
        tokenToSave = [tokenToSave substringToIndex:
                       [tokenToSave rangeOfString:SRTokenExpireString].location];
    }
    
    NSString *path = [self itemArchivePath];
    NSMutableArray *tokenOnDevice = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    // If the token was never stored on the device,
    // or the token is different than the one stored on the device, save it to the device
    if (tokenToSave == nil ||
        [tokenOnDevice objectAtIndex:0] == nil ||
        [[tokenOnDevice objectAtIndex:0] rangeOfString:tokenToSave].location == NSNotFound) {
        NSLog(@"No Token found...A save will be performed for this token: %@", tokenToSave);
        NSFileManager* defaultManager = [NSFileManager defaultManager];
        [defaultManager removeItemAtPath:path error:nil];
        
        // Set the local token varible.
        NSMutableArray *tokenArray = [[NSMutableArray alloc] initWithObjects:tokenToSave, nil];
        if (![NSKeyedArchiver archiveRootObject:tokenArray toFile:path]) {
            NSLog(@"Error archiving token.");
            return NO;
        };
        token = tokenToSave;
    } else {
        NSLog(@"Token was found, no saved required");
        token = [tokenOnDevice objectAtIndex:0];
    }
    return YES;
}


+ (NSDictionary *) getJSONPayload {
    NSError *error = [[NSError alloc] init];
    
    return [NSJSONSerialization JSONObjectWithData:[self sendGET:@"/fb"] //1
                                           options:NSJSONReadingMutableLeaves
                                             error:&error];
}

+ (NSString *)convertDataToString:(NSData *)contents {
    return [[NSString alloc] initWithBytes:[contents bytes] length:[contents length] encoding: NSASCIIStringEncoding];
}

+ (void)openSafariWithURL:(NSString *)url {
    NSURL *urlToOpen = [NSURL URLWithString:url];
    
    if (![[UIApplication sharedApplication] openURL:urlToOpen]) {
        NSLog(@"Failed to open url: %@",[url description]);
    }
}

#pragma mark - Custom Getters

// Getter for the static token
+ (NSString *)token {
    return token;
}

// Getter for the User Unique ID
+ (NSString *)uniqueID {
    return uniqueID;
}


// Authenticate FaceBook
+ (void)authenticateFB {
    // if a token doesn't exist or is not valid
    if (([self token] == nil) ||
        ([self isTokenValid] == NO)) {
        // URL == /fb/authenticate
        [SocialAPI openSafariWithURL:SRAuthenticateFBUrl];
    }
}


#pragma mark - Facebook API Calls

// sendGet
+ (NSData *)sendGET:(NSString *)url {
    // Check to see if OAuth token exists
//    if ([self token] != nil) {
    if ([self isTokenValid]) {
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        NSString* urlString = [NSString stringWithFormat:@"%@%@?access_token=%@",
                               SRLocalHostURL, url, [self token]];
        [request setURL:[NSURL URLWithString:urlString]];
        [request setHTTPMethod:@"GET"];
        NSString *accept = SRRequestHTTPHeaderAccept;
        [request addValue:accept forHTTPHeaderField:@"Accept"];
        
        NSError* error;
        NSData *serverReply = [NSURLConnection sendSynchronousRequest:request
                                                    returningResponse:nil
                                                                error:&error];
        if (nil == serverReply) {
            NSLog(@"%@%@", [error localizedDescription], [error localizedFailureReason]);
            return nil;
        }
        return serverReply;
    } else {
        [self authenticateFB];
    }
    
    
    // If the token is not valid, prompt the authenticate facebook screen
    @try {
        [self authenticateFB];
    }
    // Finally, try the GET request again with the new OAuth token.
    @finally {
        return [self sendGET:url];
    }
}


+ (NSArray *)getFriends {
    NSDictionary* friendsDict;
    NSError* error;
    NSArray* friendArray;
    
    friendsDict = [NSJSONSerialization JSONObjectWithData:[self sendGET:SRFriendsFBUrl]
                                                  options:NSJSONReadingMutableLeaves
                                                    error:&error];
    if (nil == friendsDict) {
        NSLog(@"%@: %@", [error localizedDescription], [error localizedFailureReason]);
    } else {
        friendArray = [friendsDict objectForKey:SRFriendsDictKeyData];
    }
    
    NSMutableArray* friendMutableArray;
    for (id friend in friendArray) {
        NSDictionary* friendFromArray = (NSDictionary*)friend;
        Person* person = [[Person alloc] initPersonWithValues:friendFromArray];
        if (nil != person) {
            [friendMutableArray addObject:person];
        }
    }
    return friendMutableArray;
    
    // return parsedFriends;
}

// This method needs review ***
+ (Profile *)getProfile {
    NSDictionary* jsonDataDictionary;
    NSError* error;
    
    if ([SocialAPI token] == nil) {
        [SocialAPI authenticateFB];
    } else {
        jsonDataDictionary = [NSJSONSerialization JSONObjectWithData:[self sendGET:SRRootFBUrl]
                                                             options:NSJSONReadingMutableLeaves
                                                               error:&error];
        if (nil == jsonDataDictionary) {
            NSLog(@"%@: %@", [error localizedDescription], [error localizedFailureReason]);
        } else {
            return [[Profile alloc] initWithValues:jsonDataDictionary];
        }
    }
    return nil;
}

@end
