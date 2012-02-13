//
//  GameplayLayer.m
//  CVS-Tycoon
//
//  Created by Zhang Zhe on 9/22/11.
//  Copyright 2011 AvalonGameArt. All rights reserved.
//

#import "GameplayLayer.h"
#import "Categories.h"
#import "GameObject.h"

@implementation GameplayLayer
@synthesize sceneSpriteBatchNode, tiledMapNode, beginPoint;

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
- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
//        CGSize screenSize = [CCDirector sharedDirector].winSize;
        self.isTouchEnabled = YES;
//        vikingSprite = [CCSprite spriteWithFile:@"sv_anim_1.png"];
        srand(time(0));
        
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"scene1atlas.plist"];
        sceneSpriteBatchNode = [CCSpriteBatchNode batchNodeWithFile:@"scene1atlas.pvr.ccz"];
        [self addChild:sceneSpriteBatchNode];

        [self scheduleUpdate];
        
//        tiledMapNode = [CCTMXTiledMap tiledMapWithTMXFile:@"firstlevel.tmx"];
//        CCTMXLayer* groundLayer = [tiledMapNode layerNamed:@"Tile Layer 1"];
//        
//        [groundLayer removeFromParentAndCleanup:NO];
//        [groundLayer setAnchorPoint:CGPointMake(0.5f, 0.5f)];
//        [self addChild:groundLayer z:30];

//        CCSprite* dog = [CCSprite spriteWithSpriteFrameName:@"dog1"];
//        CCAnimation* dogAnimWalkUpRight = [CCAnimation animationWithFrame:@"dog" frameCountBegin:1 frameCountEnd:3 delay:0.3];
//        CCAnimation* dogAnimWalkDownRight = [CCAnimation animationWithFrame:@"dog" frameCountBegin:4 frameCountEnd:6 delay:0.3];
//        CCAnimation* dogAnimWalkDownLeft = [CCAnimation animationWithFrame:@"dog" frameCountBegin:7 frameCountEnd:9 delay:0.3];
//        CCAnimation* dogAnimWalkUpLeft = [CCAnimation animationWithFrame:@"dog" frameCountBegin:10 frameCountEnd:12 delay:0.3];
        
//        [sceneSpriteBatchNode addChild:dog];
//        id action = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:dogAnimWalkDownRight restoreOriginalFrame:NO]];
//        [dog setScale:3.0];
//        [dog runAction:action];
//        [[[GameObject alloc] init] loadPlistForAnimation:@"dog_animation"];
        
    }
    
    return self;
}

-(void) registerWithTouchDispatcher
{
    [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}

-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint touchLocation = [touch locationInView: [touch view]];		
    touchLocation = [[CCDirector sharedDirector] convertToGL: touchLocation];
    touchLocation = [self convertToNodeSpace:touchLocation];
    beginPoint = touchLocation;
    return YES;
}

-(void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint touchLocation = [touch locationInView: [touch view]];		
    touchLocation = [[CCDirector sharedDirector] convertToGL: touchLocation];
    touchLocation = [self convertToNodeSpace:touchLocation];
    
    CGPoint diff = ccpSub(beginPoint, touchLocation);
    CGPoint oldPos = [self position];
    [self setPosition:ccpSub(oldPos, diff)];    
}

@end
