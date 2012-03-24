//
//  MovingObject.h
//  CVS-Tycoon
//
//  Created by zhe zhang on 12-3-14.
//  Copyright (c) 2012年 AvalonGameArt. All rights reserved.
//

#import "GameObject.h"
#import "MovementComponent.h"

@interface MovingObject : GameObject
{
    __strong MovementComponent* moveComp;

}

@property (nonatomic) Vector2D velocity;
@property (nonatomic) Vector2D heading;
@property (nonatomic) Vector2D siding;
@property (nonatomic) float mass;
@property (nonatomic) float maxSpeed;
@property (nonatomic) float maxForce;

-(id) initWithMapInfo:(MapNavInfo*)mapNode;

-(void) moveTo:(Vector2D)targetPosition;
-(void) followPath:(CCArray*)pathArray;

@end
