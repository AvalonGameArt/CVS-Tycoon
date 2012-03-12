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

@synthesize path, velocity, heading, siding, mass, maxSpeed, maxForce, targetPosition, targetEntity;

-(id)init
{
    self = [super init];
    if(self)
    {
        velocity = CGPointZero;
        heading = CGPointZero;
        siding = CGPointZero;
        mass = 1.0f;
        maxSpeed = 1.0f;
        maxForce = 1.0f;
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
    
    if(mapInfo != nil)
        lowestZ = -([mapInfo mapSize].width + [mapInfo mapSize].height);
    
    if(owner != nil)
    {
        currentZ = [owner position].x + [owner position].y;
        float finalZ = lowestZ + currentZ - 1;
        [owner setVertexZ:finalZ];
    }
}

-(Vector2D) Seek:(Vector2D)targetPos
{
    Vector2D currentPosition = [self position];
    Vector2D direction = ccpNormalize(ccpSub(targetPos, currentPosition));
    Vector2D desiredVelocity = ccpMult(direction, [self maxSpeed]);
        
    return ccpSub(desiredVelocity, [self velocity]);        
}

-(Vector2D)Calculate
{
    return CGPointZero;
}

-(CGRect)adjustedBoundingBox
{
    return [self boundingBox];
}

-(void)update:(ccTime)deltaTime
{
    Vector2D force = [self Calculate];
    Vector2D acceleration = ccpMult(force, 1.0f/[self mass]);
    Vector2D deltaVelocity = ccpMult(acceleration, deltaTime);
    Vector2D velocitySum = ccpAdd([self velocity], deltaVelocity);
    [self setVelocity: ccpClamp(velocitySum, CGPointZero, ccpMult(ccpNormalize(velocitySum), [self maxSpeed]))];
    CGPoint newPos = ccpAdd([self position], ccpMult([self velocity], deltaTime));
    if(owner != nil)
        [owner setPosition:newPos];
    
    if(ccpLengthSQ([self velocity]) > 0.00000001f)
    {
        [self setHeading:ccpNormalize([self velocity])];
        [self setSiding:ccpPerp([self heading])];        
    }
    
    [self updateVertexZ];
}

@end
