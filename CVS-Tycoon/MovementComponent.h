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
@property (nonatomic) CGPoint offset;

@property (nonatomic) BOOL seekOn;
@property (nonatomic) BOOL fleeOn;
@property (nonatomic) BOOL arriveOn;
@property (nonatomic) BOOL wanderOn;
@property (nonatomic) BOOL followPathOn;
@property (nonatomic) BOOL pursuitOn;
@property (nonatomic) BOOL offsetPursuitOn;
@property (nonatomic) BOOL evadeOn;
@property (nonatomic) BOOL interposeOn;
@property (nonatomic) BOOL hideOn;
@property (nonatomic) BOOL obstacleAvoidanceOn;
@property (nonatomic) BOOL wallAvoidanceOn;
@property (nonatomic) BOOL cohesionOn;
@property (nonatomic) BOOL separationOn;
@property (nonatomic) BOOL allignmentOn;

-(void) updateVertexZ;
-(void) update:(ccTime)deltaTime;

-(id) initWithOwner:(GameObject*)newOwner WithTileMap:(MapNavInfo*) mapInfo;

-(CGRect)adjustedBoundingBox;

@end
