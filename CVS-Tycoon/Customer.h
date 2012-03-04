//
//  Customer.h
//  CVS-Tycoon
//
//  Created by Zhang Zhe on 2/6/12.
//  Copyright (c) 2012 AvalonGameArt. All rights reserved.
//

#import "MapNavInfo.h"
#import "MovementComponent.h"
#import "PathPlanner.h"
#import "GameObject.h"

@interface Customer : GameObject
{
@private __strong MovementComponent* moveComp;
@private __strong PathPlanner* pathPlanner;
@private __strong CCSprite* bodySprite;
@private CGPoint targetPosition;
}

-(void)playAnimation:(NSString*)animName restoreOriginalFrame:(BOOL)isRestore repeat:(BOOL)isRepeat;

-(id) initWithMapInfo:(MapNavInfo*)mapNode;
@end
