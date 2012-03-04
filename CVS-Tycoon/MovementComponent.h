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

-(void) updateVertexZ;
-(void) update:(ccTime)deltaTime;

-(id) initWithOwner:(GameObject*)newOwner WithTileMap:(MapNavInfo*) mapInfo;

@end
