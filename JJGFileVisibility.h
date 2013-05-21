//
//  JJGFileVisibility.h
//
//  Created by Jeff Geerling on 1/7/11.
//  Copyright 2013 Midwestern Mac, LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface JJGFileVisibility : NSObject {
    IBOutlet id workingSpinner;
}
- (IBAction)hideInvisible:(id)sender;
- (IBAction)showInvisible:(id)sender;
- (void)showOrHideFiles:(NSString *)showOrHide;
- (void)restartFinder;
@end
