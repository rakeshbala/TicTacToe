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
@synthesize fillRect;
- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
        [self setWantsLayer:YES];
        fillRect = self.bounds;
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    // Drawing code here.
    NSRect tempRect = self.fillRect;
    [[NSColor blackColor] set];
    tempRect.size.width-=2;;
    tempRect.size.height-=2;
    tempRect.origin.x++;
    tempRect.origin.y++;
    NSRectFill(tempRect);
   
}



@end
