//
//  NSView+LayoutConstraints.m
//  RestEasy
//
//  Created by Olivier Larivain on 11/10/13.
//  Copyright (c) 2013 kra. All rights reserved.
//

#import "NSView+LayoutConstraints.h"

@implementation NSView (LayoutConstraints)

#pragma mark - convenience accessors on common constraints
- (NSLayoutConstraint *) rez_topConstraint {
	
	NSArray *internalConstraints = self.superview.constraints;
	for(NSLayoutConstraint *constraint in internalConstraints) {
		// constraint affects self AND top, on either side of the constraint
		BOOL matches = (constraint.firstItem == self && constraint.firstAttribute == NSLayoutAttributeTop)
		|| (constraint.secondItem == self && constraint.secondAttribute == NSLayoutAttributeTop);
		if (matches) {
			return constraint;
		}
	}
    
	return nil;
}

- (NSLayoutConstraint *) rez_bottomConstraint {
	NSArray *internalConstraints = self.superview.constraints;
	for(NSLayoutConstraint *constraint in internalConstraints) {
		// constraint affects self AND top, on either side of the constraint
		BOOL matches = (constraint.firstItem == self && constraint.firstAttribute == NSLayoutAttributeBottom)
		|| (constraint.secondItem == self && constraint.secondAttribute == NSLayoutAttributeBottom);
		if (matches) {
			return constraint;
		}
	}
	return nil;
}

- (NSLayoutConstraint *) rez_heightConstraint {
	NSArray *internalConstraints = self.constraints;
	for(NSLayoutConstraint *constraint in internalConstraints) {
		// constraint affects self AND top, on either side of the constraint
		BOOL matches = (constraint.firstItem == self && constraint.firstAttribute == NSLayoutAttributeHeight)
		|| (constraint.secondItem == self && constraint.secondAttribute == NSLayoutAttributeHeight);
		if (matches) {
			return constraint;
		}
	}
	return nil;
    
}

- (NSLayoutConstraint *) rez_widthConstraint {
	NSArray *internalConstraints = self.constraints;
	for(NSLayoutConstraint *constraint in internalConstraints) {
		// constraint affects self AND top, on either side of the constraint
		BOOL matches = (constraint.firstItem == self && constraint.firstAttribute == NSLayoutAttributeWidth)
		|| (constraint.secondItem == self && constraint.secondAttribute == NSLayoutAttributeWidth);
		if (matches) {
			return constraint;
		}
	}
	return nil;
}

- (NSLayoutConstraint *) rez_leadingConstraint {
	NSArray *internalConstraints = self.superview.constraints;
	for(NSLayoutConstraint *constraint in internalConstraints) {
		// constraint affects self AND top, on either side of the constraint
		BOOL matches = (constraint.firstItem == self && constraint.firstAttribute == NSLayoutAttributeLeading)
		|| (constraint.secondItem == self && constraint.secondAttribute == NSLayoutAttributeLeading);
		if (matches) {
			return constraint;
		}
	}
	return nil;
    
}

- (NSLayoutConstraint *) rez_trailingConstraint {
	NSArray *internalConstraints = self.superview.constraints;
	for(NSLayoutConstraint *constraint in internalConstraints) {
		// constraint affects self AND top, on either side of the constraint
		BOOL matches = (constraint.firstItem == self && constraint.firstAttribute == NSLayoutAttributeTrailing)
		|| (constraint.secondItem == self && constraint.secondAttribute == NSLayoutAttributeTrailing);
		if (matches) {
			return constraint;
		}
	}
	return nil;
}

- (NSLayoutConstraint *) rez_verticalCenteringConstraint {
	NSArray *internalConstraints = self.superview.constraints;
	for(NSLayoutConstraint *constraint in internalConstraints) {
		// constraint affects self AND top, on either side of the constraint
		BOOL matches = (constraint.firstItem == self && constraint.firstAttribute == NSLayoutAttributeCenterY)
		|| (constraint.secondItem == self && constraint.secondAttribute == NSLayoutAttributeCenterY);
		if (matches) {
			return constraint;
		}
	}
	return nil;
}

- (NSLayoutConstraint *) rez_horizontalCenteringConstraint {
	NSArray *internalConstraints = self.superview.constraints;
	for(NSLayoutConstraint *constraint in internalConstraints) {
		// constraint affects self AND top, on either side of the constraint
		BOOL matches = (constraint.firstItem == self && constraint.firstAttribute == NSLayoutAttributeCenterX)
		|| (constraint.secondItem == self && constraint.secondAttribute == NSLayoutAttributeCenterX);
		if (matches) {
			return constraint;
		}
	}
	return nil;
}


@end
