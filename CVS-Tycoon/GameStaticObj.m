//
//  GameCharacter.m
//  CVS-Tycoon
//
//  Created by Yuzhang Hu on 11/01/11.
//  Copyright 2011 AvalonGameArt. All rights reserved.
//

#import "GameStaticObj.h"

@implementation GameStaticObj

@synthesize name;
@synthesize price;
@synthesize touchCount;
@synthesize like;
@synthesize disLike;

-(void) createStaticObj:(NSString*)newName
{
    CCLOG(@"create a GameStaticObj Name is %@", newName);
    [self setName:newName];
}

@end
