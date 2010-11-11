//
//  AnimatedCellsAppDelegate.h
//  AnimatedCells
//
//  Created by Saurabh Garg on 11/2/10.
//  Copyright 2010 eBuddy BV. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AnimatedCellsViewController;
@class SecondApproachCellsViewController;

@interface AnimatedCellsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	//AnimatedCellsViewController *viewController;
	SecondApproachCellsViewController *viewController;
	
	CGSize orientFrame;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
//@property (nonatomic, retain) IBOutlet AnimatedCellsViewController *viewController;
@property (nonatomic, retain) IBOutlet SecondApproachCellsViewController *viewController;
@property (nonatomic, assign) CGSize orientFrame;

@end

