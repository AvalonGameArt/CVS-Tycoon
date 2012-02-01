//
//  SpawnPoint.h
//  CVS-Tycoon
//
//  Created by ZHANG ZHE on 1/11/12.
//  Copyright (c) 2012 AvalonGameArt. All rights reserved.
//

#import "GameStaticObj.h"

@interface SpawnPoint : GameStaticObj

@property (nonatomic) BOOL atOnce;
@property (nonatomic) unsigned int spawnTimes;
@property (nonatomic) unsigned int spawnInterval;
@property (nonatomic) unsigned int countUpperLimit;
@property (strong, nonatomic) CCArray* spawnTypes;

@end
