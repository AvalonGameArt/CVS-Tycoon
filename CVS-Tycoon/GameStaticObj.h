//
//  GameStaticObj.h
//  CVS-Tycoon
//
//  Created by Yuzhang Hu on 11/01/11.
//  Copyright 2011 AvalonGameArt. All rights reserved.
//

#ifndef GAME_STATIC_OBJ_H_
#define GAME_STATIC_OBJ_H_

#import "GameObject.h"

@interface GameStaticObj : GameObject
{
    NSString* name;
    int price;
    int touchCount;
    int like;
    int disLike;
}

@property (copy, readwrite) NSString* name;
@property (readwrite) int price;
@property (readwrite) int touchCount;
@property (readwrite) int like;
@property (readwrite) int disLike;

-(void) createStaticObj:(NSString*)name;

@end

#endif
