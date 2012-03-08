//
//  GameObject.h
//  CVS-Tycoon
//
//  Created by Zhang Zhe on 9/27/11.
//  Copyright 2011 AvalonGameArt. All rights reserved.
//

@class FiniteStateMachine;
@class AnimationComponent;

@interface GameObject : CCNode
{
}

@property (strong, nonatomic) FiniteStateMachine* mainFSM;
@property (strong, nonatomic) AnimationComponent* animationComponent;

-(void) update:(ccTime)deltaTime;
@end
