//
//  AnimationComponent.m
//  CVS-Tycoon
//
//  Created by Zhang Zhe on 3/8/12.
//  Copyright (c) 2012 AvalonGameArt. All rights reserved.
//

#import "AnimationComponent.h"
#import "Categories.h"
#import "GameObject.h"

@implementation AnimationComponent

@synthesize owner = owner_, animationDict;

-(id)init
{
    self = [super init];
    if(self)
    {
        animationDict = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(void)loadPlistForAnimation:(NSString*)plistName
{
    NSString* plistPath;
    if(![[NSFileManager defaultManager] fileExistsAtPath:plistPath])
    {
        plistPath = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    }
    NSDictionary* plistDictionary = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    
    if(plistDictionary == nil)
        CCLOG(@"Error reading plist: %@", plistName);
    
    NSEnumerator* keyIter = [plistDictionary keyEnumerator];
    id key;
    while (key = [keyIter nextObject]) {
        NSDictionary* settings = [plistDictionary objectForKey:key];
        NSString* frameBaseName = [settings objectForKey:@"frameBaseName"];
        float delay = [[settings objectForKey:@"delay"] floatValue];
        int frameBegin = [[settings objectForKey:@"frameBegin"] intValue];
        int frameEnd = [[settings objectForKey:@"frameEnd"] intValue];
        CCAnimation* animation = [CCAnimation animationWithFrame:frameBaseName frameCountBegin:frameBegin frameCountEnd:frameEnd delay:delay];
        [[self animationDict] setObject:animation forKey:key];
    }
}

-(void)playAnimation:(NSString *)animName onModel:(CCSprite *)model repeat:(BOOL)isRepeat
{
    if(isRepeat)
    {
        id action = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:[[self animationDict] objectForKey:animName]]];
        [model runAction:action];
    }
    else
    {
        id action = [CCAnimate actionWithAnimation:[[self animationDict] objectForKey:animName]];
        [model runAction:action];
    }
    
}

@end
