//
//  AppDelegate.h
//  CVS-Tycoon
//
//  Created by ZHANG ZHE on 1/10/12.
//  Copyright AvalonGameArt 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppController : UIResponder <UIApplicationDelegate, CCDirectorDelegate>
{
	UIWindow *window_;
	UINavigationController *__weak navController_;

	CCDirectorIOS	*__weak director_;							// weak ref
}

@property (nonatomic, strong) UIWindow *window;
@property (weak, readonly) UINavigationController *navController;
@property (weak, readonly) CCDirectorIOS *director;

@end
