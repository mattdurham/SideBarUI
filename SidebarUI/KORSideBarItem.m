//
//  KORSideBarItem.m
//  SidebarUI
//
//  Created by Matthew Durham on 1/3/13.
//  Copyright (c) 2013 Matthew Durham. All rights reserved.
//

#import "KORSideBarItem.h"

@implementation KORSideBarItem

CGFloat const LINE_WIDTH = 3.0f;

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setWantsLayer:YES];
        self.layer.borderWidth = LINE_WIDTH;
        [self.layer setBorderColor:CGColorCreateGenericRGB(.25, .25, .25, 1.0)];
        [self.layer setBackgroundColor:CGColorCreateGenericRGB(0.4745098039, 0.4745098039, 0.4745098039, 1.0)];
        //[self.layer setBorderColor:[[NSColor grayColor] CGColor]];
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    // Drawing code here.
    /*[self setWantsLayer:YES];
    self.layer.borderWidth = 100.0f;
    [self.layer setBorderColor:CGColorCreateGenericRGB(66, 66, 66, 1.0)];*/
    [self drawLowerBox:dirtyRect];
    
}

- (void) drawLowerBox:(NSRect) dirtyRect
{
    CGFloat leftPointX = 0;
    CGFloat leftPointY = dirtyRect.size.height * .80;
    CGFloat rightPointX = dirtyRect.size.width;
    CGFloat rightPointY = leftPointY;
    NSPoint leftPoint = NSMakePoint(leftPointX, leftPointY);
    NSPoint rightPoint = NSMakePoint(rightPointX, rightPointY);
    [[NSColor colorWithCGColor:CGColorCreateGenericRGB(.25, .25, .25, 1.0)] set];
    [NSBezierPath setDefaultLineWidth:LINE_WIDTH];
    [NSBezierPath strokeLineFromPoint:leftPoint toPoint:rightPoint];
    if(false)
    {
        [[self successColor] set];
       
    }
    else if(true)
    {
        [[self failureColor] set];
    }
    else if(true)
    {
        [[self inProgressColor] set];
    }
    else if(true)
    {
        [[self idleColor] set];
    }
    NSRect fillRect = NSMakeRect(leftPointX , leftPointY + (LINE_WIDTH / 2), dirtyRect.size.width - ( LINE_WIDTH  ), (dirtyRect.size.height * .80) - (LINE_WIDTH));
    NSRectFill(fillRect);
}

- (NSColor*) successColor
{
    return [NSColor colorWithCGColor:CGColorCreateGenericRGB(0.2509803922, 0.4666666667, 0.2588235294, 1.0)];
}


- (NSColor*) failureColor
{
    return [NSColor colorWithCGColor:CGColorCreateGenericRGB(0.5803921569, 0.1490196078, 0, 1.0)];
}


- (NSColor*) inProgressColor
{
    return [NSColor colorWithCGColor:CGColorCreateGenericRGB(0.2509803922, 0.4666666667, 0.2588235294, 1.0)];
}


- (NSColor*) idleColor
{
    return [NSColor colorWithCGColor:CGColorCreateGenericRGB(0.4745098039, 0.4745098039, 0.4745098039, 1.0)];
}

- (BOOL) isFlipped
{
    return YES;
}

@end
