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
@private __strong CCSprite* model;
}

-(id) initWithMapInfo:(MapNavInfo*)mapNode;
-(void) moveTo:(Vector2D)targetPosition;
@end
