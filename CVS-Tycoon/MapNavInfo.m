//
//  MapNavInfo.m
//  CVS-Tycoon
//
//  Created by Zhang Zhe on 3/4/12.
//  Copyright (c) 2012 AvalonGameArt. All rights reserved.
//

#import "MapNavInfo.h"

@implementation MapNavInfo

@synthesize mapNode, mapNavigationInfo, mapTileSize, mapBorderSize, mapSize;

-(id)initWithMapNode:(CCTMXTiledMap *)tileMapNode
{
    self = [super init];
    if(self)
    {
        mapNode = tileMapNode;
        mapBorderSize = CGSizeMake(0.0f, 0.0f);
        mapTileSize = [mapNode tileSize];
        mapSize = [mapNode mapSize];
        
        for(int i = 0; i != mapSize.height; ++i)
            for(int j = 0; j != mapSize.width; ++j)
            {
                CGPoint tilePos = ccp(j,i);
                
                BOOL isBlocked = [self isTilePosBlocked:tilePos];
                mapInfoMatrix[j][i] = isBlocked;
            }
    }
    return self;
}

-(BOOL) isTilePosBlocked:(CGPoint)tilePos
{
	CCTMXLayer* layer = [mapNode layerNamed:@"Collisions"];
	NSAssert(layer != nil, @"Collisions layer not found!");
	
	bool isBlocked = NO;
	unsigned int tileGID = [layer tileGIDAt:tilePos];
	if (tileGID > 0)
	{
		NSDictionary* tileProperties = [mapNode propertiesForGID:tileGID];
		id blocks_movement = [tileProperties objectForKey:@"blocks_movement"];
		isBlocked = (blocks_movement != nil);
	}
    
	return isBlocked;
}

-(int) getTileBlocked:(CGPoint)tilePos
{
    return mapInfoMatrix[(int)(tilePos.x)][(int)(tilePos.y)];
}

-(void) setTileBlocked:(CGPoint)tilePos with:(int)value
{
    mapInfoMatrix[(int)(tilePos.x)][(int)(tilePos.y)] = value;
}

@end
