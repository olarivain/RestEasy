//
//  Request.h
//  RestEasy
//
//  Created by Olivier Larivain on 11/10/13.
//  Copyright (c) 2013 kra. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Header;

typedef enum RequestMethod{
    RequestMethodUnknown = 0,
    RequestMethodGet = 1,
    RequestMethodPost = 2,
    RequestMethodPut = 3,
    RequestMethodDelete = 4,
    RequestMethodHead = 5
} RequestMethod;

@interface Request : NSObject
{
    __strong NSMutableArray *_headers;
}

+ (Request *) request;

@property (nonatomic) NSURL *url;
@property (nonatomic) RequestMethod method;
@property (nonatomic, readonly) NSArray *headers;
@property (nonatomic) NSData *body;

@property (nonatomic) NSString *contentType;
@property (nonatomic) NSString *accept;

@property (nonatomic, readonly) NSDictionary *headersDictionary;
@property (nonatomic, readonly) NSString *headersString;

@end
