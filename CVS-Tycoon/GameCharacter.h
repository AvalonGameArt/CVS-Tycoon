//
//  GameCharacter.h
//  CVS-Tycoon
//
//  Created by Zhang Zhe on 9/30/11.
//  Copyright 2011 AvalonGameArt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MovingObject.h"

@interface GameCharacter : MovingObject
{
}

-(void)checkAndClampSpritePosition;
@end
