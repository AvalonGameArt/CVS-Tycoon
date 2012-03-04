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
#import "Customer.h"
#import "MapNavInfo.h"

@implementation GameplayLayer
@synthesize sceneSpriteBatchNode, tiledMapNode, beginPoint, backgroundLayer, groundObjectLayer, objectLayer, collisionLayer, playableAreaOrig, playableAreaEnd;

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
        CGSize screenSize = [CCDirector sharedDirector].winSize;
        self.isTouchEnabled = YES;
        
        [self scheduleUpdate];
        
        tiledMapNode = [CCTMXTiledMap tiledMapWithTMXFile:@"isometric-with-border.tmx"];
        const int BORDER_SIZE = 10;
        [self setPlayableAreaOrig:ccp(BORDER_SIZE,BORDER_SIZE)];
        [self setPlayableAreaEnd:ccp([tiledMapNode mapSize].width - 1 - BORDER_SIZE, [tiledMapNode mapSize].height - 1 - BORDER_SIZE)];
        
//        CGPoint mapPos = ccp(-BORDER_SIZE * [tiledMapNode tileSize].width, -BORDER_SIZE * [tiledMapNode tileSize].height);
        CGPoint mapPos = ccp(-screenSize.width / 2.0f, -screenSize.height / 2.0f);
        [tiledMapNode setPosition:mapPos];
        [self addChild:tiledMapNode];
        
        backgroundLayer = [tiledMapNode layerNamed:@"Ground"];
        groundObjectLayer = [tiledMapNode layerNamed:@"GroundObjects"];
        objectLayer = [tiledMapNode layerNamed:@"Objects"];
        collisionLayer = [tiledMapNode layerNamed:@"Collisions"];
        [collisionLayer setVisible:NO];
        
        MapNavInfo* mapNavInfo = [[MapNavInfo alloc] initWithMapNode:tiledMapNode];
        
        Customer* customer = [[Customer alloc] initWithMapInfo:mapNavInfo];
        [customer setScale:2.0f];
        [customer setPosition:ccp(200,200)];
        [self addChild:customer z:100];
        
        CCLabelBMFont* label = [CCLabelBMFont labelWithString:@"Quit" fntFile:@"default_en_26.fnt"];
        CCMenuItemLabel* item1 = [CCMenuItemLabel itemWithLabel:label block:^(id sender) {
            [[sender parent] setVisible:NO];
            CCParticleSystem* emitter = [CCParticleSystemQuad particleWithFile:@"exploding_ring.plist"];
            [emitter setPosition:[[sender parent] position]];
            [self addChild:emitter z:10];
        }];
        
		id color_action = [CCTintBy actionWithDuration:0.5f red:0 green:-255 blue:-255];
		id color_back = [color_action reverse];
		id seq = [CCSequence actions:color_action, color_back, nil];
		[item1 runAction:[CCRepeatForever actionWithAction:seq]];
        
        CCMenu* menu = [CCMenu menuWithItems:item1, nil];    
        [menu alignItemsVertically];
        [menu setVisible:NO];
        
        [self addChild:menu z:0 tag:1];
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
    
    CGPoint diff = ccpSub(touchLocation, beginPoint);
    CGPoint oldPos = [self position];
    CGPoint newPos = ccpAdd(oldPos, diff);
    [self setPosition:newPos];    
}

-(void) ccTouchEnded:(UITouch*)touch withEvent:(UIEvent*)event
{
    CCMenu* menu = (CCMenu*)[self getChildByTag:1];
    [menu setPosition:[self locationFromTouch:touch]];
    [menu setVisible:YES];
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
    CGPoint pos = ccpSub(tileMap.position, location);
    float tileWidth = [tileMap tileSize].width;
    float tileHeight = [tileMap tileSize].height;
    float halfMapWidth = [tileMap mapSize].width / 2.0f;
    float mapHeight = [tileMap mapSize].height;
    
    CGPoint tilePosDiv = ccp(pos.x / tileWidth, pos.y / tileHeight);
    float inverseTileY = mapHeight - tilePosDiv.y;
    
    //http://www.gandraxa.com/isometric_projection.xml
    float posX = (int)(inverseTileY + tilePosDiv.x - halfMapWidth);
    float posY = (int)(inverseTileY - tilePosDiv.x + halfMapWidth);
    
    return [self truncateInPlayableArea:ccp(posX, posY)];
}

-(CGPoint) truncateInPlayableArea:(CGPoint)position
{
    float posX = position.x;
    float posY = position.y;
    CGSize tileSize = [tiledMapNode tileSize];
    posX = MAX(playableAreaOrig.x * tileSize.width, posX);
    posX = MIN(playableAreaEnd.x * tileSize.width, posX);
    posY = MAX(playableAreaOrig.y * tileSize.height, posY);
    posY = MIN(playableAreaEnd.y * tileSize.height, posY);
    
    return ccp(posX, posY);    
}

@end
