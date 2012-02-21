//
//  Shelf.h
//  CVS-Tycoon
//
//  Created by Zhang Zhe on 2/6/12.
//  Copyright (c) 2012 AvalonGameArt. All rights reserved.
//

#import "CCNode.h"
#import "GoodsComponent.h"

@interface Shelf : CCNode <CCTargetedTouchDelegate>

@property (strong, nonatomic) CCSprite* sprite;
@property (strong, nonatomic) GoodsComponent* goodsComponent;

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event;
- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event;
- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event;

@end
