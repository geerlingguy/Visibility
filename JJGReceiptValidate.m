//
//  JJGReceiptValidate.m
//  Visibility
//
//  Created by Jeff Geerling on 1/8/11.
//  Copyright 2011 Midwestern Mac, LLC. All rights reserved.
//

#import "JJGReceiptValidate.h"


@implementation JJGReceiptValidate

BOOL validateReceiptAtPath(NSString * path)
{
	/**
	 * @TODO - Check for the receipt, do all the steps in Apple's guide:
	 * http://developer.apple.com/devcenter/mac/documents/validating.html
	 *
	 * We need to implement many more checks - right now, we only do a couple.
	 * We should at least check to make sure we have the correct 
	 */

	/**
	 * 1. Check if the receipt file actually *exists*.
	 */

	BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:path];
	// If the file doesn't exist, log the path, and return NO.
	if(!fileExists)
	{
		NSLog(@"%@", path);
		NSLog(@"The receipt file doesn't exist!");
		return NO;
	}

	/**
	 * 2. Check if the bundle version/identifier match up to reality.
	 */

	// Hard code bundle version and bundle identifier for security reasons
	NSString *hardcodedBundleVersion = @"1.0.0";
	NSString *hardcodedBundleIdentifer = @"com.midwesternmac.visibility";

	// Set up variables for the reported version/identifier
	NSString *reportedBundleVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
	NSString *reportedBundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];

	// Check if the two bundle info strings match up to our hardcoded strings.
	if(![hardcodedBundleVersion isEqualToString:reportedBundleVersion])
	{
		NSLog(@"%@", reportedBundleVersion);
		NSLog(@"The info file is incorrect!");
		return NO;
	}
	if(![hardcodedBundleIdentifer isEqualToString:reportedBundleIdentifier])
	{
		NSLog(@"%@", reportedBundleIdentifier);
		NSLog(@"The info file is incorrect!");
		return NO;
	}

	return YES;

}

@end
