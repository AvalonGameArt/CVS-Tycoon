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

@property (strong, nonatomic) NSString* name;
@property (nonatomic) int price;
@property (nonatomic) int touchCount;
@property (nonatomic) int like;
@property (nonatomic) int disLike;

-(void) createStaticObj:(NSString*)name;

@end

#endif
