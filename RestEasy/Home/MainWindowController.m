//
//  MainWindowController.m
//  RestEasy
//
//  Created by Olivier Larivain on 11/10/13.
//  Copyright (c) 2013 kra. All rights reserved.
//

#import "MainWindowController.h"

#import "NSDictionary+Header.h"

#import "RequestStore.h"
#import "Request.h"

@interface MainWindowController ()<NSWindowDelegate, NSSplitViewDelegate>
// main views
@property (weak) IBOutlet NSSplitView *splitView;
@property (weak) IBOutlet NSScrollView *projectView;
@property (weak) IBOutlet NSView *restView;

// buttons
@property (weak) IBOutlet NSButton *sendButton;
@property (weak) IBOutlet NSButton *cancelButton;

// input fields
@property (weak) IBOutlet NSTextField *urlTextField;
@property (weak) IBOutlet NSComboBox *metodBox;
@property (weak) IBOutlet NSComboBox *contentTypeBox;
@property (weak) IBOutlet NSComboBox *acceptBox;
@property (unsafe_unretained) IBOutlet NSTextView *requestHeadersTextView;

// output fields
@property (weak) IBOutlet NSTextField *responseTitle;
@property (weak) IBOutlet NSTextField *successLabel;
@property (weak) IBOutlet NSTextField *errorLabel;
@property (weak) IBOutlet NSProgressIndicator *responseActivityIndicator;
@property (unsafe_unretained) IBOutlet NSTextView *responseHeaderTextView;
@property (unsafe_unretained) IBOutlet NSTextView *responseBodyTextView;

// internal state
@property (nonatomic) Request *request;

@end

@implementation MainWindowController

#pragma mark - View lifecycle
-(void)windowDidLoad{
    [super windowDidLoad];
	
    // setup the request
    self.request = [RequestStore sharedInstance].currentRequest;
    
    // set the drop downs to decent default values
    [self.metodBox selectItemAtIndex: self.request.method - 1];
    [self.contentTypeBox selectItemWithObjectValue: self.request.contentType];
    [self.acceptBox selectItemWithObjectValue: self.request.accept];
    [self.requestHeadersTextView setString: self.request.headersString];
}

#pragma mark - button
- (IBAction)startRequest:(id)sender {
    // start animation and enable/disable buttons
	[self.responseActivityIndicator startAnimation: sender];
	[self.sendButton setEnabled: NO];
	[self.cancelButton setEnabled: YES];
    
    NSLog(@"Request:\n%@", self.request);
}

- (IBAction)cancelRequest:(id)sender {
	[self.responseActivityIndicator stopAnimation: sender];
	
	[self.sendButton setEnabled: YES];
	[self.cancelButton setEnabled: NO];
}

#pragma mark - NSWindowDelegate

#define PROJECT_MIN_WIDTH 192
#define REST_MIN_WIDTH 480

-(CGSize)windowWillResize:(NSWindow *)sender toSize:(NSSize)frameSize
{
    CGFloat minWidth = PROJECT_MIN_WIDTH + REST_MIN_WIDTH;
    minWidth += self.splitView.dividerThickness;
    
    if(frameSize.width <= minWidth) {
        return CGSizeMake(minWidth, frameSize.height);
    }
    
    return frameSize;
}

#pragma mark - NSSplitViewdDelegate
- (BOOL) splitView:(NSSplitView *)splitView shouldAdjustSizeOfSubview:(NSView *)view
{
    // prevent the left pane from resizing when the divider is moved around
	return view == [splitView.subviews rez_objectAtIndex: 1];
}

-(CGFloat)splitView:(NSSplitView *)splitView constrainSplitPosition:(CGFloat)proposedPosition ofSubviewAt:(NSInteger)dividerIndex
{
    // make sure the split view honors the rest view's min width
    CGFloat maxPosition = self.window.frame.size.width - REST_MIN_WIDTH;
    maxPosition -= self.splitView.dividerThickness;
    
    CGFloat minPosition = PROJECT_MIN_WIDTH;
    minPosition += self.splitView.dividerThickness;
    
    if(proposedPosition <= minPosition) {
        return minPosition;
    }
    
    if(maxPosition <= proposedPosition) {
        return maxPosition;
    }
    
    return proposedPosition;
}

@end
