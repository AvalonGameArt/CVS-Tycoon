//
//  FiniteStateMachine.h
//  CVS-Tycoon
//
//  Created by ZHANG ZHE on 11/29/11.
//  Copyright (c) 2011 AvalonGameArt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CommonProtocols.h"

@interface FiniteStateMachine : NSObject

@property (weak, nonatomic) id owner;
@property (strong, nonatomic) id<GameObjectStateDelegate> currentState;
@property (strong, nonatomic) id<GameObjectStateDelegate> globalState;

-(void)update:(ccTime)deltaTime;
-(void)changeState:(id<GameObjectStateDelegate>)newState;

@end
