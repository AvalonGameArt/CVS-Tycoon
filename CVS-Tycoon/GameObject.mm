//
//  GameObject.m
//  CVS-Tycoon
//
//  Created by Zhang Zhe on 9/27/11.
//  Copyright 2011 AvalonGameArt. All rights reserved.
//

#import "GameObject.h"
#import "FiniteStateMachine.h"
#import "AnimationComponent.h"

@implementation GameObject
@synthesize mainFSM, animationComponent;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        CCLOG(@"GameObject init");
        [self setPosition:CGPointZero];
        mainFSM = [[FiniteStateMachine alloc] init];
        animationComponent = [[AnimationComponent alloc] init];
        [self scheduleUpdate];
    }
    
    return self;
}

-(void)update:(ccTime)deltaTime
{
    [[self mainFSM] update:deltaTime];
}

@end
