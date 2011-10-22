//
//  GameScene.m
//  CVS-Tycoon
//
//  Created by Zhang Zhe on 9/23/11.
//  Copyright 2011 AvalonGameArt. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        // Backgraound Layer
        BackgroundLayer* backgroundLayer = [BackgroundLayer node];
        [self addChild:backgroundLayer z:0];
        
        GameplayLayer* gameplayerLayer = [GameplayLayer node];
        [self addChild:gameplayerLayer z:5];
    }
    
    return self;
}

@end
