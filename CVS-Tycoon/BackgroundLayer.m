//
//  BackgroundLayer.m
//  CVS-Tycoon
//
//  Created by Zhang Zhe on 9/22/11.
//  Copyright 2011 AvalonGameArt. All rights reserved.
//

#import "BackgroundLayer.h"

@implementation BackgroundLayer

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        CCSprite* backgroundImage;
        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            backgroundImage = [CCSprite spriteWithFile:@"background.png"];
        }
        else
        {
            backgroundImage = [CCSprite spriteWithFile:@"backgroundiPhone.png"];
        }
        
        CGSize screenSize = [[CCDirector sharedDirector] winSize];
        [backgroundImage setPosition:
         CGPointMake(screenSize.width/2, screenSize.height/2)];
        
        [self addChild:backgroundImage z:0 tag:0];
    }
    
    return self;
}

@end
