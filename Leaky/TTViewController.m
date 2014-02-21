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

@property (strong, nonatomic) void(^colorBlock)(void);

@end

@implementation TTViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        UIViewController *me = self;
        self.colorBlock = ^{
            CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
            CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
            CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
            UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
            
            me.view.backgroundColor = color;
        };
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.colorBlock();
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
