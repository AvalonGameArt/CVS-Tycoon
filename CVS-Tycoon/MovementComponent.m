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

@interface MovementComponent()
-(Vector2D) Seek:(Vector2D)targetPosition;

@end

@implementation MovementComponent

@synthesize path, velocity, heading, siding, mass;

-(id)init
{
    self = [super init];
    if(self)
    {
        velocity = CGPointZero;
        heading = CGPointZero;
        siding = CGPointZero;
        mass = 1.0f;        
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

-(CGRect)adjustedBoundingBox
{
    return [self boundingBox];
}

-(Vector2D) Seek:(Vector2D)targetPosition
{
    return CGPointZero;
}

@end
