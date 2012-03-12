//
//  MovementComponent.h
//  CVS-Tycoon
//
//  Created by zhe zhang on 12-2-16.
//  Copyright (c) 2012年 AvalonGameArt. All rights reserved.
//

@class MapNavInfo;
@class GameObject;
typedef CGPoint Vector2D;

@interface MovementComponent : CCNode
{
@private __weak GameObject* owner;
@private __weak MapNavInfo* mapInfo;
}

@property (strong, nonatomic) CCArray* path;
@property (nonatomic) Vector2D velocity;
@property (nonatomic) Vector2D heading;
@property (nonatomic) Vector2D siding;
@property (nonatomic) float mass;
@property (nonatomic) float maxSpeed;
@property (nonatomic) float maxForce;
@property (nonatomic) CGPoint targetPosition;
@property (weak, nonatomic) GameObject* targetEntity;


-(void) updateVertexZ;
-(void) update:(ccTime)deltaTime;

-(id) initWithOwner:(GameObject*)newOwner WithTileMap:(MapNavInfo*) mapInfo;

-(CGRect)adjustedBoundingBox;

@end
