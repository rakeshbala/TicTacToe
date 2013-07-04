//
//  CellView.m
//  TicTacToe
//
//  Created by rakesh on 02/07/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "CellView.h"


@implementation CellView
//@synthesize circle;//drawAnimation;
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

   
}



@end
