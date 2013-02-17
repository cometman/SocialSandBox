//
//  ViewController.h
//  SandBox
//
//  Created by Clayton Selby on 12/23/12.
//  Copyright (c) 2012 SocialREST. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)authFacebook:(id)sender;
- (IBAction)getFriends:(id)sender;
- (IBAction)getProfile:(id)sender;
- (IBAction)GetLikes:(id)sender;
- (IBAction)getMovies:(id)sender;
- (IBAction)getMusic:(id)sender;
- (IBAction)getNotes:(id)sender;
- (IBAction)getAlbum:(id)sender;

@property (weak, nonatomic) IBOutlet UITextView *resultView;

@end
