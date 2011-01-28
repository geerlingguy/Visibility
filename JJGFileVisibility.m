//
//  JJGFileVisibility.m
//
//  Created by Jeff Geerling on 1/7/11.
//  Copyright 2011 Midwestern Mac, LLC. All rights reserved.
//
//  Alternative, but unsafe method, of killing/restarting the Finder:
//  system("ps ax | awk '/Finder/ { print $1 }' | xargs kill -1");

#import "JJGFileVisibility.h"

@implementation JJGFileVisibility

- (IBAction)showInvisible:(id)sender {
	NSLog (@"showInvisible invoked - we're showing all files!");
	// Enable spinner.
	[workingSpinner startAnimation: self];
    
	// Set the Finder to show invisible files.
	system("defaults write com.apple.Finder AppleShowAllFiles YES");
	
	// Restart Finder, using AppleScript.
	NSAppleScript *restartFinder = [[NSAppleScript alloc] initWithSource:@"tell application \"Finder\" to quit"];
	[restartFinder executeAndReturnError:nil];
	
	// Sleep a short bit, for good effect (added because finder wouldn't always restart).
	sleep(2);
	
	// Activate Finder.
	restartFinder = [[NSAppleScript alloc] initWithSource:@"tell application \"Finder\" to activate"];
	[restartFinder executeAndReturnError:nil];
	
	// Disable spinner after 1 second.
	sleep(1);
	[workingSpinner stopAnimation: self];
	
	// Possibly, at some point, add preference allowing user to choose if
	// he would like to simply have the application exit after the command
	// is given.
}

- (IBAction)hideInvisible:(id)sender {
	NSLog (@"hideInvisible invoked - we're hiding invisible files!");
	// Enable spinner.
	[workingSpinner startAnimation: self];
	
	// Set the Finder to hide invisible files.
	system("defaults write com.apple.Finder AppleShowAllFiles NO");
	
	// Restart Finder, using AppleScript.
	NSAppleScript *restartFinder = [[NSAppleScript alloc] initWithSource:@"tell application \"Finder\" to quit"];
	[restartFinder executeAndReturnError:nil];
	
	// Sleep a short bit, for good effect (added because finder wouldn't always restart).
	sleep(2);

	// Activate Finder.
	restartFinder = [[NSAppleScript alloc] initWithSource:@"tell application \"Finder\" to activate"];
	[restartFinder executeAndReturnError:nil];

	// Alternative, but unsafe method, of killing/restarting the Finder:
	// system("ps ax | awk '/Finder/ { print $1 }' | xargs kill -1");
	
	// Disable spinner after 1 second.
	sleep(1);
	[workingSpinner stopAnimation: self];

	// Possibly, at some point, add preference allowing user to choose if
	// he would like to simply have the application exit after the command
	// is given.
}

@end
