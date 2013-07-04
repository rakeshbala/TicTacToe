//
//  Player.h
//  TicTacToe
//
//  Created by rakesh on 03/07/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    Dot = 0,
    Cross = 1
}TTMarkType;

@interface Player : NSObject{
    NSString *_name;
    TTMarkType _markType;
    BOOL _active;
    NSMutableArray *_markArray;
    
}
@property (nonatomic) TTMarkType markType;
@property (strong,nonatomic)NSString *name;
@property (nonatomic) BOOL active;
@property (strong) NSMutableArray *markArray;
@end
