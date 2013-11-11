//
//  NSArray+NilBoundSafe.h
//  RestEasy
//
//  Created by Olivier Larivain on 11/10/13.
//  Copyright (c) 2013 kra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (BoundSafe)
- (id)rez_objectAtIndex:(NSInteger)index;
@end

@interface NSMutableArray (NullSafe)
- (void)rez_addObject:(id)object;
@end

@interface NSMutableSet (NullSafe)
- (void)rez_addObject:(id)object;
@end