//
//  JJGFileVisibility.m
//
//  Created by Jeff Geerling on 1/7/11.
//  Copyright 2013 Midwestern Mac, LLC. All rights reserved.
//

#import "JJGFileVisibility.h"

@implementation JJGFileVisibility

- (IBAction)showInvisible:(id)sender {
	// Enable spinner.
	[workingSpinner startAnimation: self];

    // Show invisible files.
    [self showOrHideFiles:@"YES"];

    // Add a short delay (so preference can take effect).
    sleep(3);

    // Restart Finder.
    [self restartFinder];

    // Disable spinner.
	[workingSpinner stopAnimation: self];
	
	// At some point, add preference allowing user to have app exit after click.
}

- (IBAction)hideInvisible:(id)sender {
	// Enable spinner.
	[workingSpinner startAnimation: self];
	
    // Show invisible files.
    [self showOrHideFiles:@"NO"];

    // Add a short delay (so preference can take effect).
    sleep(3);

    // Restart Finder.
    [self restartFinder];
    
    // Disable spinner.
	[workingSpinner stopAnimation: self];

	// At some point, add preference allowing user to have app exit after click.
}

- (void)showOrHideFiles:(NSString *)showOrHide {
    // Use an NSTask to run the defaults write command.
    NSTask *defaultsWrite;
    defaultsWrite = [[NSTask alloc] init];
    [defaultsWrite setLaunchPath: @"/usr/bin/defaults"];
    NSArray *arguments;
    arguments = [NSArray arrayWithObjects:
                 @"write",
                 @"com.apple.finder",
                 @"AppleShowAllFiles",
                 showOrHide,
                 nil];
    [defaultsWrite setArguments: arguments];
    [defaultsWrite launch];
}

- (void)restartFinder {
    // Use an NSTask to restart Finder.
    NSTask *restartFinder;
    restartFinder = [[NSTask alloc] init];
    [restartFinder setLaunchPath: @"/usr/bin/killall"];
    NSArray *killallArgs;
    killallArgs = [NSArray arrayWithObjects:
                   @"-HUP",
                   @"Finder",
                   nil];
    [restartFinder setArguments: killallArgs];
    [restartFinder launch];
}

@end
