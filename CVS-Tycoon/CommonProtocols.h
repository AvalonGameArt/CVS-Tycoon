//
//  CommonProtocols.h
//  CVS-Tycoon
//
//  Created by Zhang Zhe on 9/27/11.
//  Copyright 2011 AvalonGameArt. All rights reserved.
//

#ifndef CVSTYCOON_CommonProtocols_h
#define CVSTYCOON_CommonProtocols_h

typedef enum {
    kStateSpawning,
    kStateIdle,
    kStateCrouching,
    kStateStandingUp,
    kStateWalking,
    kStateAttacking,
    kStateJumping,
    kStateBreathing,
    kStateTakingDamage,
    kStateDead,
    kStateTraveling,
    kStateRotating,
    kStateDrilling,
    kStateAfterJumping
} CharacterStates;

typedef enum {
    kObjectTypeNone,
    kPowerUpTypeHealth,
    kPowerUpTypeMallet,
    kEnemyTypeRadarDish,
    kEnemyTypeSpaceCargoShip,
    kEnemyTypeAlienRobot,
    kEnemyTypePhaser,
    kVikingType,
    kSkullType,
    kRockType,
    kMeteorType,
    kFrozenVikingType,
    kIceType,
    kLongBlockType,
    kCartType,
    kSpikesType,
    kDiggerType,
    kGroundType
} GameObjectType;

@protocol GameplayLayerDelegate
-(void) createObjectOfType:(GameObjectType)objectType
                withHealth:(int)initialHealth
                atLocation:(CGPoint)spawnLocation
                withZValue:(int)ZValue;
@end

@class GameObject;
@protocol GameObjectStateDelegate <NSObject>
-(void)enter:(id)owner;
-(void)update:(id)owner withTime:(ccTime)deltaTime;
-(void)exit:(id)owner;
@end



#endif
