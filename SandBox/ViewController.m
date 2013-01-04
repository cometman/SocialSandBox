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

    if ([SocialAPI isTokenValid] == YES)
    {
        NSLog(@"Your token: %@", [SocialAPI token]);
    }
    else {
        [SocialAPI authenticateFB];
    }
}

@end
