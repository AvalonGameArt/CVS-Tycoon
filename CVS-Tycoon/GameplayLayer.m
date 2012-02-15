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
@synthesize sceneSpriteBatchNode, tiledMapNode, beginPoint, backgroundLayer, groundObjectLayer, objectLayer, collisionLayer;

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
        
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"scene1atlas.plist"];
        sceneSpriteBatchNode = [CCSpriteBatchNode batchNodeWithFile:@"scene1atlas.pvr.ccz"];
        [self addChild:sceneSpriteBatchNode];

        [self scheduleUpdate];
        
        tiledMapNode = [CCTMXTiledMap tiledMapWithTMXFile:@"isometric-with-border.tmx"];
        [self addChild:tiledMapNode];
        
        backgroundLayer = [tiledMapNode layerNamed:@"Ground"];
        groundObjectLayer = [tiledMapNode layerNamed:@"GroundObjects"];
        objectLayer = [tiledMapNode layerNamed:@"Objects"];
        collisionLayer = [tiledMapNode layerNamed:@"Collisions"];
        [collisionLayer setVisible:NO];
        
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
    beginPoint = [self locationFromTouch:touch];
    return YES;
}

-(void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint touchLocation = [self locationFromTouch:touch];		
    
    CGPoint diff = ccpSub(beginPoint, touchLocation);
    CGPoint oldPos = [self position];
    [self setPosition:ccpSub(oldPos, diff)];    
}

-(CGPoint) locationFromTouch:(UITouch*)touch
{
    CGPoint touchLocation = [touch locationInView: [touch view]];		
    touchLocation = [[CCDirector sharedDirector] convertToGL: touchLocation];
    touchLocation = [self convertToNodeSpace:touchLocation];
    
    return touchLocation;
}

-(CGPoint) tilePosFromLocation:(CGPoint)location tileMap:(CCTMXTiledMap*)tileMap
{
    CGPoint pos = ccpSub(location, tileMap.position);
    float tileWidth = [tileMap tileSize].width;
    float tileHeight = [tileMap tileSize].height;
    float halfMapWidth = [tileMap mapSize].width;
    float mapHeight = [tileMap mapSize].height;
    
    CGPoint tilePosDiv = ccp(pos.x / tileWidth, pos.y / tileHeight);
    float inverseTileY = mapHeight - tilePosDiv.y;
    
    float posX = (int)(inverseTileY + tilePosDiv.x - halfMapWidth);
    float posY = (int)(inverseTileY - tilePosDiv.x + halfMapWidth);
    
    posX = MAX(0, posX);
    posX = MIN([tileMap mapSize].width, posX);
    posY = MAX(0, posY);
    posY = MIN([tileMap mapSize].height, posY);
    
    return ccp(posX, posY);
}

@end
