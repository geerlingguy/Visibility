//
//  VisibilityAppDelegate.h
//  Visibility
//
//  Created by Jeff Geerling on 1/6/11.
//  Copyright 2011 Midwestern Mac, LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface VisibilityAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
