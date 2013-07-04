//
//  MainWC.h
//  TicTacToe
//
//  Created by rakesh on 03/07/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CellView.h"
#import "Player.h"
#import "NewGameWC.h"

@interface MainWC : NSWindowController{
    
    Player *_player1;
    Player *_player2;
    
    
    NewGameWC *_nGameWC;
    
}
 
@property (strong) Player *player1;
@property (strong) Player *player2;

@property (assign) IBOutlet CellView *cView1;
@property (assign) IBOutlet CellView *cView2;
@property (assign) IBOutlet CellView *cView3;
@property (assign) IBOutlet CellView *cView4;
@property (assign) IBOutlet CellView *cView5;
@property (assign) IBOutlet CellView *cView6;
@property (assign) IBOutlet CellView *cView7;
@property (assign) IBOutlet CellView *cView8;
@property (assign) IBOutlet CellView *cView9;

@property (assign) IBOutlet CellView *p1CellView;
@property (assign) IBOutlet CellView *p2CellView;

@property (assign) IBOutlet NSTextField *p1Label;
@property (assign) IBOutlet NSTextField *p2Label;

@property (strong) NewGameWC *nGameWC;


- (IBAction)cellClicked:(id)sender;
- (IBAction)setPlayersAndStartGame:(id)sender;


-(void)drawDotInView:(NSView *)view;
-(void)drawCrossInView:(NSView *)view;

#pragma mark - get players -
-(Player *)getActivePlayer;
-(Player *)getInactivePlayer;

@end
