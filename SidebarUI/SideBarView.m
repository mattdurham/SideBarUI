//
//  SideBarView.m
//  SidebarUI
//
//  Created by Matthew Durham on 1/16/13.
//  Copyright (c) 2013 Matthew Durham. All rights reserved.
//

#import "SideBarView.h"

@implementation SideBarView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    [_background set];
    NSRectFill([self bounds]);
}

-(void)setBackground:(NSColor *)aColor
{
    if([_background isEqual:aColor]) return;
    
    //This is the most crucial thing you're missing: make the view redraw itself
    [self setNeedsDisplay:YES];
}

@end
