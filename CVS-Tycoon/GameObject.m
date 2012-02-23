//
//  GameObject.m
//  CVS-Tycoon
//
//  Created by Zhang Zhe on 9/27/11.
//  Copyright 2011 AvalonGameArt. All rights reserved.
//

#import "GameObject.h"
#import "FiniteStateMachine.h"
#import "Categories.h"


@implementation GameObject
@synthesize mainFSM, animationDict;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        CCLOG(@"GameObject init");
        mainFSM = [[FiniteStateMachine alloc] init];
        animationDict = [[NSMutableDictionary alloc] init];
        [self scheduleUpdate];
    }
    
    return self;
}

-(void)update:(ccTime)deltaTime
{
    [[self mainFSM] update:deltaTime];
}

-(CGRect)adjustedBoundingBox
{
    return [self boundingBox];
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

@end
