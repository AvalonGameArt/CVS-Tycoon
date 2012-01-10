//
//  GameplayLayer.h
//  CVS-Tycoon
//
//  Created by Zhang Zhe on 9/22/11.
//  Copyright 2011 AvalonGameArt. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "cocos2d.h"

#import "CommonProtocols.h"

@interface GameplayLayer : CCLayer
{
    CCSpriteBatchNode* sceneSpriteBatchNode;
    CCTMXTiledMap* tiledMapNode;
    CGPoint beginPoint;
}

@property (strong, nonatomic) CCSpriteBatchNode* sceneSpriteBatchNode;
@property (strong, nonatomic) CCTMXTiledMap* tiledMapNode;
@property (nonatomic) CGPoint beginPoint;
@end
