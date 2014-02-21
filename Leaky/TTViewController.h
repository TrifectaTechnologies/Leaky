//
//  TTViewController.h
//  Leaky
//
//  Created by Eric DeLabar on 2/21/14.
//  Copyright (c) 2014 Trifecta Technologies, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TTViewControllerDelegate.h"

@interface TTViewController : UIViewController<TTViewControllerDelegate>

@property (strong,nonatomic) id<TTViewControllerDelegate> delegate;
@property (strong,nonatomic) id<TTViewControllerDelegate> owner;

@end
