//
//  NSColor+ColorConversions.h
//  TicTacToe
//
//  Created by rakesh on 02/07/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <AppKit/AppKit.h>

@interface NSColor (ColorConversions)
+(CGColorRef) NSColorToCGColor: (NSColor *) nsColor;
+(NSColor *) CGColorToNSColor: (CGColorRef) cgColor;
@end
