//
//  VisibilityAppDelegate.m
//  Visibility
//
//  Created by Jeff Geerling on 1/6/11.
//  Copyright 2013 Midwestern Mac, LLC. All rights reserved.
//

#import "VisibilityAppDelegate.h"

@implementation VisibilityAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	
	// Insert code here to initialize your application.
	
	// @todo - Find out the value of 'AppleShowAllFiles'
	//	  - See code below for an example
	//	  - Also: http://goo.gl/WK4SA (NSUserDefaults Reference - apple.com)
	// @todo - Disable the button for the current condition
	// @todo - After someone clicks the opposite button,
	//		   disable that one, and re-enable the other

}

- (BOOL) applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication {
	// This function quits the application when the last window is closed.
	// As seen on http://lists.apple.com/archives/Student-dev/2002/Nov/msg00250.html
	return 0;
}

// One method for checking the AppleShowAllFiles preference is below
// From: http://forums.macrumors.com/showthread.php?t=610643
//+ (void)initialize
//{
//	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//	[defaults addSuiteNamed:@"com.apple.finder"];
//	[defaults synchronize];
//	if ([[defaults stringForKey:@"AppleShowAllFiles"] isEqualToString:@"FALSE"])
//	{
//		NSLog (@"it's FALSE");
//	}
//	if ([[defaults stringForKey:@"AppleShowAllFiles"] isEqualToString:@"TRUE"])
//	{
//		NSLog (@"it's TRUE");
//	}
//	else {
//		NSLog (@"it's NEITHER");
//	}
//}

@end
