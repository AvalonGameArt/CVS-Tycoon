//
//  CCAnimation+AnimHelper.m
//  CVS-Tycoon
//
//  Created by ZHANG ZHE on 1/13/12.
//  Copyright (c) 2012 AvalonGameArt. All rights reserved.
//

#import "Categories.h"

@implementation CCAnimation (AnimHelper)

+(CCAnimation*) animationWithFrame:(NSString *)frameBaseName frameCountBegin:(int)beg frameCountEnd:(int)end delay:(float)delay
{
    NSMutableArray* frames = [NSMutableArray arrayWithCapacity:end-beg+1];
    for (int i = beg; i<= end; ++i) {
        NSString* file = [NSString stringWithFormat:@"%@%i", frameBaseName, i];
        CCSpriteFrameCache* frameCache = [CCSpriteFrameCache sharedSpriteFrameCache];
        CCSpriteFrame* frame = [frameCache spriteFrameByName:file];
        [frames addObject:frame];
    }
    return [CCAnimation animationWithSpriteFrames:frames delay:delay];
}

@end

@implementation CCNode (Singleton)

+(id)sharedInstance
{
    static CCNode* inst;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        inst = [[CCNode alloc] init];
    });
    return inst;
}

@end

@implementation CCLayer (CCTMXMap)

-(CGPoint) locationFromTouch:(UITouch*)touch
{
    CGPoint touchLocation = [touch locationInView: [touch view]];		
    touchLocation = [[CCDirector sharedDirector] convertToGL: touchLocation];
    
    return touchLocation;
}

-(CGPoint) tilePosFromLocation:(CGPoint)location tileMap:(CCTMXTiledMap*)tileMap
{
    CGPoint result = CGPointZero;
    if([tileMap mapOrientation] == CCTMXOrientationOrtho)
    {
        location = ccpSub(location, [tileMap position]);
        int newX = floor(location.x / [tileMap tileSize].width);
        int newY = floor(([tileMap mapSize].height * [tileMap tileSize].height - location.y) / [tileMap tileSize].height);  
        result = ccp(newX, newY);
    }
    else if([tileMap mapOrientation] == CCTMXOrientationIso)
    {
        CGPoint pos = ccpSub(tileMap.position, location);
        float tileWidth = [tileMap tileSize].width;
        float tileHeight = [tileMap tileSize].height;
        float halfMapWidth = [tileMap mapSize].width / 2.0f;
        float mapHeight = [tileMap mapSize].height;
        
        CGPoint tilePosDiv = ccp(pos.x / tileWidth, pos.y / tileHeight);
        float inverseTileY = mapHeight - tilePosDiv.y;
        
        //http://www.gandraxa.com/isometric_projection.xml
        int newX = floor(inverseTileY + tilePosDiv.x - halfMapWidth);
        int newY = floor(inverseTileY - tilePosDiv.x + halfMapWidth);
        result = ccp(newX, newY);
    }
    return result;
}


@end
