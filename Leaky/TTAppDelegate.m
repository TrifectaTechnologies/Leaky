//
//  TTAppDelegate.m
//  Leaky
//
//  Created by Eric DeLabar on 2/21/14.
//  Copyright (c) 2014 Trifecta Technologies, Inc. All rights reserved.
//

#import "TTAppDelegate.h"
#import "TTViewController.h"

@interface TTAppDelegate ()

@property (strong,nonatomic) NSMutableArray *helpers;

@end

@implementation TTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGRect viewBounds = [[UIScreen mainScreen] applicationFrame];
    
    self.window = [[UIWindow alloc] initWithFrame:screenBounds];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    
    TTViewController *viewController = (TTViewController *)[storyboard instantiateInitialViewController];
    
    self.window.rootViewController = viewController;
    self.window.rootViewController.view.frame = viewBounds;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
