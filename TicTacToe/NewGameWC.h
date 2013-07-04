//
//  NewGameWC.h
//  TicTacToe
//
//  Created by rakesh on 03/07/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Player.h"

@interface NewGameWC : NSWindowController{
    Player *player1;
    Player *player2;
    
}

@property (strong,nonatomic) Player *player1;
@property (strong,nonatomic) Player *player2;
@property (assign) IBOutlet NSTextField *player1Name;
@property (assign) IBOutlet NSTextField *player2Name;
- (IBAction)startGame:(id)sender;
- (IBAction)closeWindow:(id)sender;

@end
