//
//  GameCharacter.m
//  CVS-Tycoon
//
//  Created by Zhang Zhe on 9/30/11.
//  Copyright 2011 AvalonGameArt. All rights reserved.
//

#import "GameCharacter.h"

@implementation GameCharacter

@synthesize characterHealth;
@synthesize characterState;

-(void)dealloc
{
    [super dealloc];
}

-(int)getWeaponDamage
{
    CCLOG(@"getWeaponDamage should be overriden");
    return 0;
}

-(void)checkAndClampSpritePosition
{
    CGPoint currentSpritePosition = [self position];
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        if(currentSpritePosition.x < 30.0f)
        {
            [self setPosition:ccp(30.0f, currentSpritePosition.y)];
        }
        else if(currentSpritePosition.x > 1000.0f)
        {
            [self setPosition:ccp(1000.0f, currentSpritePosition.y)];
        }
    }
    else
    {
        if(currentSpritePosition.x < 24.0f)
        {
            [self setPosition:ccp(24.0f, currentSpritePosition.y)];
        }
        else if(currentSpritePosition.x > 456.0f)
        {
            [self setPosition:ccp(456.0f, currentSpritePosition.y)];
        }
    }
}

@end
