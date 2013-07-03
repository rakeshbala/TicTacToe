//
//  CellView.m
//  TicTacToe
//
//  Created by rakesh on 02/07/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "CellView.h"


@implementation CellView
@synthesize circle;//drawAnimation;
- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
        [self setWantsLayer:YES];
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    // Drawing code here.
//    [[NSColor redColor] set];
//    NSRectFill(dirtyRect);
    // Set up the shape of the circle
   
}


//-(void)mouseDown:(NSEvent *)theEvent{
//    [self setWantsLayer:YES];
//    int radius = 15;
//    circle = [CAShapeLayer layer];
//    // Make a circular shape
//    CGPathRef path = [[NSBezierPath bezierPathWithOvalInRect:NSMakeRect(0, 0, 2.0*radius, 2.0*radius)] quartzPath];
//    circle.path =  path; ;
////    circle.frame = NSMakeRect(0, 0, 10, 10);
////    circle.path = CGPathCreateWithEllipseInRect(CGRectMake(10, 10, 50, 50), NULL);
////    circle.path =  [[NSBezierPath bezierPathWithOvalInRect:NSMakeRect(10, 10, 2.0*radius, 2.0*radius)] quartzPath] ;
//    // Center the shape in self.view
////    CGFloat midX = CGRectGetMidX(self.frame);
//    NSLog(@"%@",NSStringFromRect(self.frame));
//                
//    NSPoint origin = CGPointMake(self.frame.size.width/2-radius, 
//                                 self.frame.size.height/2-radius);
//    NSRect dummyFrame = circle.frame;
//    dummyFrame.origin = origin;
//    circle.frame =  dummyFrame;
//    
//    // Configure the apperence of the circle
//    circle.fillColor =  [NSColor NSColorToCGColor:[NSColor clearColor]];
//    circle.strokeColor = [NSColor NSColorToCGColor:[NSColor blackColor]];
//    circle.lineWidth = 1;
//    
//    
//    
//    // Add to parent layer
//    [self.layer addSublayer:circle];
////    NSLog(@"%@",self.layer);
//
////    CGFloat sStr = [circle strokeStart];
//    
//    
//    // Configure animation
//    CABasicAnimation *drawAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//    drawAnimation.duration            = 0.3; // "animate over 10 seconds or so.."
//    drawAnimation.repeatCount         = 1.0;  // Animate only once..
//    drawAnimation.removedOnCompletion = NO;   // Remain stroked after the animation..
//    
//    // Animate from no part of the stroke being drawn to the entire stroke being drawn
//    drawAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
//    drawAnimation.toValue   = [NSNumber numberWithFloat:1.0f];
//    
//    // Experiment with timing to get the appearence to look the way you want
//    drawAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
//    
//    drawAnimation.delegate = self;
//    
//    // Add the animation to the circle
//    [circle addAnimation:drawAnimation forKey:@"drawCircleAnimation"];
////    [super mouseDown:theEvent];
//}

-(void)animationDidStart:(CAAnimation *)anim{
    [self setNeedsDisplay:YES];
    NSLog(@"Animation started");
}



-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"%f",[circle strokeEnd]);
    NSLog(@"%@",flag?@"YES":@"NO");
    NSLog(@"%@",anim);
}
@end
