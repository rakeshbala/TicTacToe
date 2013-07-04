//
//  Player.m
//  TicTacToe
//
//  Created by rakesh on 03/07/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "Player.h"

@implementation Player
@synthesize markType = _markType;
@synthesize name = _name;
@synthesize active=_active;
@synthesize markArray=_markArray;


- (id)init {
    self = [super init];
    if (self) {
        _markArray = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
