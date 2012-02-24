//
//  PathPlanner.m
//  CVS-Tycoon
//
//  Created by zhe zhang on 12-2-20.
//  Copyright (c) 2012年 AvalonGameArt. All rights reserved.
//

#import "PathPlanner.h"

@implementation PathPlanner

@synthesize startPoint, targetPoint;

-(id)initWithTileMap:(CCTMXTiledMap*)tileMap
{
    self = [super init];
    if(self)
    {
//        [self setStartPoint:[NavigationNode initWithTilePosition:ccp(0,0)]];
//        [self setTargetPoint:[NavigationNode initWithTilePosition:ccp(0,0)]];
    }
    return self;
}

-(NSMutableArray*)planPath
{
    NSMutableArray* openList = [NSMutableArray arrayWithCapacity:4];
    NSMutableArray* closeList = [NSMutableArray arrayWithCapacity:4];
    NSMutableArray* path = [NSMutableArray arrayWithCapacity:4];
    
    
    
    NavigationNode* curNode = [NavigationNode nodeWithTilePosition:[self position]];
    
    if(ccpDistance([curNode tilePosition], [targetPoint tilePosition]) < 4)
    {
        [path addObject:curNode];
    }
    
    
    
    return path;
}

@end
