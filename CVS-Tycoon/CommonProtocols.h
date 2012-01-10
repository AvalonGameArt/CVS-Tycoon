//
//  CommonProtocols.h
//  CVS-Tycoon
//
//  Created by Zhang Zhe on 9/27/11.
//  Copyright 2011 AvalonGameArt. All rights reserved.
//

@protocol GameObjectStateDelegate <NSObject>
-(void)enter:(id)owner;
-(void)update:(id)owner withTime:(ccTime)deltaTime;
-(void)exit:(id)owner;
@end
