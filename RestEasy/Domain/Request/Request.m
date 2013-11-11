//
//  Request.m
//  RestEasy
//
//  Created by Olivier Larivain on 11/10/13.
//  Copyright (c) 2013 kra. All rights reserved.
//

#import "Request.h"

@implementation Request

+ (Request *) requestWithURL: (NSURL *) url method: (RequestMethod) method headers: (NSDictionary *) headers body: (id) body
{
    return [[self alloc] initWithURL: url method: method headers: headers body: body];
}

+ (NSString *) stringFromMethod: (RequestMethod) method
{
    switch (method) {
        case GET:
            return @"GET";
            break;
        case POST:
            return @"POST";
            break;
        case PUT:
            return @"PUT";
            break;
        case DELETE:
            return @"DELETE";
            break;
        case HEAD:
            return @"HEAD";
            break;
        default:
            break;
    }
    return nil;
}

- (id) initWithURL: (NSURL *) url method: (RequestMethod) method headers: (NSDictionary *) headers body: (id) body
{
	self = [super init];
    if(self)
    {
        NSAssert(url != nil, @"URL can't be nil");
        self.url = url;
        self.method = method;
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

- (NSString *) description
{
    NSMutableString *theDescription = [NSMutableString stringWithFormat:@"URL: %@\n", _url.absoluteString];
    [theDescription appendFormat: @"Method: %@\n", [Request stringFromMethod: _method]];
    [theDescription appendFormat: @"Headers: %@", _headers];
    [theDescription appendFormat: @"Body: %@", [[NSString alloc] initWithData: _body encoding: NSUTF8StringEncoding]];
    
    return theDescription;
}

@end
