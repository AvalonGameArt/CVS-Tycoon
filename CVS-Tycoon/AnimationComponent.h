//
//  AnimationComponent.h
//  CVS-Tycoon
//
//  Created by Zhang Zhe on 3/8/12.
//  Copyright (c) 2012 AvalonGameArt. All rights reserved.
//

@class GameObject;

@interface AnimationComponent : CCNode
{
    __weak GameObject* owner_;
}

@property (weak, nonatomic) GameObject* owner;
@property (strong, nonatomic) NSMutableDictionary* animationDict;

-(void)loadPlistForAnimation:(NSString*)plistName;
-(void)playAnimation:(NSString*)animName onModel:(CCSprite*)model repeat:(BOOL)isRepeat;

@end
