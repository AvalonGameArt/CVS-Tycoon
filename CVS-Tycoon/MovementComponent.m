//
//  MovementComponent.m
//  CVS-Tycoon
//
//  Created by zhe zhang on 12-2-16.
//  Copyright (c) 2012年 AvalonGameArt. All rights reserved.
//

// boat test code commit
#import "MovementComponent.h"
#import "GameObject.h"

@implementation MovementComponent

-(id)init
{
    self = [super init];
    if(self)
    {
        
    }
    
    return self;
}

-(id) initWithOwner:(GameObject*)newOwner WithTileMap:(CCTMXTiledMap*) tileMapNode
{
    self = [super init];
    if(self)
    {
        owner = newOwner;
        tileMap = tileMapNode;
    }
    return self;
}

-(void) updateVertexZ
{
    float lowestZ = 0.0f;
    float currentZ = 0.0f;
    
    if(tileMap)
        lowestZ = -([tileMap mapSize].width + [tileMap mapSize].height);
    
    if(owner)
    {
        currentZ = [owner position].x + [owner position].y;
        float finalZ = lowestZ + currentZ - 1;
        [owner setVertexZ:finalZ];
    }
}

-(void)update:(ccTime)deltaTime
{
    [self updateVertexZ];
}

@end
