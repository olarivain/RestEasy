//
//  NSDictionary+NilSafe.h
//  RestEasy
//
//  Created by Olivier Larivain on 11/10/13.
//  Copyright (c) 2013 kra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (NilSafe)

- (id) rez_objectForKey: (id) aKey;

@end

@interface NSMutableDictionary (NilSafe)
- (void)rez_setObject:(id)obj forKey:(id)aKey;
@end