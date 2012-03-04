//
//  MapNavInfo.m
//  CVS-Tycoon
//
//  Created by Zhang Zhe on 3/4/12.
//  Copyright (c) 2012 AvalonGameArt. All rights reserved.
//

#import "MapNavInfo.h"

@implementation MapNavInfo

@synthesize mapNavigationInfo, mapTileSize, mapBorderSize, mapSize;

-(id)initWithMapNode:(CCTMXTiledMap *)mapNode
{
    self = [super init];
    if(self)
    {
        mapBorderSize = CGSizeMake(0.0f, 0.0f);
        
    }
    return self;
}

@end
