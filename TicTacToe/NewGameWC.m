//
//  NewGameWC.m
//  TicTacToe
//
//  Created by rakesh on 03/07/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "NewGameWC.h"

@implementation NewGameWC
@synthesize player1Name;
@synthesize player2Name;
@synthesize player1;
@synthesize player2;
- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (IBAction)startGame:(id)sender {
    //init players (this is where the object is first created . Not from MainWC)
    self.player1 = [[Player alloc] init];
    self.player2 = [[Player alloc] init];
    
    
    
    //Check for blanks
    NSString *p1Str = [self.player1Name.stringValue stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *p2Str = [self.player2Name.stringValue stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    if ([p1Str isEqualToString:@""] || p1Str == nil || [p2Str isEqualToString:@""] || p2Str == nil) {
        NSRunAlertPanel(@"Error", @"Blank values not allowed", @"Ok", Nil, Nil);
        return;
    }
    
    //assign name
    self.player1.name = [self.player1Name.stringValue uppercaseString];
    self.player2.name = [self.player2Name.stringValue uppercaseString];
    
    
    
    
    //Decide first chance and mark type randomly
    BOOL dotCross = arc4random()%2;
    
    if (dotCross) {
        player1.markType = Dot;
        player2.markType = Cross;
        player1.active = YES;
    }else{
        player1.markType = Cross;
        player2.markType = Dot;
        player2.active = YES;
    }
    
    //post the notification that everything is done
    [[NSNotificationCenter defaultCenter] postNotificationName:@"PlayersSet" object:self];
    [self.window close];
}

- (IBAction)closeWindow:(id)sender {
    [self.window close];
}
@end
