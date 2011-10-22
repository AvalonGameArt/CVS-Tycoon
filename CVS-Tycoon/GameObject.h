//
//  GameObject.h
//  CVS-Tycoon
//
//  Created by Zhang Zhe on 9/27/11.
//  Copyright 2011 AvalonGameArt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Constants.h"
#import "CommonProtocols.h"

@interface GameObject : CCSprite
{
    BOOL isActive;
    BOOL reactsToScreenBoundaries;
    CGSize screenSize;
    GameObjectType gameObjectType;
}
@property (readwrite) BOOL isActive;
@property (readwrite) BOOL reactsToScreenBoundaries;
@property (readwrite) CGSize screenSize;
@property (readwrite) GameObjectType gameObjectType;
-(void)changeState:(CharacterStates)newState;

-(void)updateStateWithDeltaTime:(ccTime)deltaTime
           andListOfGameObjects:(CCArray*)listOfGameObjects;

-(CGRect)adjustedBoundingBox;

-(CCAnimation*)loadPlistForAnimationWithName:(NSString*)animationName
                                andClassName:(NSString*)className;
@end
