//
//  NavigationNode.h
//  CVS-Tycoon
//
//  Created by zhe zhang on 12-2-20.
//  Copyright (c) 2012年 AvalonGameArt. All rights reserved.
//

@interface NavigationNode : CCNode

@property (nonatomic) int gScore;
@property (nonatomic) int hScore;
@property (readonly, nonatomic) int fScore;

@property (nonatomic) CGPoint tilePosition;

+(id)nodeWithTilePosition:(CGPoint)tilePos;
-(id)initWithTilePosition:(CGPoint)tilePos;

-(BOOL)isEqual:(NavigationNode*)rhs;

@end
