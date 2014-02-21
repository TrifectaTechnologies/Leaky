//
//  TTViewController.m
//  Leaky
//
//  Created by Eric DeLabar on 2/21/14.
//  Copyright (c) 2014 Trifecta Technologies, Inc. All rights reserved.
//

#import "TTViewController.h"
#import "TTAppDelegate.h"

#import "TTRandomColor.h"

@interface TTViewController ()

@property (weak, nonatomic) IBOutlet UIButton *leakButton;

@property (strong, nonatomic) void(^colorBlock)(void);

@end

@implementation TTViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.colorBlock = ^{
            self.view.backgroundColor = [[TTRandomColor alloc] init];
        };
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.colorBlock();
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
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
