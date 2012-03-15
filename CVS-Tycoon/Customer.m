//
//  Customer.m
//  CVS-Tycoon
//
//  Created by Zhang Zhe on 2/6/12.
//  Copyright (c) 2012 AvalonGameArt. All rights reserved.
//

#import "Categories.h"
#import "Customer.h"
#import "AnimationComponent.h"

@implementation Customer

-(id)init
{
    self = [super init];
    if(self)
    {
        model = [CCSprite spriteWithSpriteFrameName:@"dog1"];
        [self addChild:model];

        [[self animationComponent] loadPlistForAnimation:@"dog_animation"];
        [[self animationComponent] playAnimation:@"walkDownRight" onModel:model repeat:YES];
    }
    return self;
}

-(void)update:(ccTime)deltaTime
{
    [super update:deltaTime];
}

@end
