//
//  NSObject+Block.h
//  RestEasy
//
//  Created by Olivier Larivain on 11/10/13.
//  Copyright (c) 2013 kra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Block)
- (void) performBlockOnMainQueue: (VoidBlock) block
					   withDelay: (NSTimeInterval) delay;
@end
