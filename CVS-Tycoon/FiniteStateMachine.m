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
@synthesize currentState = currentState_;
@synthesize globalState = globalState_;

-(void)update:(ccTime)deltaTime
{
    if([self currentState])
        [[self currentState] update:owner_ withTime:deltaTime];
}

-(void)dealloc
{
    owner_ = nil;
}
@end
