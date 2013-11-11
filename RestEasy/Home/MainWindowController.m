//
//  MainWindowController.m
//  RestEasy
//
//  Created by Olivier Larivain on 11/10/13.
//  Copyright (c) 2013 kra. All rights reserved.
//

#import "MainWindowController.h"

#import "NSDictionary+Header.h"

#import "Request.h"

@interface MainWindowController ()
@property (strong) IBOutlet NSDrawer *drawer;

@property (weak) IBOutlet NSButton *sendButton;
@property (weak) IBOutlet NSButton *cancelButton;

@property (weak) IBOutlet NSTextField *urlTextField;
@property (weak) IBOutlet NSComboBox *metodBox;
@property (weak) IBOutlet NSComboBox *contentTypeBox;
@property (weak) IBOutlet NSComboBox *acceptBox;
@property (unsafe_unretained) IBOutlet NSTextView *requestHeadersTextView;

@property (weak) IBOutlet NSTextField *responseTitle;
@property (weak) IBOutlet NSProgressIndicator *responseActivityIndicator;
@property (unsafe_unretained) IBOutlet NSTextView *responseHeaderTextView;
@property (unsafe_unretained) IBOutlet NSTextView *responseBodyTextView;

@property (nonatomic) Request *request;

@end

@implementation MainWindowController

#pragma mark - View lifecycle
-(void)windowDidLoad{
    [self rez_performBlockOnMainQueue:^{
        	[self.drawer open];
    }
                        withDelay: 0.1];
}

#pragma mark - button
- (IBAction)startRequest:(id)sender {
    // start animation and enable/disable buttons
	[self.responseActivityIndicator startAnimation: sender];
	[self.sendButton setEnabled: NO];
	[self.cancelButton setEnabled: YES];
    
    self.request = [self buildRequest];
    NSLog(@"Request:\n%@", self.request);
}

- (IBAction)cancelRequest:(id)sender {
	[self.responseActivityIndicator stopAnimation: sender];
	
	[self.sendButton setEnabled: YES];
	[self.cancelButton setEnabled: NO];
}

#pragma mark - Request Building
- (Request *) buildRequest {
    NSString *urlString = self.urlTextField.stringValue;
    NSURL *url = [NSURL URLWithString: urlString];
    
    NSInteger selectedMethod = [self.metodBox indexOfSelectedItem];
    RequestMethod method = selectedMethod < 0 ? GET : (RequestMethod) selectedMethod;
    
    NSString *contentType = self.contentTypeBox.stringValue;
    if(contentType == nil) {
        contentType = @"application/json";
    }
    
    NSString *accept = self.acceptBox.stringValue;
    if(accept == nil) {
        accept = @"application/json";
    }
    
    NSDictionary *headers = [NSDictionary rez_dictionaryFromHeaderString: self.requestHeadersTextView.string];
    
    return [Request requestWithURL: url method: method headers: headers body: self.responseBodyTextView.string];
}

@end
