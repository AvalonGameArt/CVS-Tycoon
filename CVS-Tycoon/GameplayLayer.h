//
//  GameplayLayer.h
//  CVS-Tycoon
//
//  Created by Zhang Zhe on 9/22/11.
//  Copyright 2011 AvalonGameArt. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CommonProtocols.h"
#import "Categories.h"

@interface GameplayLayer : CCLayer
{
    CCSpriteBatchNode* sceneSpriteBatchNode;
    CCTMXTiledMap* tiledMapNode;
@private CGPoint beginPoint;
@private CCArray* pathArray;
}

@property (strong, nonatomic) CCSpriteBatchNode* sceneSpriteBatchNode;
@property (strong, nonatomic) CCTMXTiledMap* tiledMapNode;
@property (strong, nonatomic) CCTMXLayer* backgroundLayer;
@property (strong, nonatomic) CCTMXLayer* groundObjectLayer;
@property (strong, nonatomic) CCTMXLayer* objectLayer;
@property (strong, nonatomic) CCTMXLayer* collisionLayer;

@property (nonatomic) CGPoint playableAreaOrig;
@property (nonatomic) CGPoint playableAreaEnd;

-(CGPoint)locationFromTouch:(UITouch*)touch;
-(CGPoint) tilePosFromLocation:(CGPoint)location tileMap:(CCTMXTiledMap*)tileMap;
-(CGPoint) truncateInPlayableArea:(CGPoint)position;

@end
