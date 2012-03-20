//
//  MovingObject.m
//  CVS-Tycoon
//
//  Created by zhe zhang on 12-3-14.
//  Copyright (c) 2012年 AvalonGameArt. All rights reserved.
//

#import "MovingObject.h"

@implementation MovingObject

@synthesize velocity, heading, siding, mass, maxSpeed, maxForce;

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


-(id)initWithMapInfo:(MapNavInfo *)mapNode
{
    self = [self init];
    if(self)
    {
        moveComp = [[MovementComponent alloc] initWithOwner:self WithTileMap:mapNode];
        [self setMaxSpeed:10.0f];        
    }
    return self;
}

-(void)update:(ccTime)deltaTime
{
    [super update:deltaTime];
    Vector2D force = [moveComp calculate];
    Vector2D acceleration = ccpMult(force, 1.0f/[self mass]);
    Vector2D deltaVelocity = ccpMult(acceleration, deltaTime);
    Vector2D velocityFinal = ccpAdd([self velocity], deltaVelocity);
    if(ccpLengthSQ(velocityFinal) > 0.01f)
    {
        Vector2D velocityMax = ccpMult(ccpNormalize(velocityFinal), [self maxSpeed]);
        velocityFinal = ccpClamp(velocityFinal, ccpNeg(velocityMax), velocityMax);
        [self setVelocity:velocityFinal];
        [self setHeading:ccpNormalize(velocityFinal)];
        [self setSiding:ccpPerp([self heading])];
        
        Vector2D deltaPosition = ccpMult(velocityFinal, deltaTime);
        Vector2D positionFinal = ccpAdd([self position], deltaPosition);
        [self setPosition:positionFinal];        
    }
    else
    {
        [self setVelocity:CGPointZero];
    }
}

-(void)moveTo:(Vector2D)targetPosition
{
    [moveComp setTargetPosition:targetPosition];
//    [moveComp setSeekOn:YES];
    [moveComp setArriveOn:YES];
}


@end
