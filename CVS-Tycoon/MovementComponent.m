//
//  MovementComponent.m
//  CVS-Tycoon
//
//  Created by zhe zhang on 12-2-16.
//  Copyright (c) 2012年 AvalonGameArt. All rights reserved.
//

// boat test code commit

#import "MapNavInfo.h"
#import "MovementComponent.h"
#import "GameObject.h"

@implementation MovementComponent

@synthesize path;

-(id)init
{
    self = [super init];
    if(self)
    {
        
    }
    
    return self;
}

-(id) initWithOwner:(GameObject*)newOwner WithTileMap:(MapNavInfo*) mapNavInfo
{
    self = [super init];
    if(self)
    {
        owner = newOwner;
        mapInfo = mapNavInfo;
    }
    return self;
}

-(void) updateVertexZ
{
    float lowestZ = 0.0f;
    float currentZ = 0.0f;
    
    if(mapInfo)
        lowestZ = -([mapInfo mapSize].width + [mapInfo mapSize].height);
    
    if(owner)
    {
        currentZ = [owner position].x + [owner position].y;
        float finalZ = lowestZ + currentZ - 1;
        [owner setVertexZ:finalZ];
    }
}

-(void)update:(ccTime)deltaTime
{
    [self updateVertexZ];
}

@end
