//
//  Request.m
//  RestEasy
//
//  Created by Olivier Larivain on 11/10/13.
//  Copyright (c) 2013 kra. All rights reserved.
//

#import "Request.h"

@implementation Request

- (id) initWithURL: (NSURL *) url headers: (NSDictionary *) headers body: (id) body
{
	self = [super init];
    if(self)
    {
        NSAssert(url != nil, @"URL can't be nil");
        self.url = url;
        self.headers = headers;
        
        BOOL bodyIsData = [body isKindOfClass: NSData.class];
        BOOL bodyIsString = [body isKindOfClass: NSString.class];
        NSAssert(bodyIsData || bodyIsString, @"Body must be either a string or a data");
        
        if(bodyIsData) {
            self.body = (NSData *) body;
        } else {
            self.body = [(NSString *) body dataUsingEncoding: NSUTF8StringEncoding];
        }
    }
    
    return self;
}

@end
