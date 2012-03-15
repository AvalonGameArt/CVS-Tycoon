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
#import "MovingObject.h"

@interface MovementComponent()
-(Vector2D) seek:(Vector2D)targetPosition;

@end

@implementation MovementComponent

@synthesize path, targetPosition, offset;
@synthesize seekOn, fleeOn, arriveOn, wanderOn, followPathOn, pursuitOn, offsetPursuitOn, evadeOn, interposeOn, hideOn, obstacleAvoidanceOn, wallAvoidanceOn, cohesionOn, separationOn, allignmentOn;

-(id)init
{
    self = [super init];
    if(self)
    {
        seekOn = NO;
        fleeOn = NO;
        arriveOn = NO;
        wanderOn = NO;
        followPathOn = NO;
        pursuitOn = NO;
        offsetPursuitOn = NO;
        evadeOn = NO;
        interposeOn = NO;
        hideOn = NO;
        obstacleAvoidanceOn = NO;
        wallAvoidanceOn = NO;
        cohesionOn = NO;
        separationOn = NO;
        allignmentOn = NO;
    }
    
    return self;
}

-(id) initWithOwner:(MovingObject*)newOwner WithTileMap:(MapNavInfo*) mapNavInfo
{
    self = [self init];
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
    
    if(mapInfo != nil)
        lowestZ = -([mapInfo mapSize].width + [mapInfo mapSize].height);
    
    if(owner != nil)
    {
        currentZ = [owner position].x + [owner position].y;
        float finalZ = lowestZ + currentZ - 1;
        [owner setVertexZ:finalZ];
    }
}

-(Vector2D) seek:(Vector2D)targetPos
{
    if(owner != nil)
    {
        Vector2D currentPosition = [owner position];
        Vector2D direction = ccpNormalize(ccpSub(targetPos, currentPosition));
        Vector2D desiredVelocity = ccpMult(direction, [owner maxSpeed]);
        
        return ccpSub(desiredVelocity, [owner velocity]);        
    }
    return CGPointZero;
}

-(Vector2D)calculate
{
    Vector2D force = CGPointZero;
    if([self seekOn])
    {
        force = [self seek:[self targetPosition]];
    }
    return force;
}

-(CGRect)adjustedBoundingBox
{
    return [self boundingBox];
}

-(void)update:(ccTime)deltaTime
{
    Vector2D force = [self calculate];
    Vector2D acceleration = ccpMult(force, 1.0f/[owner mass]);
    Vector2D deltaVelocity = ccpMult(acceleration, deltaTime);
    Vector2D velocitySum = ccpAdd([owner velocity], deltaVelocity);
    Vector2D velocityMax = ccpMult(ccpNormalize(velocitySum), [owner maxSpeed]);
    if(ccpLengthSQ(velocitySum) == 0.0f)
        velocityMax = CGPointZero;
    Vector2D newVelocity = ccpClamp(velocitySum, CGPointZero, velocityMax);
    [owner setVelocity: newVelocity];
    if(owner != nil)
    {
        CGPoint newPos = ccpAdd([owner position], ccpMult([owner velocity], deltaTime));
        [owner setPosition:newPos];
    }
    
    if(ccpLengthSQ([owner velocity]) > 0.00000001f)
    {
        [owner setHeading:ccpNormalize([owner velocity])];
        [owner setSiding:ccpPerp([owner heading])];        
    }
    
    [self updateVertexZ];
}

@end
