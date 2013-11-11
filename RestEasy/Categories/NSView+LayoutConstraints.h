//
//  NSView+LayoutConstraints.h
//  RestEasy
//
//  Created by Olivier Larivain on 11/10/13.
//  Copyright (c) 2013 kra. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSView (LayoutConstraints)

@property (nonatomic, readonly) NSLayoutConstraint *rez_topConstraint;
@property (nonatomic, readonly) NSLayoutConstraint *rez_bottomConstraint;
@property (nonatomic, readonly) NSLayoutConstraint *rez_heightConstraint;
@property (nonatomic, readonly) NSLayoutConstraint *rez_widthConstraint;

@property (nonatomic, readonly) NSLayoutConstraint *rez_leadingConstraint;
@property (nonatomic, readonly) NSLayoutConstraint *rez_trailingConstraint;

@property (nonatomic, readonly) NSLayoutConstraint *rez_verticalCenteringConstraint;
@property (nonatomic, readonly) NSLayoutConstraint *rez_horizontalCenteringConstraint;

@end
