//
//  MapNavInfo.h
//  CVS-Tycoon
//
//  Created by Zhang Zhe on 3/4/12.
//  Copyright (c) 2012 AvalonGameArt. All rights reserved.
//

@interface MapNavInfo : CCNode
{
    int mapInfoMatrix[50][50]; 
    __weak CCTMXTiledMap* mapNode_;
}

@property (weak, nonatomic) CCTMXTiledMap* mapNode;
@property (strong, nonatomic) NSMutableArray* mapNavigationInfo;
@property (nonatomic) CGSize mapTileSize;
@property (nonatomic) CGSize mapBorderSize;
@property (nonatomic) CGSize mapSize;

-(id) initWithMapNode:(CCTMXTiledMap*)mapNode;
-(BOOL) isTilePosBlocked:(CGPoint)tilePos;

-(int) getTileBlocked:(CGPoint)tilePos;
-(void) setTileBlocked:(CGPoint)tilePos with:(int)value;

@end
