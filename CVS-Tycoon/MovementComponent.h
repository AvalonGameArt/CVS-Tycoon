//
//  MovementComponent.h
//  CVS-Tycoon
//
//  Created by zhe zhang on 12-2-16.
//  Copyright (c) 2012年 AvalonGameArt. All rights reserved.
//

@class GameObject;

@interface MovementComponent : CCNode
{
@private __weak GameObject* owner;
@private __weak CCTMXTiledMap* tileMap;
}

-(void) updateVertexZ;
-(void) update:(ccTime)deltaTime;

-(id) initWithOwner:(GameObject*)newOwner WithTileMap:(CCTMXTiledMap*) tileMapNode;

@end
