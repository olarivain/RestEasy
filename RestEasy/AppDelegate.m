//
//  AppDelegate.m
//  RestEasy
//
//  Created by Olivier Larivain on 11/10/13.
//  Copyright (c) 2013 kra. All rights reserved.
//

#import "AppDelegate.h"

#import "MainWindowController.h"

@interface AppDelegate ()
@property (nonatomic) IBOutlet MainWindowController *mainWindowController;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	self.mainWindowController = [[MainWindowController alloc] initWithWindowNibName: @"MainWindowController"];
	self.window = self.mainWindowController.window;
}

@end
