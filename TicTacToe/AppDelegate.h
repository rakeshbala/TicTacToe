//
//  AppDelegate.h
//  TicTacToe
//
//  Created by rakesh on 02/07/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <QuartzCore/QuartzCore.h>
#import "NSColor+ColorConversions.h"
#import "NSBezierPath+GetCGPath.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>
@property (strong)  CAShapeLayer *circle;

@property (assign) IBOutlet NSWindow *window;

@end
