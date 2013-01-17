//
//  AppDelegate.m
//  SidebarUI
//
//  Created by Matthew Durham on 1/3/13.
//  Copyright (c) 2013 Matthew Durham. All rights reserved.
//

#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>
#import "SideBarView.h"


@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
   
}

-(void)awakeFromNib
{
    [self.view setWantsLayer:YES];
    [NSTimer scheduledTimerWithTimeInterval:2
                                     target:self
                                   selector:@selector(fadeIn)
                                   userInfo:nil
                                    repeats:NO]  ;
}

-(void) fadeIn
{
    NSLog(@"Starting fade");
    SideBarView* sView = [[SideBarView alloc] initWithFrame:NSMakeRect(0, 0, 100, 100)];
    [sView setBackground:[NSColor blackColor]];
    //CALayer *viewLayer = [CALayer layer];
    //[viewLayer setBackgroundColor:CGColorCreateGenericRGB(0.0, 0.0, 0.0, 1)]; //RGB plus Alpha Channel
    [sView setWantsLayer:YES]; // view's backing store is using a Core Animation Layer
    //[sView setLayer:viewLayer];
    [NSAnimationContext beginGrouping];
    [[NSAnimationContext currentContext] setDuration:10.0];
    [self.view addSubview:sView];
    [[sView animator] setAlphaValue:0.1];
    [NSAnimationContext endGrouping];

    NSLog(@"Stopping fade");
}





@end
