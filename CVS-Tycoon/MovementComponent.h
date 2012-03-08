//
//  MovementComponent.h
//  CVS-Tycoon
//
//  Created by zhe zhang on 12-2-16.
//  Copyright (c) 2012年 AvalonGameArt. All rights reserved.
//

@class MapNavInfo;
@class GameObject;

@interface MovementComponent : CCNode
{
@private __weak GameObject* owner;
@private __weak MapNavInfo* mapInfo;
}

@property (strong, nonatomic) CCArray* path;
@property (nonatomic) CGPoint velocity;
@property (nonatomic) CGPoint heading;
@property (nonatomic) CGPoint siding;
@property (nonatomic) float mass;


-(void) updateVertexZ;
-(void) update:(ccTime)deltaTime;

-(id) initWithOwner:(GameObject*)newOwner WithTileMap:(MapNavInfo*) mapInfo;

-(CGRect)adjustedBoundingBox;

@end
