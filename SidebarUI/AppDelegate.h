//
//  AppDelegate.h
//  SidebarUI
//
//  Created by Matthew Durham on 1/3/13.
//  Copyright (c) 2013 Matthew Durham. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSViewController <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
-(void) fadeIn;
@end
