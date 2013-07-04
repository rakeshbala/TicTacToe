//
//  MainWC.m
//  TicTacToe
//
//  Created by rakesh on 03/07/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "MainWC.h"



@implementation MainWC{
//    NSArray *cellArray;
    BOOL gameFinished;

}

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
@synthesize winArrays=_winArrays;


#pragma mark - Initializations -

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

//initialize win arrays

-(void)initializeWinArraysAndPlayers{
    //define positions
    self.player1 = [[Player alloc] init];
    self.player2 = [[Player alloc] init];
    NSNumber *one = [NSNumber numberWithInt:1];
    NSNumber *two = [NSNumber numberWithInt:2];
    NSNumber *three = [NSNumber numberWithInt:3];
    NSNumber *four = [NSNumber numberWithInt:4];
    NSNumber *five = [NSNumber numberWithInt:5];
    NSNumber *six = [NSNumber numberWithInt:6];
    NSNumber *seven = [NSNumber numberWithInt:7];
    NSNumber *eight = [NSNumber numberWithInt:8];
    NSNumber *nine = [NSNumber numberWithInt:9];
    
    
    //create win arrays
    //horizontal wins
    NSArray *hWinArray1 = [NSArray arrayWithObjects:one,two,three, nil];
    NSArray *hWinArray2 = [NSArray arrayWithObjects:four,five,six, nil];
    NSArray *hWinArray3 = [NSArray arrayWithObjects:seven,eight,nine, nil];
    
    //vertical wins
    NSArray *vWinArray1 = [NSArray arrayWithObjects:one,four,seven, nil];
    NSArray *vWinArray2 = [NSArray arrayWithObjects:two,five,eight, nil];
    NSArray *vWinArray3 = [NSArray arrayWithObjects:three,six,nine, nil];
    
    //diagonal wins
    NSArray *dWinArray1 = [NSArray arrayWithObjects:one,five,nine, nil];
    NSArray *dWinArray2 = [NSArray arrayWithObjects:seven,five,three, nil];
    
    
    //Initialize win array
    self.winArrays = [NSArray arrayWithObjects:hWinArray1,hWinArray2,hWinArray3,vWinArray1,vWinArray2,vWinArray3,dWinArray1,dWinArray2, nil];
    
    
    
    
    
}

-(void)awakeFromNib{
    
//    cellArray = [NSArray arrayWithObjects:self.cView1,self.cView2,self.cView3,self.cView4,self.cView5,self.cView6,self.cView7,self.cView8,self.cView9, nil];
    
    self.cView1.tag = 1;
    self.cView2.tag = 2;
    self.cView3.tag = 3;
    self.cView4.tag = 4;
    self.cView5.tag = 5;
    self.cView6.tag = 6;
    self.cView7.tag = 7;
    self.cView8.tag = 8;
    self.cView9.tag = 9;
    
    
    //clear mark views
    self.p1CellView.fillRect = NSZeroRect;
    self.p2CellView.fillRect = NSZeroRect;
    
    //initialize game objects
    [self initializeWinArraysAndPlayers];
    
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}



#pragma mark 
- (IBAction)cellClicked:(id)sender {
    
    //Mark or not?
    if (gameFinished) {
        NSRunAlertPanel(@"Game finished", @"Click 'New Game' to play.", @"Ok", Nil, Nil);
        return;
    }
    
    
    if ([sender layer].sublayers.count>0) {
        NSRunAlertPanel(@"Error", @"Already marked", @"Ok",Nil, Nil);
        return;
    }
    
    
    //Get active player and draw the dot
    Player *activePlayer = [self getActivePlayer];
    if (activePlayer) {
        Player *inactivePlayer = [self getInactivePlayer];

        if (activePlayer.markType == Dot) {
            [self drawDotInView:sender withRadius:20];
        }else{
            [self drawCrossInView:sender];
        }

        //call this before changing the BOOL active
        [self decideGameWithTag:[sender tag]]; 

        
        inactivePlayer.active = YES;
        activePlayer.active = NO;
        
    }
        
}


#pragma mark - Drawing methods -


//draw circles 
-(void)drawDotInView:(NSView *)clickedCell withRadius:(CGFloat)rad{
    int radius = rad;
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
    circle.strokeColor = [NSColor NSColorToCGColor:[NSColor whiteColor]];
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


//draw cross
-(void)drawCrossInView:(NSView *)view{
    
    CAShapeLayer *line1 = [CAShapeLayer layer];
    CGMutablePathRef path1 = CGPathCreateMutable();
    
    //Drawing points for first line
    
    CGPoint bottomLeft = CGPointMake(view.frame.size.width*3.0f/8, view.frame.size.height*3.0f/8);
    CGPoint topRight = CGPointMake(view.frame.size.width*5.0f/8, view.frame.size.height*5.0f/8);
    
    CGPathMoveToPoint(path1, NULL, topRight.x, topRight.y);
    CGPathAddLineToPoint(path1, NULL, bottomLeft.x, bottomLeft.y);

    line1.path = path1;
    line1.strokeColor = [NSColor NSColorToCGColor:[NSColor whiteColor]];
    [view.layer addSublayer:line1];
    
    
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
    [line1 addAnimation:drawAnimation forKey:@"drawLine1Animation"];
    
    
    
    
    //Drawing points for second line
    CGPoint topLeft = CGPointMake(view.frame.size.width*3.0f/8, view.frame.size.height*5.0f/8);
    CGPoint bottomRight = CGPointMake(view.frame.size.width*5.0f/8, view.frame.size.height*3.0f/8);
    
    CAShapeLayer *line2 = [CAShapeLayer layer];
    CGMutablePathRef path2 = CGPathCreateMutable();
    
    //Drawing points for first line
    
    
    CGPathMoveToPoint(path2, NULL, topLeft.x, topLeft.y);
    CGPathAddLineToPoint(path2, NULL, bottomRight.x, bottomRight.y);
    
    line2.path = path2;
    line2.strokeColor = [NSColor NSColorToCGColor:[NSColor whiteColor]];
    [view.layer addSublayer:line2];
    
    CABasicAnimation *drawAnimation2 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
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
    [line2 addAnimation:drawAnimation2 forKey:@"drawLine2Animation"];
    
    
}

//change window title
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    self.window.title = [NSString stringWithFormat:@"%@'s turn",[self getActivePlayer].name];
}



#pragma mark - Game logics -

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

-(Player *)getInactivePlayer{
    
    if (self.player1.active == YES) {
        return self.player2;
    }else if(self.player2.active == YES){
        return self.player1;
    }else{
        NSRunAlertPanel(@"Error", @"All players inactive" , @"Ok", Nil, Nil);
        return nil;
    }
    
}



- (IBAction)setPlayersAndStartGame:(id)sender {
    
    //(re)initialize all game variables
    self.nGameWC = [[NewGameWC alloc] initWithWindowNibName:@"NewGame"];
    self.nGameWC.player1 = self.player1;
    self.nGameWC.player2 = self.player2;
    
    
    //add notification when players are set
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(markPlayersWithMarkTypeAndResetBoard:) name:@"PlayersSet" object:self.nGameWC];
    
    
    [self.nGameWC.window makeKeyAndOrderFront:sender];
    
    
    
    
}


-(void)markPlayersWithMarkTypeAndResetBoard:(NSNotification *)notif{
    
    
    //reset board
    gameFinished=NO;

    self.player1 = self.nGameWC.player1;
    self.player2 = self.nGameWC.player2;
    
    NSArray *viewArray = [self.window.contentView subviews];
    for (CellView *cView in viewArray ) {
        NSArray *layerArray = cView.layer.sublayers;
        //cant remove object from array when traversing an array
        //so add it to another array for later removal
        NSMutableArray *removeArray = [NSMutableArray array];
        for (CAShapeLayer *shapes in layerArray) {
            [removeArray addObject:shapes];
        }
        [removeArray makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
        [removeArray removeAllObjects];
        
        
    }
    
    //set the marks on main board against each player
    self.p1CellView.fillRect=self.p1CellView.bounds;
    self.p2CellView.fillRect=self.p2CellView.bounds;
    [self.p1CellView setNeedsDisplay];
    [self.p2CellView setNeedsDisplay];
    if (self.player1.markType == Dot) {
        [self drawDotInView:self.p1CellView withRadius:8];
        [self drawCrossInView:self.p2CellView];
    }else{
        [self drawDotInView:self.p2CellView withRadius:8];
        [self drawCrossInView:self.p1CellView];
    }
    
    
}


-(void)decideGameWithTag:(NSInteger)tag{
    
    //add postition to the marked objects array
    Player *acPlayer = [self getActivePlayer];
    [acPlayer.markArray addObject:[NSNumber numberWithInteger:tag]];
    
    
    
    //test for win
    
//    acPlayer.markArray con
    
    for (NSArray *winArray in self.winArrays) {
        
        NSMutableSet *intersection = [NSMutableSet setWithArray:winArray];
        [intersection intersectSet:[NSSet setWithArray:acPlayer.markArray]];
        if (intersection.count == 3) {
            NSString *winMsg = [NSString stringWithFormat:@" %@ have won. :) \n Start New Game?",acPlayer.name];
            NSInteger status = NSRunAlertPanel(@"Congratulations!!", winMsg, @"Ok", @"Cancel", nil);
            gameFinished = YES;
            if (status == 1) {
                [self setPlayersAndStartGame:nil];
                
                return;
            }else{
                return;
            }
        }
        
    }
    
    if (acPlayer.markArray.count==5) {
        NSInteger status = NSRunAlertPanel(@"Draw", @"Game finished without winner. \n Start new game?", @"Ok", @"Cancel", Nil);
        if (status==1) {
            [self setPlayersAndStartGame:nil];
            gameFinished=NO;
        }else{
            gameFinished=YES;
            return;
        }
    }

//    NSArray *winArrays = [
    
    
    
}


@end



























