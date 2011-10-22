//
//  GameplayLayer.m
//  CVS-Tycoon
//
//  Created by Zhang Zhe on 9/22/11.
//  Copyright 2011 AvalonGameArt. All rights reserved.
//

#import "GameplayLayer.h"

@implementation GameplayLayer

#pragma mark -
#pragma mark Update Method
-(void) update:(ccTime)deltaTime
{
//    CCArray* listOfGameObjects = [sceneSpriteBatchNode children];
//    for (GameCharacter* tempChar in listOfGameObjects)
//    {
//        [tempChar updateStateWithDeltaTime:deltaTime andListOfGameObjects:listOfGameObjects];
//    }
}

#pragma mark -
-(void)createObjectOfType:(GameObjectType)objectType withHealth:(int)initialHealth atLocation:(CGPoint)spawnLocation withZValue:(int)ZValue
{
}

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        CGSize screenSize = [CCDirector sharedDirector].winSize;
        self.isTouchEnabled = YES;
//        vikingSprite = [CCSprite spriteWithFile:@"sv_anim_1.png"];
        srand(time(NULL));
        
        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"scene1atlas.plist"];
            sceneSpriteBatchNode = [CCSpriteBatchNode batchNodeWithFile:@"scene1atlas.png"];
        }
        else
        {
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"scene1atlasiPhone.plist"];
            sceneSpriteBatchNode = [CCSpriteBatchNode batchNodeWithFile:@"scene1atlasiPhone.png"];            
        }
        [self addChild:sceneSpriteBatchNode];

        [self scheduleUpdate];
//        [self schedule:@selector(addEnemy) interval:10.0f];

        CCLabelTTF* gameBeginLabel = [CCLabelTTF labelWithString:@"Game Start" fontName:@"Helvetica" fontSize:64];
        [gameBeginLabel setPosition:ccp(screenSize.width/2, screenSize.height/2)];
        
        [self addChild:gameBeginLabel];
        id labelAction = [CCSpawn actions:[CCScaleBy actionWithDuration:2.0f scale:4], [CCFadeOut actionWithDuration:2.0f], nil];
        [gameBeginLabel runAction:labelAction];
    }
    
    return self;
}

-(void) dealloc
{
    [super dealloc];
}
@end
