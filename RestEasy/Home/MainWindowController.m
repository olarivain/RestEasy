//
//  MainWindowController.m
//  RestEasy
//
//  Created by Olivier Larivain on 11/10/13.
//  Copyright (c) 2013 kra. All rights reserved.
//

#import "MainWindowController.h"

@interface MainWindowController ()
@property (strong) IBOutlet NSDrawer *drawer;


@end

@implementation MainWindowController


-(void)windowDidLoad{
    [self performBlockOnMainQueue:^{
        	[self.drawer open];
    } withDelay: 0.1];
}

@end
