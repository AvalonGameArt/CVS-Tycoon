//
//  NavigationNode.m
//  CVS-Tycoon
//
//  Created by zhe zhang on 12-2-20.
//  Copyright (c) 2012年 AvalonGameArt. All rights reserved.
//

#import "NavigationNode.h"

@implementation NavigationNode

@synthesize gScore, hScore, tilePosition;

+(id)nodeWithTilePosition:(CGPoint)tilePos
{
}

-(id)initWithTilePosition:(CGPoint)tilePos
{
    self = [super init];
    if(self)
    {
        [self setTilePosition:tilePos];
        [self setGScore:0];
        [self setHScore:0];
    }
    return self;
}

-(int)fScore
{
    return gScore + hScore;
}

-(BOOL)isEqual:(NavigationNode *)rhs
{
    return CGPointEqualToPoint([self tilePosition], [rhs tilePosition]);
}

@end
