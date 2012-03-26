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

@synthesize gameplayLayer, uiLayer;

- (id)init
{
    self = [super init];
    if (self) {
        srand(time(0));

        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"scene1atlas.plist"];
        CCSpriteBatchNode* sceneSpriteBatchNode = [CCSpriteBatchNode batchNodeWithFile:@"scene1atlas.pvr.ccz"];
        [self addChild:sceneSpriteBatchNode z:500 tag:1];
        
        gameplayLayer = [GameplayLayer node];
        [self addChild:gameplayLayer z:5];
        
        uiLayer = [UserInterfaceLayer node];
        [self addChild:uiLayer z:1000];

    }
    
    return self;
}

@end
