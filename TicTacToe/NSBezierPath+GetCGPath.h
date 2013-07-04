//
//  NSBezierPath+GetCGPath.h
//  TicTacToe
//
//  Created by rakesh on 02/07/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <AppKit/AppKit.h>

@interface NSBezierPath (GetCGPath)
- (CGPathRef)quartzPath;
@end
