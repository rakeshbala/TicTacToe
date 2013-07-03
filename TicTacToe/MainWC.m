//
//  MainWC.m
//  TicTacToe
//
//  Created by rakesh on 03/07/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "MainWC.h"

@implementation MainWC

@synthesize cView1;
@synthesize cView2;
@synthesize cView3;
@synthesize cView4;
@synthesize cView5;
@synthesize cView6;
@synthesize cView7;
@synthesize cView8;
@synthesize cView9;
@synthesize p1CellView;
@synthesize p2CellView;
@synthesize p1Label;
@synthesize p2Label;

@synthesize player1=_player1;
@synthesize player2=_player2;
@synthesize nGameWC=_nGameWC;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}


//initialize the players
-(void)awakeFromNib{
    self.player1 = [[Player alloc] init];
    self.player2 = [[Player alloc] init];
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (IBAction)cellClicked:(id)sender {
    
    //Mark or not?
    if ([sender layer].sublayers.count>0) {
        NSRunAlertPanel(@"Error", @"Already marked", @"Ok",Nil, Nil);
        return;
    }
    
    //Get active player and draw the dot
    Player *activePlayer = [self getActivePlayer];
    if (activePlayer) {
        if (activePlayer.markType == Dot) {
            [self drawDotInView:sender];
        }else{
            [self drawCrossInView:sender];
        }
    }
        
}


#pragma mark - Drawing methods -

-(void)drawDotInView:(NSView *)clickedCell{
    int radius = 15;
    CAShapeLayer *circle = [CAShapeLayer layer];
//    circle
    // Make a circular shape
    CGPathRef path = [[NSBezierPath bezierPathWithOvalInRect:NSMakeRect(0, 0, 2.0*radius, 2.0*radius)] quartzPath];
    circle.path =  path; ;
    
    
    NSPoint origin = CGPointMake(clickedCell.frame.size.width/2-radius, 
                                 clickedCell.frame.size.height/2-radius);
    NSRect dummyFrame = circle.frame;
    dummyFrame.origin = origin;
    circle.frame =  dummyFrame;
    
    // Configure the apperence of the circle
    circle.fillColor =  [NSColor NSColorToCGColor:[NSColor clearColor]];
    circle.strokeColor = [NSColor NSColorToCGColor:[NSColor blackColor]];
    circle.lineWidth = 1;
    
    
    
    // Add to parent layer
    [clickedCell.layer addSublayer:circle];
    //    NSLog(@"%@",self.layer);
    
    //    CGFloat sStr = [circle strokeStart];
    
    
    // Configure animation
    CABasicAnimation *drawAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    drawAnimation.duration            = 0.3; // "animate over 10 seconds or so.."
    drawAnimation.repeatCount         = 1.0;  // Animate only once..
    drawAnimation.removedOnCompletion = NO;   // Remain stroked after the animation..
    
    // Animate from no part of the stroke being drawn to the entire stroke being drawn
    drawAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    drawAnimation.toValue   = [NSNumber numberWithFloat:1.0f];
    
    // Experiment with timing to get the appearence to look the way you want
    drawAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    drawAnimation.delegate = self;
    
    // Add the animation to the circle
    [circle addAnimation:drawAnimation forKey:@"drawCircleAnimation"];
}

-(void)drawCrossInView:(NSView *)view{
    
    CAShapeLayer *line1 = [CAShapeLayer layer];
    CGMutablePathRef path1 = CGPathCreateMutable();
    
    //Drawing points for first line
    
    CGPoint bottomLeft = CGPointMake(0, 0);
    CGPoint topRight = CGPointMake(view.frame.size.width, view.frame.size.height);
    
    
    
    
    
    
    //Drawing points for second line
    CGPoint topLeft = CGPointMake(0, view.frame.size.height);
    CGPoint bottomRight = CGPointMake(view.frame.size.width, 0);
    
    
    
    
    
}

#pragma mark -

-(Player *)getActivePlayer{
    
    if (self.player1.active == YES) {
        return self.player1;
    }else if(self.player2.active == YES){
        return self.player2;
    }else{
        NSRunAlertPanel(@"Error", @"No player active" , @"Ok", Nil, Nil);
        return nil;
    }
    
}

- (IBAction)setPlayersAndStartGame:(id)sender {
    
    self.nGameWC = [[NewGameWC alloc] initWithWindowNibName:@"NewGame"];
    self.nGameWC.player1 = self.player1;
    self.nGameWC.player2 = self.player2;
    [self.nGameWC showWindow:sender];
    
    
    
    
}



@end


























