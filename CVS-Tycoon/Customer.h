//
//  Customer.h
//  CVS-Tycoon
//
//  Created by Zhang Zhe on 2/6/12.
//  Copyright (c) 2012 AvalonGameArt. All rights reserved.
//

#import "MovementComponent.h"

@interface Customer : CCNode
{
@private __strong MovementComponent* moveComp;
    
}

@property (strong, nonatomic) CCSprite* bodySprite;

@end
