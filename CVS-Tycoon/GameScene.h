//
//  GameScene.h
//  CVS-Tycoon
//
//  Created by Zhang Zhe on 9/23/11.
//  Copyright 2011 AvalonGameArt. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GameplayLayer;
@class UserInterfaceLayer;

@interface GameScene : CCScene

@property (strong, nonatomic) GameplayLayer* gameplayLayer;
@property (strong, nonatomic) UserInterfaceLayer* uiLayer;
@property (strong, nonatomic) CCTMXLayer* backgroundLayer;

@end
