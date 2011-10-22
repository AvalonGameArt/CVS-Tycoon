//
//  GameCharacter.h
//  CVS-Tycoon
//
//  Created by Zhang Zhe on 9/30/11.
//  Copyright 2011 AvalonGameArt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameObject.h"

@interface GameCharacter : GameObject
{
    int characterHealth;
    CharacterStates characterState;
}

-(void)checkAndClampSpritePosition;
-(int)getWeaponDamage;

@property (readwrite) int characterHealth;
@property (readwrite) CharacterStates characterState;
@end
