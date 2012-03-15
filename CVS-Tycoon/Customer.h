//
//  Customer.h
//  CVS-Tycoon
//
//  Created by Zhang Zhe on 2/6/12.
//  Copyright (c) 2012 AvalonGameArt. All rights reserved.
//

#import "MapNavInfo.h"
#import "PathPlanner.h"
#import "MovingObject.h"

@interface Customer : MovingObject
{
@private __strong PathPlanner* pathPlanner;
@private __strong CCSprite* model;
}
@end
