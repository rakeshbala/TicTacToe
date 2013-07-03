//
//  CellView.h
//  TicTacToe
//
//  Created by rakesh on 02/07/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <QuartzCore/QuartzCore.h>
#import "NSColor+ColorConversions.h"
#import "NSBezierPath+GetCGPath.h"

@interface CellView : NSButton
@property (strong)  CAShapeLayer *circle;
//@property (strong) CABasicAnimation *drawAnimation;

@end
