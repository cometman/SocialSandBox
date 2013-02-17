//
//  ViewController.m
//  SandBox
//
//  Created by Clayton Selby on 12/23/12.
//  Copyright (c) 2012 SocialREST. All rights reserved.
//

#import "ViewController.h"
#import "SocialAPI.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize resultView = _resultView;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

- (IBAction)authFacebook:(id)sender {

        [SocialAPI authenticateFB];

}

- (IBAction)getFriends:(id)sender {
    if ([SocialAPI isTokenValid] == YES)
    {
        NSArray* friends = [SocialAPI getFriends];
        if (friends != nil)
            NSLog(@"Friends: %@", [[friends objectAtIndex:0] displayName]);
    }
    else {
        [SocialAPI authenticateFB];
    }
}

- (IBAction)getProfile:(id)sender {
    if ([SocialAPI isTokenValid] == YES)
    {
        Profile *userProfile = [SocialAPI getProfile];
        NSLog(@"Profile: %@", [userProfile description]);
    }
    else {
        [SocialAPI authenticateFB];
    }
}

- (IBAction)GetLikes:(id)sender {
    if ([SocialAPI isTokenValid] == YES)
    {
        NSMutableString* resultString = [[NSMutableString alloc] init];
        NSArray *userLikes = [SocialAPI getLikes];
        
        for (int i = 0; i<[userLikes count]; i++)
        {
            [resultString appendString:[[userLikes objectAtIndex:i] name]];
        }
        
        self.resultView.text = resultString;

    }
    else {
        [SocialAPI authenticateFB];
    }
}



- (IBAction)getMovies:(id)sender {
    if ([SocialAPI isTokenValid] == YES)
    {
        NSMutableString* resultString = [[NSMutableString alloc] init];
        NSArray *userMovies = [SocialAPI getMovies];
        
        for (int i = 0; i<[userMovies count]; i++)
        {
            [resultString appendString:[[userMovies objectAtIndex:i] name]];
        }
        
        self.resultView.text = resultString;
        
    }
    else {
        [SocialAPI authenticateFB];
    }
}

- (IBAction)getMusic:(id)sender {
    if ([SocialAPI isTokenValid] == YES)
    {
        NSMutableString* resultString = [[NSMutableString alloc] init];
        NSArray *objects = [SocialAPI getMusic];
        
        for (int i = 0; i<[objects count]; i++)
        {
            [resultString appendString:[[objects objectAtIndex:i] name]];
        }
        
        self.resultView.text = resultString;
        
    }
    else {
        [SocialAPI authenticateFB];
    }
}

- (IBAction)getNotes:(id)sender {
    if ([SocialAPI isTokenValid] == YES)
    {
        [self displayStringForObjects:[SocialAPI getPermissions]];
    }
    else {
        [SocialAPI authenticateFB];
    }
}

- (IBAction)getAlbum:(id)sender {
    if ([SocialAPI isTokenValid] == YES)
    {
        [self displayStringForObjects:[SocialAPI getAlbums]];
    }
    else {
        [SocialAPI authenticateFB];
    }
}

-(void) displayStringForObjects:(NSArray* )objects
{
    NSMutableString* resultString = [[NSMutableString alloc] init];
    
    for (int i = 0; i<[objects count]; i++)
    {
        [resultString appendString:[[objects objectAtIndex:i] description]];
    }
    
    self.resultView.text = resultString;
}

@end
