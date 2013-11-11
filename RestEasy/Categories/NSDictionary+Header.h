//
//  NSDictionary+Header.h
//  RestEasy
//
//  Created by Olivier Larivain on 11/10/13.
//  Copyright (c) 2013 kra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Header)

+ (NSDictionary *) rez_dictionaryFromHeaderString: (NSString *) headers;

@end
