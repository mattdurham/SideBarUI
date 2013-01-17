//
//  KORSideBarItem.m
//  SidebarUI
//
//  Created by Matthew Durham on 1/3/13.
//  Copyright (c) 2013 Matthew Durham. All rights reserved.
//

#import "KORSideBarItem.h"



#define DEFAULT_inset 2
#define DEFAULT_stripeWidth 20

#define DEFAULT_barColor [NSColor colorWithCalibratedRed:25.0/255.0 green:29.0/255.0 blue:33.0/255.0 alpha:1.0]
#define DEFAULT_lighterProgressColor [NSColor colorWithCalibratedRed:223.0/255.0 green:237.0/255.0 blue:180.0/255.0 alpha:1.0]
#define DEFAULT_darkerProgressColor [NSColor colorWithCalibratedRed:156.0/255.0 green:200.0/255.0 blue:84.0/255.0 alpha:1.0]
#define DEFAULT_lighterStripeColor [NSColor colorWithCalibratedRed:182.0/255.0 green:216.0/255.0 blue:86.0/255.0 alpha:1.0]
#define DEFAULT_darkerStripeColor [NSColor colorWithCalibratedRed:126.0/255.0 green:187.0/255.0 blue:55.0/255.0 alpha:1.0]
#define DEFAULT_shadowColor [NSColor colorWithCalibratedRed:223.0/255.0 green:238.0/255.0 blue:181.0/255.0 alpha:1.0]

#define DEFAULT_whiteColor [NSColor colorWithCalibratedRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0]
#define DEFAULT_blackColor [NSColor colorWithCalibratedRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0]
#define DEFAULT_greyColor [NSColor colorWithCalibratedRed:128/255.0 green:128/255.0 blue:128/255.0 alpha:1.0]
#define DEFAULT_darkGreyColor [NSColor colorWithCalibratedRed:170/255.0 green:170/255.0 blue:170/255.0 alpha:1.0]



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
        self.progressOffset = 0;
        //[self.layer setBorderColor:[[NSColor grayColor] CGColor]];
    }
    [self startAnimation:self];
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    // Drawing code here.
    /*[self setWantsLayer:YES];
    self.layer.borderWidth = 100.0f;
    [self.layer setBorderColor:CGColorCreateGenericRGB(66, 66, 66, 1.0)];*/
    self.progressOffset = ( self.progressOffset > ( 2 * DEFAULT_stripeWidth ) - 1) ? 0 : ++self.progressOffset;
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
    NSRect fillRect = NSMakeRect(leftPointX , leftPointY + (LINE_WIDTH / 2), dirtyRect.size.width - ( LINE_WIDTH  ), (dirtyRect.size.height * .20) - (LINE_WIDTH));
    if(false)
    {
        [[self successColor] set];
    }
    else if(false)
    {
        [[self failureColor] set];
    }
    else if(true)
    {
        
        [self drawProgressWithBounds:fillRect];
        [self drawStripesInBounds:fillRect];
        [self drawShadowInBounds:fillRect];

    }
    else if(false)
    {
        [[self idleColor] set];
    }
    if(false)
    {
        
        NSRectFill(fillRect);
    }
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

#pragma mark Drawing

-(void)drawShadowInBounds:(NSRect)bounds
{
    [DEFAULT_shadowColor set];
    
    NSBezierPath* shadow = [NSBezierPath bezierPath];
    
    [shadow moveToPoint:NSMakePoint(0, 2)];
    [shadow lineToPoint:NSMakePoint(NSWidth(bounds), 2)];
    
    [shadow stroke];
}

-(NSBezierPath*)stripeWithOrigin:(NSPoint)origin bounds:(NSRect)frame
{
    
    float height = frame.size.height;
    
    NSBezierPath* rect = [[NSBezierPath alloc] init];
    
    [rect moveToPoint:origin];
    [rect lineToPoint:NSMakePoint(origin.x + DEFAULT_stripeWidth, origin.y)];
    [rect lineToPoint:NSMakePoint(origin.x + DEFAULT_stripeWidth - 8, origin.y + height)];
    [rect lineToPoint:NSMakePoint(origin.x - 8, origin . y + height)];
    [rect lineToPoint:origin];
    
    return rect;
}

-(void)drawStripesInBounds:(NSRect)frame
{
    NSGradient* gradient = [[NSGradient alloc] initWithStartingColor:DEFAULT_blackColor endingColor:DEFAULT_blackColor];
    NSBezierPath* allStripes = [[NSBezierPath alloc] init];
    //We need to create an initial stripe also
    if(self.progressOffset  - DEFAULT_stripeWidth > 0)
    {
        //We multiply by 2 since the first division would only give us the rightmost point when we want the left most point origin
        [allStripes appendBezierPath:[self stripeWithOrigin:NSMakePoint( self.progressOffset  - (DEFAULT_stripeWidth * 2 ) , (self.frame.size.height * .80) ) bounds:frame]];
    }
    NSInteger maxValue = frame.size.width / ( 2 * DEFAULT_stripeWidth ) + ( 2 * DEFAULT_stripeWidth );
    for (int i = 0; i <= maxValue ; i++)
    {
        NSBezierPath* stripe = [self stripeWithOrigin:NSMakePoint( i * 2 * DEFAULT_stripeWidth + self.progressOffset , (self.frame.size.height * .80) ) bounds:frame];
        [allStripes appendBezierPath:stripe];
    }
   
    [gradient drawInBezierPath:allStripes angle:90];
    
}

-(void)drawProgressWithBounds:(NSRect)frame
{
    NSBezierPath* bounds = [NSBezierPath bezierPathWithRect:frame];
    NSGradient* gradient = [[NSGradient alloc] initWithStartingColor:DEFAULT_darkGreyColor endingColor:DEFAULT_darkGreyColor];
    [gradient drawInBezierPath:bounds angle:90];
}

-(void)startAnimation:(id)sender
{
    if (!self.animator)
    {
        self.animator = [NSTimer scheduledTimerWithTimeInterval:1.0/30 target:self selector:@selector(activateAnimation:) userInfo:nil repeats:YES];
    }
}


-(void)activateAnimation:(NSTimer*)timer
{
    [self setNeedsDisplay:YES];
}


#pragma mark -

@end
