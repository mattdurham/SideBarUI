//
//  SideBarViewController.m
//  SidebarUI
//
//  Created by Matthew Durham on 1/16/13.
//  Copyright (c) 2013 Matthew Durham. All rights reserved.
//

#import "SideBarViewController.h"

@interface SideBarViewController ()

@end

@implementation SideBarViewController

- (void) loadView
{
    NSLog(@"Output");
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        [NSTimer scheduledTimerWithTimeInterval:5
                                          target:self
                                        selector:@selector(fadeIn:)
                                        userInfo:nil
                                        repeats:NO] ;
    }
    
    return self;
}
         
         -(void) fadeIn
{
             NSLog(@"Test");
         }

@end
