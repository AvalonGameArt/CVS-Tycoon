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
    [moveComp update:deltaTime];
}

-(void)moveTo:(Vector2D)targetPosition
{
    [moveComp setTargetPosition:targetPosition];
    [moveComp setSeekOn:YES];
    [self setMaxSpeed:20.0f];
}


@end
