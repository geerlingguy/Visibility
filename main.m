//
//  main.m
//  Visibility
//
//  Created by Jeff Geerling on 1/6/11.
//  Copyright 2011 Midwestern Mac, LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

// Debug definition:
// true = receipt check not run, debug mode
// false = receipt check run, production mode
// @todo - change to "false" when going live!
#define DEBUG true

// link with Foundation.framework
#import <Foundation/Foundation.h>

// Receipt validation code
#import "JJGReceiptValidate.h"

int main(int argc, char *argv[])
{
	// Set up a release pool so we don't have leaking memory
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

	// ----------------------------------------------------------------------
	// BEGIN Check for Mac App Store Receipt

	// FOR DEBUG: Put the example receipt on the desktop (or change that path).
	// NSString * pathToReceipt = @"/Users/jeffgeerling/Desktop/receipt";
	
	// FOR LIVE: Find the receipt in the Application folder.
	NSString *pathToReceipt = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"Contents/_MASReceipt/receipt"];

	// NSLog(@"%@", pathToReceipt); // Enable to show the path from above

	if (!DEBUG && !validateReceiptAtPath(pathToReceipt))
		exit(173);//receipt did not validate

	// NSLog(@"Receipt for Visibility validated correctly!");

	// END Check for Mac App Store Receipt
	// ----------------------------------------------------------------------

	// Drain the release pool (from earlier).
	[pool drain];

    return NSApplicationMain(argc,  (const char **) argv);
}
