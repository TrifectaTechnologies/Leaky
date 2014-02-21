//
//  TTRandomColor.m
//  Leaky
//
//  Created by Eric DeLabar on 2/21/14.
//  Copyright (c) 2014 Trifecta Technologies, Inc. All rights reserved.
//

#import "TTRandomColor.h"

@implementation TTRandomColor

- (id)init
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    
    self = [super initWithHue:hue saturation:saturation brightness:brightness alpha:1.0];
    if (self) {
        
    }
    return self;
}

@end
