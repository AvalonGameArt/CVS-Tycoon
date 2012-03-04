//
//  MapNavInfo.h
//  CVS-Tycoon
//
//  Created by Zhang Zhe on 3/4/12.
//  Copyright (c) 2012 AvalonGameArt. All rights reserved.
//

@interface MapNavInfo : CCNode

@property (weak, nonatomic) CCTMXTiledMap* mapNode;
@property (strong, nonatomic) NSMutableArray* mapNavigationInfo;
@property (nonatomic) CGSize mapTileSize;
@property (nonatomic) CGSize mapBorderSize;
@property (nonatomic) CGSize mapSize;

-(id) initWithMapNode:(CCTMXTiledMap*)mapNode;
-(bool) isTilePosBlocked:(CGPoint)tilePos;


@end
