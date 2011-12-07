//
//  GameObject.m
//  CVS-Tycoon
//
//  Created by Zhang Zhe on 9/27/11.
//  Copyright 2011 AvalonGameArt. All rights reserved.
//

#import "GameObject.h"

@implementation GameObject
@synthesize reactsToScreenBoundaries;
@synthesize screenSize;
@synthesize gameObjectType;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        CCLOG(@"GameObject init");
        screenSize = [CCDirector sharedDirector].winSize;
        gameObjectType = kObjectTypeNone;
    }
    
    return self;
}

-(void)updateStateWithDeltaTime:(ccTime)deltaTime
           andListOfGameObjects:(CCArray*)listOfGameObject
{
    CCLOG(@"updateStateWithDeltaTime method should be overridden");
}

-(CGRect)adjustedBoundingBox
{
    CCLOG(@"GameObject adjustedBoundingBox should be overridden");
    return [self boundingBox];
}

-(CCAnimation*)loadPlistForAnimationWithName:(NSString*)animationName
                                andClassName:(NSString*)className
{
    CCAnimation* animationToReturn = nil;
    NSString* fullFileName = [NSString stringWithFormat:@"%@.plist",className];
    NSString* plistPath;
    NSString* rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                               NSUserDomainMask, YES) objectAtIndex:0];
    plistPath = [rootPath stringByAppendingPathComponent:fullFileName];
    if(![[NSFileManager defaultManager] fileExistsAtPath:plistPath])
    {
        plistPath = [[NSBundle mainBundle] pathForResource:className ofType:@"plist"];
    }
    
    NSDictionary* plistDictionary = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    
    if(plistDictionary == nil)
    {
        CCLOG(@"Error reading plist: %@.plist", className);
        return nil;
    }
    
    NSDictionary* animationSettings = [plistDictionary objectForKey:animationName];
    if(animationSettings == nil)
    {
        CCLOG(@"Could not locate AnimationWithName:%@",animationName);
        return nil;
    }
    
    float animationDelay = [[animationSettings objectForKey:@"delay"] floatValue];
    animationToReturn = [CCAnimation animation];
    [animationToReturn setDelay:animationDelay];
    
    NSString* animationFramePrefix = [animationSettings objectForKey:@"filenamePrefix"];
    NSString* animationFrames = [animationSettings objectForKey:@"animationFrames"];
    NSArray* animationFrameNumbers = [animationFrames componentsSeparatedByString:@","];
    
    for (NSString* frameNumber in animationFrameNumbers)
    {
        NSString* frameName = [NSString stringWithFormat:@"%@%@.png", animationFramePrefix, frameNumber];
        [animationToReturn addFrame: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:frameName]];
    }
    
    return animationToReturn;
    
}
@end
