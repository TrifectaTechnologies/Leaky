//
//  TTViewController.m
//  Leaky
//
//  Created by Eric DeLabar on 2/21/14.
//  Copyright (c) 2014 Trifecta Technologies, Inc. All rights reserved.
//

#import "TTViewController.h"
#import "TTAppDelegate.h"

@interface TTViewController ()

@property (weak, nonatomic) IBOutlet UIButton *leakButton;

@end

@implementation TTViewController

- (void)viewWillAppear:(BOOL)animated
{
    if (!self.presentingViewController) {
        self.leakButton.enabled = NO;
    }
}

- (IBAction)addViewController:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    TTViewController *viewController = (TTViewController *)[storyboard instantiateInitialViewController];

    self.delegate = viewController;
    viewController.owner = self;
    
    [self presentViewController:viewController animated:YES completion:nil];
    
}

- (IBAction)leakDelegate:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
