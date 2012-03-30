//
//  FiniteStateMachine.m
//  CVS-Tycoon
//
//  Created by ZHANG ZHE on 11/29/11.
//  Copyright (c) 2011 AvalonGameArt. All rights reserved.
//

#import "FiniteStateMachine.h"
#import "StateBase.h"

@implementation FiniteStateMachine
@synthesize owner = owner_;
@synthesize currentState;
@synthesize globalState;

-(void)update:(ccTime)deltaTime
{
    if([self currentState])
        [[self currentState] update:[self owner] withTime:deltaTime];
}

-(void)changeState:(id<GameObjectStateDelegate>)newState
{
    [newState enter:[self owner]];
    if([self currentState])
        [[self currentState] exit:[self owner]];
    [self setCurrentState:newState];
}

-(void)dealloc
{
    [self setOwner: nil];
}
@end
