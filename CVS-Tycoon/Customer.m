//
//  Customer.m
//  CVS-Tycoon
//
//  Created by Zhang Zhe on 2/6/12.
//  Copyright (c) 2012 AvalonGameArt. All rights reserved.
//

#import "Categories.h"
#import "Customer.h"

@implementation Customer

-(id)init
{
    self = [super init];
    if(self)
    {
        bodySprite = [CCSprite spriteWithSpriteFrameName:@"dog1"];
        [self loadPlistForAnimation:@"dog_animation"];
        [self addChild:bodySprite];
        [self playAnimation:@"walkDownRight" restoreOriginalFrame:NO repeat:YES];
    }
    return self;
}

-(void)update:(ccTime)deltaTime
{
    [super update:deltaTime];
    CGPoint curPos = [self position];
    if(ccpDistance(curPos, targetPosition) < 4)
    {
        
    }
}

-(void)playAnimation:(NSString *)animName restoreOriginalFrame:(BOOL)isRestore repeat:(BOOL)isRepeat
{
    if(isRepeat)
    {
        id action = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:[[self animationDict] objectForKey:animName] restoreOriginalFrame:isRestore]];
        [bodySprite runAction:action];
    }
    else
    {
        id action = [CCAnimate actionWithAnimation:[[self animationDict] objectForKey:animName] restoreOriginalFrame:isRestore];
        [bodySprite runAction:action];        
    }

}

@end
