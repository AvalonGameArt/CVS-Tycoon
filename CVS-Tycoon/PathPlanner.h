//
//  PathPlanner.h
//  CVS-Tycoon
//
//  Created by zhe zhang on 12-2-20.
//  Copyright (c) 2012年 AvalonGameArt. All rights reserved.
//

#import "NavigationNode.h"

@interface PathPlanner : CCNode
{
@private CCTMXTiledMap* tileMap;
}

@property (strong, nonatomic) NavigationNode* startPoint;
@property (strong, nonatomic) NavigationNode* targetPoint;

-(id)initWithTileMap:(CCTMXTiledMap*)tileMap;
-(NSMutableArray*) planPath;

@end
