//
//  FiniteStateMachine.m
//  CVS-Tycoon
//
//  Created by ZHANG ZHE on 11/29/11.
//  Copyright (c) 2011 AvalonGameArt. All rights reserved.
//

#import "FiniteStateMachine.h"

@implementation FiniteStateMachine

-(void)update:(ccTime)deltaTime
{
    if(currentState_)
        [currentState_ update:owner_ withTime:deltaTime];
}
@end
