//
//  NSArray+NilBoundSafe.m
//  RestEasy
//
//  Created by Olivier Larivain on 11/10/13.
//  Copyright (c) 2013 kra. All rights reserved.
//

#import "NSArray+NilBoundSafe.h"

@implementation NSArray (BoundSafe)

- (id)rez_objectAtIndex:(NSInteger) index
{
    if(index < 0 || index >= self.count)
    {
        return nil;
    }
    
    return [self objectAtIndex: index];
}

@end

@implementation NSMutableArray (NullSafe)

- (void)rez_addObject:(id)object
{
    if(object == nil || object == [NSNull null])
    {
        return;
    }
    
    [self addObject: object];
}

@end

@implementation NSMutableSet (NullSafe)

- (void)rez_addObject:(id)object
{
    if(object == nil || object == [NSNull null])
    {
        return ;
    }
    
    [self addObject: object];
}

@end
