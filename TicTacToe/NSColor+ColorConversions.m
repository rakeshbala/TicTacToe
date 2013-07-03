//
//  NSColor+ColorConversions.m
//  TicTacToe
//
//  Created by rakesh on 02/07/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "NSColor+ColorConversions.h"

@implementation NSColor (ColorConversions)
+(CGColorRef) NSColorToCGColor: (NSColor *) nsColor {
    CGColorSpaceRef colorSpace = [[nsColor colorSpace] CGColorSpace];
    NSInteger noc = [nsColor numberOfComponents];
    CGFloat *components = malloc( sizeof(CGFloat)*(1+noc));
    [nsColor getComponents: components];
    
    CGColorRef cgColor = CGColorCreate (colorSpace, components);
    free(components);
    return cgColor;
}
+(NSColor *) CGColorToNSColor: (CGColorRef) cgColor {
    CGColorSpaceRef cgColorSpace = CGColorGetColorSpace( cgColor );
    size_t numberOfComponents = CGColorGetNumberOfComponents (cgColor);
    const CGFloat *components = CGColorGetComponents (cgColor);
    
    NSColorSpace *space = [[NSColorSpace alloc] initWithCGColorSpace: cgColorSpace];
    NSColor *color = [NSColor colorWithColorSpace: space components: components count: numberOfComponents];
    
    return color;
}
@end
