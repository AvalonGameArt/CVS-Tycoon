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
        srand(time(0));
        
        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"scene1atlas.plist"];
            [CCTexture2D PVRImagesHavePremultipliedAlpha:YES];
            sceneSpriteBatchNode = [CCSpriteBatchNode batchNodeWithFile:@"scene1atlas.pvr.ccz"];
        }
        else
        {
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"scene1atlas.plist"];
            [CCTexture2D PVRImagesHavePremultipliedAlpha:YES];
            sceneSpriteBatchNode = [CCSpriteBatchNode batchNodeWithFile:@"scene1atlas.pvr.ccz"];            
        }
        [self addChild:sceneSpriteBatchNode];

        [self scheduleUpdate];
//        [self schedule:@selector(addEnemy) interval:10.0f];

//        CCLabelTTF* gameBeginLabel = [CCLabelTTF labelWithString:@"Game Start" fontName:@"Helvetica" fontSize:64];
//        [gameBeginLabel setPosition:ccp(screenSize.width/2, screenSize.height/2)];
//        
//        [self addChild:gameBeginLabel];
//        id labelAction = [CCSpawn actions:[CCScaleBy actionWithDuration:2.0f scale:4], [CCFadeOut actionWithDuration:2.0f], nil];
//        [gameBeginLabel runAction:labelAction];
        
        tiledMapNode = [CCTMXTiledMap tiledMapWithTMXFile:@"firstlevel.tmx"];
        CCTMXLayer* groundLayer = [tiledMapNode layerNamed:@"Tile Layer 1"];
//        CCTMXObjectGroup* objectGroup = [tiledMapNode objectGroupNamed:@"shelf"];
//        NSMutableDictionary* shelf001 = [objectGroup objectNamed:@"shelf001"];
//        int x = [[shelf001 valueForKey:@"x"] intValue];
//        int y = [[shelf001 valueForKey:@"y"] intValue];
//        CCSprite* shelf = [CCSprite spriteWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"shelf01empty.png"]];
//        [shelf setPosition:ccp(x,y)];
//        [sceneSpriteBatchNode addChild:shelf];
        
        
        [groundLayer removeFromParentAndCleanup:NO];
        [groundLayer setAnchorPoint:CGPointMake(0.5f, 0.5f)];
        [self addChild:groundLayer z:30];

//        [workingSpace retain];
//        [workingSpace removeFromParentAndCleanup:NO];
//        [workingSpace setAnchorPoint:CGPointMake(0.5f, 0.5f)];
//        [self addChild:workingSpace z:35];
//        [workingSpace release];
        
        CCSprite* dog = [CCSprite spriteWithSpriteFrameName:@"dog001.png"];
        CCAnimation* dogAnim = [CCAnimation animation];
        [dogAnim addFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"dog001.png"]];
        [dogAnim addFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"dog002.png"]];
        [dogAnim addFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"dog003.png"]];
        [dogAnim setDelay:0.3];
        [sceneSpriteBatchNode addChild:dog];
        id action = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:dogAnim restoreOriginalFrame:NO]];
        [dog setScale:3.0];
        [dog runAction:action];
    }
    
    return self;
}

-(void) registerWithTouchDispatcher
{
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
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
