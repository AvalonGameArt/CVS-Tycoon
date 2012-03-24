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
-(Vector2D) seek:(CGPoint)targetPos;
-(Vector2D) flee:(CGPoint)targetPos;
-(Vector2D) arrive:(CGPoint)targetPos withUpdateTime:(ccTime)deltaTime;
-(Vector2D) followPathWithUpdateTime:(ccTime)deltaTime;
@end

@implementation MovementComponent

@synthesize pathArray, targetPosition, offset;
@synthesize seekOn, fleeOn, arriveOn, wanderOn, followPathOn, pursuitOn, offsetPursuitOn, evadeOn, interposeOn, hideOn, obstacleAvoidanceOn, wallAvoidanceOn, cohesionOn, separationOn, allignmentOn;

-(id)init
{
    self = [super init];
    if(self)
    {
        [self turnAllSteerOff];
        pathArray = [[CCArray alloc] init];
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

-(void) turnAllSteerOff
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

-(Vector2D) seek:(CGPoint)targetPos
{
    Vector2D force = CGPointZero;
    if(owner != nil)
    {
        CGPoint currentPosition = [owner position];
        if(ccpDistanceSQ(currentPosition, targetPos) > 0.0f)
        {
            Vector2D direction = ccpNormalize(ccpSub(targetPos, currentPosition));
            Vector2D desiredVelocity = ccpMult(direction, [owner maxSpeed]);
            
            Vector2D deltaVelocity = ccpSub(desiredVelocity, [owner velocity]);
            if(ccpLengthSQ(deltaVelocity) > 0.0f)
            {
                force = ccpMult(ccpNormalize(deltaVelocity), [owner maxForce]);            
            }
        }
    }
    return force;
}

-(Vector2D) flee:(CGPoint)targetPos
{
    Vector2D force = CGPointZero;
    if(owner != nil)
    {
        CGPoint currentPosition = [owner position];
        if(ccpDistanceSQ(currentPosition, targetPos) > 0.0f)
        {
            Vector2D off = ccpSub(currentPosition, targetPos);
            Vector2D direction = ccpNormalize(off);
            float tweaker = ceil(ccpLength(off) / 10.0f);
            Vector2D desiredVelocity = ccpMult(direction, [owner maxSpeed]/tweaker);
            Vector2D deltaVelocity = ccpSub(desiredVelocity, [owner velocity]);
            if(ccpLengthSQ(deltaVelocity) > 0.0f)
            {
                force = ccpMult(ccpNormalize(deltaVelocity), [owner maxForce]);
            }
        }
    }
    return force;
}

-(Vector2D) arrive:(CGPoint)targetPos withUpdateTime:(ccTime)deltaTime
{
    Vector2D force = CGPointZero;
    if(owner != nil)
    {
        float breakDist = [owner mass] * ccpLengthSQ([owner velocity]) / [owner maxForce] / 2.0f;
        CGPoint currentPosition = [owner position];
        Vector2D off = ccpSub(targetPos, currentPosition);
        float offLength = ccpLength(off);
        force = [self seek:targetPos];
        float stepLength = ccpLength([owner velocity]) * deltaTime + ccpLength(ccpMult(force, 1.0f / [owner mass])) * deltaTime * deltaTime / 2.0f;
        if(offLength <= breakDist + stepLength)
        {
            float lengSQ = ccpLengthSQ([owner velocity]);
            if(lengSQ > 0.0f)
            {
                Vector2D direct = ccpNeg(ccpNormalize([owner velocity]));
                force = ccpMult(direct, [owner mass] * lengSQ * 0.5f / offLength);
            }
            else
                force = CGPointZero;
        }
    }
    return force;    
}

-(Vector2D)followPathWithUpdateTime:(ccTime)deltaTime
{
    Vector2D force = CGPointZero;
    if([pathArray count] != 0 && owner != nil)
    {
        NSValue* val = [pathArray lastObject];
        CGPoint targetPos = [val CGPointValue];
        if(ccpDistanceSQ([owner position], targetPos) < 4.0f && [pathArray count] > 1)
        {
            [pathArray removeLastObject];            
        }
        force = [self arrive:targetPos withUpdateTime:deltaTime];
    }
    return force;
}

-(Vector2D)calculate:(ccTime)deltaTime
{
    Vector2D force = CGPointZero;
    if([self seekOn])
        force = ccpAdd(force, [self seek:[self targetPosition]]);
    if([self fleeOn])
        force = ccpAdd(force, [self flee:[self targetPosition]]);
    if([self arriveOn])
        force = ccpAdd(force, [self arrive:[self targetPosition] withUpdateTime:deltaTime]);
    if([self followPathOn])
        force = ccpAdd(force, [self followPathWithUpdateTime:deltaTime]);
    
    if(ccpLengthSQ(force) > 0.0f && owner != nil)
    {
        Vector2D forceMax = ccpMult(ccpNormalize(force), [owner maxForce]);
        force = ccpClamp(force, ccpNeg(forceMax), forceMax);
    }
    return force;
}

-(CGRect)adjustedBoundingBox
{
    return [self boundingBox];
}

@end
