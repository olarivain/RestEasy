//
//  NSDictionary+NilSafe.m
//  RestEasy
//
//  Created by Olivier Larivain on 11/10/13.
//  Copyright (c) 2013 kra. All rights reserved.
//

#import "NSDictionary+NilSafe.h"

@implementation NSDictionary (NilSafe)

- (id) rez_objectForKey: (id) aKey {
    id obj = [self objectForKey:aKey];
    
    if(obj == [NSNull null]) {
        return nil;
    }
	
	// our servers will return <null> instead of an actual JSON null, so deal with this here
	if([obj isKindOfClass: NSString.class] && [(NSString *) obj isEqualToString: @"<null>"]) {
		return nil;
	}
	
    return obj;
}

@end

@implementation NSMutableDictionary (NilSafe)

- (void)rez_setObject:(id)obj forKey:(id)aKey {
    // skip nils and NSNull
    if(obj == nil || obj == [NSNull null] || aKey == nil) {
        return;
    }
    
    [self setObject:obj forKey:aKey];
}
@end