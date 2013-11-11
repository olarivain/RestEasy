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

@interface MainWindowController ()<NSSplitViewDelegate>
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
	
//	[self.splitView setHoldingPriority: NSLayoutPriorityDragThatCanResizeWindow forSubviewAtIndex: 0];
    
    [self.metodBox selectItemAtIndex: 0];
    [self.contentTypeBox selectItemAtIndex: 0];
    [self.acceptBox selectItemAtIndex: 0];
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
    
    NSDictionary *headers = [NSDictionary rez_dictionaryFromHeaderString: self.requestHeadersTextView.string];
    return [Request requestWithURL: url method: method headers: headers body: self.responseBodyTextView.string];
}

#pragma mark - NSSplitViewdDelegate
- (BOOL) splitView:(NSSplitView *)splitView shouldAdjustSizeOfSubview:(NSView *)view
{
	return view == [splitView.subviews rez_objectAtIndex: 1];
}

-(CGFloat)splitView:(NSSplitView *)splitView constrainSplitPosition:(CGFloat)proposedPosition ofSubviewAt:(NSInteger)dividerIndex {
    // make sure the split view honors the rest view's min width
    CGFloat maxPosition = self.window.frame.size.width - self.restView.rez_widthConstraint.constant;
    if(maxPosition <= proposedPosition) {
        return maxPosition;
    }
    
    return proposedPosition;
}

@end
