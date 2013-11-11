//
//  NSDictionary+Header.m
//  RestEasy
//
//  Created by Olivier Larivain on 11/10/13.
//  Copyright (c) 2013 kra. All rights reserved.
//

#import "NSDictionary+Header.h"

@implementation NSDictionary (Header)

+ (NSDictionary *) rez_dictionaryFromHeaderString: (NSString *) headers
{
    NSString *processedHeaders = [headers stringByReplacingOccurrencesOfString: @"\r" withString: @""];
    NSArray *components = [processedHeaders componentsSeparatedByString: @"\n"];
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithCapacity: components.count];
    for(NSString *component in components)
    {
        NSArray *headerComponents = [component componentsSeparatedByString:@":"];
        NSString *key = [headerComponents rez_objectAtIndex: 0];
        key = [key stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        NSString *value = [headerComponents rez_objectAtIndex: 1];
        value = [value  stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        [dictionary rez_setObject: key forKey: value];
    }
    
    return [NSDictionary dictionaryWithDictionary: dictionary];
}

@end
