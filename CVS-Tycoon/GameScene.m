//
//  GameScene.m
//  CVS-Tycoon
//
//  Created by Zhang Zhe on 9/23/11.
//  Copyright 2011 AvalonGameArt. All rights reserved.
//

#import "GameScene.h"

#import "GameplayLayer.h"
#import "UserInterfaceLayer.h"

@implementation GameScene

@synthesize gameplayLayer, uiLayer, backgroundLayer;

- (id)init
{
    self = [super init];
    if (self) {
        CCTMXTiledMap* tiledMapNode = [CCTMXTiledMap tiledMapWithTMXFile:@"isometric-with-border.tmx"];
        backgroundLayer = [tiledMapNode layerNamed:@"Ground"];
        [backgroundLayer removeFromParentAndCleanup:NO];
        [self addChild:backgroundLayer z:-100];
        
        gameplayLayer = [GameplayLayer node];
        [self addChild:gameplayLayer z:5];
        
        uiLayer = [UserInterfaceLayer node];
        [self addChild:uiLayer z:1000];
    }
    
    return self;
}

@end
