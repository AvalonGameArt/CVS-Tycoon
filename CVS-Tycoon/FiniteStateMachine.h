//
//  FiniteStateMachine.h
//  CVS-Tycoon
//
//  Created by ZHANG ZHE on 11/29/11.
//  Copyright (c) 2011 AvalonGameArt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameObject.h"
#import "StateBase.h"

@interface FiniteStateMachine : NSObject
{
    GameObject* owner_;
    StateBase* currentState_;
    StateBase* globalState_;
}

-(void)update:(ccTime)deltaTime;


@end
