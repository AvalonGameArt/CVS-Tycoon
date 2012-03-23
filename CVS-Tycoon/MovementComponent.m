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
-(Vector2D) seek:(Vector2D)targetPos;
-(Vector2D) flee:(Vector2D)targetPos;
-(Vector2D) arrive:(Vector2D)targetPos deceleration:(float)dSpeed;
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
    Vector2D steer = CGPointZero;
    if(owner != nil)
    {
        Vector2D currentPosition = [owner position];
        if(ccpDistanceSQ(currentPosition, targetPos) > 0.0f)
        {
            Vector2D direction = ccpNormalize(ccpSub(targetPos, currentPosition));
            Vector2D desiredVelocity = ccpMult(direction, [owner maxSpeed]);
            
            steer = ccpSub(desiredVelocity, [owner velocity]);
        }
    }
    return steer;
}

-(Vector2D) flee:(Vector2D)targetPos
{
    Vector2D steer = CGPointZero;
    if(owner != nil)
    {
        Vector2D currentPosition = [owner position];
        if(ccpDistanceSQ(currentPosition, targetPos) > 0.0f)
        {
            Vector2D direction = ccpNormalize(ccpSub(currentPosition, targetPos));
            Vector2D desiredVelocity = ccpMult(direction, [owner maxSpeed]);
            
            steer = ccpSub(desiredVelocity, [owner velocity]);
        }
    }
    return steer;
}

-(Vector2D) arrive:(Vector2D)targetPos deceleration:(float)dSpeed
{
    Vector2D steer = CGPointZero;
    if(owner != nil)
    {
        Vector2D off = ccpSub(targetPos, [owner position]);
        float offLength = ccpLength(off);
        if(offLength > 0.0f)
        {
            const float tweaker = 1.0f;
            float speed = offLength / (dSpeed * tweaker);
            speed = min(speed, [owner maxSpeed]);
            
            Vector2D desiredVelocity = ccpMult(ccpMult(off, 1.0f/offLength), speed);
            
            steer = ccpSub(desiredVelocity, [owner velocity]);
        }
    }
    return steer;    
}

-(Vector2D)calculate
{
    Vector2D force = CGPointZero;
    if([self seekOn])
        force = ccpAdd(force, [self seek:[self targetPosition]]);
    if([self fleeOn])
        force = ccpAdd(force, [self flee:[self targetPosition]]);
    if([self arriveOn])
        force = ccpAdd(force, [self arrive:[self targetPosition] deceleration:1.0f]);
    if(ccpLengthSQ(force) > 0.0f)
    {
        Vector2D dir = ccpNormalize(force);
        Vector2D maxF = ccpMult(dir, [owner maxForce]);
        force = ccpClamp(force, ccpNeg(maxF), maxF);
    }
    return force;
}

-(CGRect)adjustedBoundingBox
{
    return [self boundingBox];
}

@end
