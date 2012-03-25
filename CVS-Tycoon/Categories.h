//
//  CCAnimation+AnimHelper.h
//  CVS-Tycoon
//
//  Created by ZHANG ZHE on 1/13/12.
//  Copyright (c) 2012 AvalonGameArt. All rights reserved.
//

#import "CCAnimation.h"

@class CCTMXTiledMap;

@interface CCAnimation (AnimHelper)
+(CCAnimation*) animationWithFrame:(NSString*)frameBaseName frameCountBegin:(int)beg frameCountEnd:(int)end delay:(float)delay;
@end

@interface NSObject (Singleton)
+(id)sharedInstance;
@end

@interface CCLayer (CCTMXMap)
-(CGPoint) locationFromTouch:(UITouch*)touch;
-(CGPoint) tilePosFromLocation:(CGPoint)location tileMap:(CCTMXTiledMap*)tileMap;

@end
